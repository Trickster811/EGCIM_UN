import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egcim_un/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class NewIntershipScreen extends StatefulWidget {
  const NewIntershipScreen({super.key});

  @override
  State<NewIntershipScreen> createState() => _NewIntershipScreenState();
}

class _NewIntershipScreenState extends State<NewIntershipScreen> {
  final newIntershipFormKey = GlobalKey<FormState>();
  final newIntershipMatriculeController = TextEditingController();
  final newIntershipNameController = TextEditingController();
  final newIntershipMentionController = TextEditingController();
  final newIntershipParcoursController = TextEditingController();
  final newIntershipCompanyNameController = TextEditingController();
  final newIntershipCompanyCityController = TextEditingController();
  final newIntershipCompanyPhoneController = TextEditingController();
  var newIntershipStartDateController = TextEditingController();
  var newIntershipEndDateController = TextEditingController();
  File? documentFile;
  UploadTask? task;

  newIntership(intershipInfo) async {
    try {
      FirebaseFirestore.instance
          .collection('StudentIntership')
          .doc(intershipInfo[0])
          .set({
        'matricule': intershipInfo[0],
        'name': intershipInfo[1],
        'mention': intershipInfo[2],
        'parcours': intershipInfo[3],
        'companyName': intershipInfo[4],
        'companyTown': intershipInfo[5],
        'companyPhone': intershipInfo[6],
        'startDate': intershipInfo[7],
        'endDate': intershipInfo[8],
        'file': intershipInfo[9],
      }).then(
        (value) => showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: const Text('EGCIM UN'),
            message: const Text(
              "Votre Stage a ete correctement enregistre.",
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              )
            ],
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
          ),
        ),
        title: Image.asset(
          'assets/images/EGCIM-logo.png',
          height: 40,
          width: 40,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: newIntershipFormKey,
            child: Column(
              children: [
                const Text(
                  'Enregistrer Mon Stage',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipMatriculeController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      'Matricule',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipNameController,
                  decoration: const InputDecoration(
                    label: Text(
                      'Nom et Prénom',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipMentionController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text(
                      'Mention',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipParcoursController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      'Parcours',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipCompanyNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      'Nom Entreprise',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipCompanyCityController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      'Ville',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipCompanyPhoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(
                      'Contact Entreprise',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipStartDateController,
                  decoration: InputDecoration(
                    label: const Text(
                      'Date de Début',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final startDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 1),
                        );
                        setState(() {
                          newIntershipStartDateController.text =
                              DateFormat('dd-MM-yyyy').format(
                            startDate!.toLocal(),
                          );
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/calendar.1.svg',
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: newIntershipEndDateController,
                  decoration: InputDecoration(
                    label: const Text(
                      'Date de Fin',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final endDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2024),
                        );
                        setState(() {
                          newIntershipEndDateController.text =
                              DateFormat('dd-MM-yyyy').format(
                            endDate!.toLocal(),
                          );
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/calendar.1.svg',
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner ce champs',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Fichier'),
                Container(
                  height: 160,
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: documentFile == null
                      ? InkWell(
                          onTap: () async {
                            final temporalyFile =
                                await UtilFunctions.selectFile([]);
                            setState(() {
                              documentFile = temporalyFile;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Importer votre document'),
                              const SizedBox(
                                height: 10,
                              ),
                              SvgPicture.asset(
                                'assets/icons/document.2.svg',
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              UtilFunctions.baseNameProvider(
                                  documentFile!.path),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                final temporalyFile =
                                    await UtilFunctions.selectFile([]);
                                setState(() {
                                  documentFile = temporalyFile;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/document.2.svg',
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    const Text(
                                      'Changer',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: primaryColor,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: primaryColor,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: primaryColor,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: primaryColor,
                          width: 2,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child:
                        task != null ? buildUploadStatus(task!) : Container(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    if (!newIntershipFormKey.currentState!.validate()) {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => const CupertinoActionSheet(
                          title: Text(
                            'Attention',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 174, 0),
                              // fontSize: 16,
                            ),
                          ),
                          message: Text(
                            "Veuillez s'il vous plaît vérifier que vous avez renseigné tous les champs",
                          ),
                        ),
                      );
                      return;
                    }
                    await uploadFile();
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: const Text(
                      "Envoyer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future uploadFile() async {
    if (documentFile == null) return;

    // final fileName = UtilFunctions.baseNameProvider(documentFile!.path);
    final destination = newIntershipMatriculeController.text +
        '_' +
        newIntershipNameController.text +
        '_' +
        newIntershipMentionController.text +
        '_' +
        newIntershipParcoursController.text +
        '_' +
        newIntershipCompanyNameController.text;

    task = UtilFunctions.uploadFile(destination, documentFile!);
    setState(() {});

    if (task == null) return;
    final snapshot = await task!.whenComplete(
      () => showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text(
            'Success!!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          message: const Text(
            "Votre fichier a ete charge avec succes.\nVeuillez patienter quelques instants, nous sommes entrain d'enregistrer le stage",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              // onPressed: () => imageGallerypicker(ImageSource.camera, context),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download Link: $urlDownload');
    final intershipInfo = [
      newIntershipMatriculeController.text,
      newIntershipNameController.text,
      newIntershipMentionController.text,
      newIntershipParcoursController.text,
      newIntershipCompanyNameController.text,
      newIntershipCompanyCityController.text,
      newIntershipCompanyPhoneController.text,
      newIntershipStartDateController.text,
      newIntershipEndDateController.text,
      urlDownload,
    ];
    newIntership(intershipInfo);
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final percentage = (progress * 100).toStringAsFixed(1);

          return Text(
            'Status: $percentage %',
            style: const TextStyle(
              fontSize: 14,
            ),
          );
        } else {
          return Container();
        }
      });
}
