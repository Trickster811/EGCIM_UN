import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const primaryColor = Color.fromARGB(255, 10, 88, 151);

class UtilFunctions {
  static late SharedPreferences _preferences;

  static Future setFirstTime(bool firstTime) async {
    await _preferences.setBool('firstTime', firstTime);
  }

  static bool? getFirstTime() => _preferences.getBool('firstTime');

  static Future setUserInfo(List<String> userInfo) async {
    await _preferences.setStringList('userInfo', userInfo);
  }

  static List<String>? getUserInfo() => _preferences.getStringList('userInfo');

  static saveDocument({required String name, required document}) async {
    Directory? directory;

    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = Directory('/sdcard/Ndere Ads/App Images');
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getApplicationDocumentsDirectory();
        }
      }

      if (document != String) {
        final bytes = await document.save();
        final file = File("${directory!.path}/$name");

        await file.writeAsBytes(bytes);
        return file;
      }
      final fileSaved = File("${directory!.path}/$name");

      return File(document).copy(fileSaved.path);
    } catch (e) {}
  }

  static Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      await appFolder();
      return true;
    } else {
      final result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static appFolder() async {
    final Directory documentDirectory =
        Directory('/sdcard/Ndere Ads/App Documents');
    final Directory imageDirectory = Directory('/sdcard/Ndere Ads/App Images');

    final status = await Permission.storage.request();

    if (status == PermissionStatus.granted) {
      if (!await Directory('/sdcard/Ndere Ads').exists()) {
        await Directory('/sdcard/Ndere Ads').create(recursive: true);
      }
      if (!await imageDirectory.exists()) {
        imageDirectory.create(recursive: true);
      }
      if (!await documentDirectory.exists()) {
        documentDirectory.create(recursive: true);
      }
    } else {
      print('Denied');
    }
  }

  static baseNameProvider(path) {
    return basename(
        path); // This function return the the basename path of a file.
  }

  static selectFile(List<String>? allowedExtensions) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );
    if (result == null) return;
    final path = result.files.single.path!;
    return File(path);
  }

  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  //Firebase Functions for files uploading
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  static Future downloadFiles(Reference ref) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/${ref.name}');

    await ref.writeToFile(file);
  }

  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      // print(e);
      return null;
    }
  }

  //Functions for files operations
  Future<void> launchUrls(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
      webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'},
      ),
    );
  }

  Future<File?> downloadFile(
      BuildContext context, String url, String name) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File('${appStorage.path}/$name');

      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(milliseconds: 500),
        ),
      );

      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);
      await ref.close();

      return file;
    } catch (e) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text(
            'Oups!!',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          message: const Text(
            'Désolé!!! Une erreur est survenue\nVérifiez votre accès à Internet et réessayez.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              // onPressed: () => imageGallerypicker(ImageSource.camera, context),
              onPressed: () {
                Navigator.of(context).pop();
                openFile(
                  context,
                  url,
                  baseNameProvider(url),
                );
              },
              child: const Text('Réessayer'),
            ),
            CupertinoActionSheetAction(
              // onPressed: () => imageGallerypicker(ImageSource.camera, context),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
          ],
        ),
      );
    }
  }

  Future openFile(BuildContext context, String url, String? fileName) async {
    final file = await downloadFile(context, url, fileName!);
    if (file == null) return;
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text(
          'Bien Joué!!',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'ArialRoundedBold',
          ),
        ),
        message: const Text(
          'Le document a été bien téléchargé et stocké dans votre smartphone.\nOuvrez le maintenant',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'ArialRoundedBold',
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PdfViewerScreen(pdfFile: file),
              //   ),
              // );
            },
            child: const Text('Ouvrir'),
          ),
        ],
      ),
    );
  }
}

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile({
    required this.ref,
    required this.name,
    required this.url,
  });
}
