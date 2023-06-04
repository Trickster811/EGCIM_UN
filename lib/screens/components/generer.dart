import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfParagraphApi {
  static Future<File> generateLetter(userData_1) async {
    final pdf = Document();

    final imgHead = MemoryImage(
      (await rootBundle.load('assets/images/letter_of_recommandation_head.png'))
          .buffer
          .asUint8List(),
    );

    // final imgLogo = MemoryImage(
    //   (await rootBundle.load('assets/images/logo_iut_1.png'))
    //       .buffer
    //       .asUint8List(),
    // );

    DateTime now = DateTime.now();
    final customFont = Font.ttf(
      await rootBundle.load('assets/fonts/COMICREGULAR.TTF'),
    );
    final customFont1 = Font.ttf(
      await rootBundle.load('assets/fonts/COMICBOLD.ttf'),
    );

    final _month = [
      ' ',
      'Janvier',
      'Fevrier',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Aout',
      'Septembre',
      'Octobre',
      'Novembre',
      'Decembre'
    ];

    pdf.addPage(
      Page(
        pageFormat: const PdfPageFormat(
          21.0 * PdfPageFormat.cm,
          29.7 * PdfPageFormat.cm,
          marginAll: 1.5 * PdfPageFormat.cm,
        ),
        build: (context) => Column(
          children: [
            // Header(
            //   child: Text('My headline'),
            // ),
            Positioned(
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    imgHead,
                    width: double.maxFinite,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'N/Ref.:________________/UN/D-EGCIM/DSES',
                  // /${now.year.toString().substring(2)}',
                  style: TextStyle(
                    font: customFont1,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Le Chef de Division',
                  style: TextStyle(
                    font: customFont1,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Ngaoundéré, le ${now.day} ${_month[now.month]} ${now.year}.',
                  style: TextStyle(
                    font: customFont,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 0.5, right: 50),
              child: Column(
                children: [
                  userData_1[11].toString().contains('Directeur')
                      ? Column(children: [
                          Text(
                            "à".toUpperCase(),
                            style: TextStyle(
                              font: customFont1,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Monsieur ${userData_1[11]}",
                            style: TextStyle(font: customFont, fontSize: 12),
                          ),
                        ])
                      : userData_1[11].toString().contains('Directrice')
                          ? Column(children: [
                              Text(
                                "à".toUpperCase(),
                                style: TextStyle(
                                  font: customFont1,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Madame ${userData_1[11]}",
                                style: TextStyle(
                                  font: customFont,
                                  fontSize: 12,
                                ),
                              ),
                            ])
                          : Column(
                              children: [
                                Text(
                                  "Au",
                                  style:
                                      TextStyle(font: customFont, fontSize: 12),
                                ),
                                Text(
                                  "${userData_1[11]}",
                                  style:
                                      TextStyle(font: customFont, fontSize: 12),
                                ),
                              ],
                            ),
                  Text(
                    " de ${userData_1[8]}",
                    style: TextStyle(font: customFont, fontSize: 12),
                  ),
                  Text(
                    "${userData_1[9]}.",
                    style: TextStyle(
                      font: customFont1,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'OBJET : ',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    font: customFont1,
                  ),
                ),
                Text(
                  "Lettre recommandation pour un stage ${userData_1[5]}",
                  style: TextStyle(font: customFont, fontSize: 12),
                ),
              ],
              // textAlign: TextAlign.justify,
            ),
            // Row(children: [
            //   Text(
            //     "            l'étudiant(e) ${userData_1[0].toString().toUpperCase()} ${userData_1[1].toString().toUpperCase()}",
            //     style: TextStyle(
            //       font: customFont,
            //       fontSize: 12,
            //     ),
            //   ),
            // ]),
            SizedBox(height: 10),
            Row(
              children: [
                userData_1[11].toString().contains('Directeur')
                    ? Text(
                        "              Monsieur ${userData_1[11]},",
                        style: TextStyle(
                          font: customFont,
                          fontSize: 12,
                        ),
                      )
                    : userData_1[11].toString().contains('Directrice')
                        ? Text(
                            "              Madame ${userData_1[11]},",
                            style: TextStyle(
                              font: customFont,
                              fontSize: 12,
                            ),
                          )
                        : userData_1[11].toString().contains('Chef')
                            ? Text(
                                "              Monsieur,",
                                style: TextStyle(
                                  font: customFont,
                                  fontSize: 12,
                                ),
                              )
                            : Text(
                                '             Monsieur le ${userData_1[11]},',
                                style: TextStyle(
                                  font: customFont,
                                  fontSize: 12,
                                ),
                              ),
              ],
            ),
            Column(
              children: [
                Paragraph(
                  textAlign: TextAlign.justify,
                  style: TextStyle(font: customFont, fontSize: 12),
                  text:
                      "            L’Ecole de Génie Chimique et des Industries Minérales (EGCIM) a pour missions de contribuer à la formation initiale et continue, ainsi qu’à la recherche dans les domaines du Génie Chimique et des Industries minérales ; au recyclage et au perfectionnement des professionnels dans les domaines susvisés; et à l’appui au développement, en particulier sous forme de prestation de services et de gestion du développement durable.",
                ),
                Paragraph(
                  textAlign: TextAlign.justify,
                  style: TextStyle(font: customFont, fontSize: 12),
                  text:
                      "             A ce titre, au cours de leur formation, les élèves de l’EGCIM doivent séjourner dans une structure pour renforcer leurs aptitudes professionnelles et maîtriser progressivement l’environnement industriel dans lequel ils sont appelés à s’insérer plus tard. En outre, ces stages sont aussi l’occasion de renforcer les relations institutionnelles entre votre structure et notre école dans un partenariat gagnant-gagnant.",
                ),
                Paragraph(
                  textAlign: TextAlign.justify,
                  style: TextStyle(font: customFont, fontSize: 12),
                  text:
                      "              A cet effet, nous vous recommandons l’élève ingénieur ${userData_1[1]}, sérieux, travailleur et inscrit en ${userData_1[4]} année du cycle des ingénieurs en ${userData_1[2]} : parcours ${userData_1[3]} pour un stage ${userData_1[5]} ${userData_1[6]} qui débutera en ${userData_1[7]}. ",
                ),
                Paragraph(
                  textAlign: TextAlign.justify,
                  style: TextStyle(font: customFont, fontSize: 12),
                  text:
                      "              Compte tenu de ce qui précède et des performances de l'étudiant au cours de son cursus, nous recommandons sans réserve que sa demande de stage soit agréée.",
                ),
                Paragraph(
                  textAlign: TextAlign.justify,
                  style: TextStyle(font: customFont, fontSize: 12),
                  text: userData_1[11].toString().contains('Directrice')
                      ? "              Veuillez agréer, Madame ${userData_1[11]} l'expression de notre parfaite considération."
                      : "              Veuillez agréer, Monsieur ${userData_1[11]} l'expression de notre parfaite considération.",
                ),
              ],
            ),

            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(top: 0.5 * PdfPageFormat.cm),
              child: Text(
                "LE CHEF DE DIVISION",
                style: TextStyle(
                  font: customFont1,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return await saveDocument(
      name:
          'Lettre_de_Recommandation_${userData_1[0]}_${userData_1[1]}_${userData_1[3]}_niveau_${userData_1[4]}_entreprise_${userData_1[8]}.pdf',
      pdf: pdf,
    );
  }

  static Future saveDocument(
      {required String name, required Document pdf}) async {
    Directory? directory;
    // try {
    //   if (await _requestPermission(Permission.storage)) {
    //     directory = await getExternalStorageDirectory();
    //     String newPath = "";
    //     List<String> folders = directory!.path.split("/");
    //     for (var i = 0; i < folders.length; i++) {
    //       String folder = folders[i];
    //       if (folder != "Android") {
    //         newPath += "/" + folder;
    //       } else {
    //         break;
    //       }
    //     }
    //     newPath = newPath + "iyy";
    //     directory = Directory(newPath);
    //   }
    // } catch (e) {}
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = documentDirectory;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getApplicationDocumentsDirectory();
        }
      }
      final bytes = await pdf.save();
      final file = File("${directory!.path}/$name");

      await file.writeAsBytes(bytes);

      return file;
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
}

final Directory documentDirectory =
    Directory('/sdcard/Iut Companion/App Documents');
final Directory imageDirectory = Directory('/sdcard/Iut Companion/App Images');

appFolder() async {
  final status = await Permission.storage.request();

  if (status == PermissionStatus.granted) {
    print('Allowed');

    if (!await Directory('/sdcard/Iut Companion').exists()) {
      await Directory('/sdcard/Iut Companion').create(recursive: true);
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
