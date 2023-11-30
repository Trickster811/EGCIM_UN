import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egcim_un/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class NewSchoolIntershipScreen extends StatefulWidget {
  const NewSchoolIntershipScreen({super.key});

  @override
  State<NewSchoolIntershipScreen> createState() =>
      _NewSchoolIntershipScreenState();
}

class _NewSchoolIntershipScreenState extends State<NewSchoolIntershipScreen> {
  final newIntershipFormKey = GlobalKey<FormState>();
  final newIntershipCompanyNameController = TextEditingController();
  final newIntershipCompanyCityController = TextEditingController();
  final newIntershipCompanyPhoneController = TextEditingController();
  final newIntershipLevel3ChemistryController = TextEditingController();
  final newIntershipLevel4ChemistryController = TextEditingController();
  final newIntershipLevel5ChemistryController = TextEditingController();
  final newIntershipLevel3MineralController = TextEditingController();
  final newIntershipLevel4MineralController = TextEditingController();
  final newIntershipLevel5MineralController = TextEditingController();
  final newIntershipLevel3MaterialsController = TextEditingController();
  final newIntershipLevel4MaterialsController = TextEditingController();
  final newIntershipLevel5MaterialsController = TextEditingController();
  final newIntershipLevel3ControlController = TextEditingController();
  final newIntershipLevel4ControlController = TextEditingController();
  final newIntershipLevel5ControlController = TextEditingController();
  File? documentFile;
  UploadTask? task;

  newSchoolIntership(schoolIntershipInfo) async {
    try {
      FirebaseFirestore.instance
          .collection('SchoolIntership')
          .doc(schoolIntershipInfo[0])
          .set({
        'companyName': schoolIntershipInfo[0],
        'companyTowm': schoolIntershipInfo[1],
        'companyPhone': schoolIntershipInfo[2],
        'Génie_de_Procédés_et_Chimie FinePlaceNumber': schoolIntershipInfo[3],
        'Génie_MinéralPlaceNumber': schoolIntershipInfo[4],
        'Génie_des_MatériauxPlaceNumber': schoolIntershipInfo[5],
        'Génie_Controle_et_InstrumentationPlaceNumber': schoolIntershipInfo[6],
        'file': schoolIntershipInfo[7],
      }).then(
        (value) => showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: const Text('EGCIM UN'),
            message: const Text(
              "Le Stage ecole a ete correctement enregistre.",
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
                  'Enregistrer Stage Ecole',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
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
                const Text('Nombre de Stages Accordés'),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Génie de Procédés et Chimie Fine',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      color: primaryColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 3:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel3ChemistryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 4:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel4ChemistryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 5:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel5ChemistryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Génie Minéral',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      color: primaryColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 3:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel3MineralController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 4:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel4MineralController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 5:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel5MineralController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Génie des Matériaux',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      color: primaryColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 3:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel3MaterialsController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 4:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel4MaterialsController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 5:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel5MaterialsController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Génie Controle et Instrumentation',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      color: primaryColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 3:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel3ControlController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 4:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel4ControlController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text('Niveau 5:'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: newIntershipLevel5ControlController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
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
                    ),
                  ],
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
                InkWell(
                  onTap: () {
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
                    uploadFile();
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
    final destination = newIntershipCompanyNameController.text;

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
    final schoolIntershipInfo = [
      newIntershipCompanyNameController.text,
      newIntershipCompanyCityController.text,
      newIntershipCompanyPhoneController.text,
      [
        newIntershipLevel3ChemistryController.text,
        newIntershipLevel4ChemistryController.text,
        newIntershipLevel5ChemistryController.text,
      ],
      [
        newIntershipLevel3MineralController.text,
        newIntershipLevel4MineralController.text,
        newIntershipLevel5MineralController.text,
      ],
      [
        newIntershipLevel3MaterialsController.text,
        newIntershipLevel4MaterialsController.text,
        newIntershipLevel5MaterialsController.text,
      ],
      [
        newIntershipLevel3ControlController.text,
        newIntershipLevel4ControlController.text,
        newIntershipLevel5ControlController.text,
      ],
      urlDownload,
    ];
    newSchoolIntership(schoolIntershipInfo);
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
