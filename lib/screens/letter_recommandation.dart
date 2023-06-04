import 'dart:io';

import 'package:egcim_un/screens/components/generer.dart';
import 'package:egcim_un/screens/components/pdf_view.dart';
import 'package:egcim_un/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LettreRecommandationScreen extends StatefulWidget {
  const LettreRecommandationScreen({super.key});

  @override
  State<LettreRecommandationScreen> createState() =>
      _LettreRecommandationScreenState();
}

class _LettreRecommandationScreenState
    extends State<LettreRecommandationScreen> {
  final lettreRecommandationFormKey = GlobalKey<FormState>();
  final letterRecommandationMatriculeController = TextEditingController();
  final letterRecommandationNameController = TextEditingController();
  final letterRecommandationCompanyNameController = TextEditingController();
  final letterRecommandationCompanyCityController = TextEditingController();
  final letterRecommandationCompanyPhoneController = TextEditingController();
  final letterRecommandationIntershipPeriodController = TextEditingController();
  String? letterRecommandationCompanyDirectorController;
  String? letterRecommandationMentionController;
  String? letterRecommandationParcoursController;
  String? letterRecommandationLevelController;
  String? letterRecommandationIntershipTypeController;
  String? letterRecommandationIntershipDurationController;
  File? pdfFile;

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
            key: lettreRecommandationFormKey,
            child: Column(
              children: [
                const Text(
                  'Lettre de Recommandation',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: letterRecommandationMatriculeController,
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
                  controller: letterRecommandationNameController,
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
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      letterRecommandationMentionController = value!;
                    });
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Genie Chimique',
                      child: Text('Genie Chimique'),
                    ),
                    DropdownMenuItem(
                      value: 'Genie Controle et Instrumentation',
                      child: Text('Genie Controle et Instrumentation'),
                    ),
                    DropdownMenuItem(
                      value: "Genie Mineral",
                      child: Text("Genie Mineral"),
                    ),
                  ],
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
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      letterRecommandationParcoursController = value!;
                    });
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Genie Pharmaceutique et Chimie Fine',
                      child: Text('Genie Pharmaceutique et Chimie Fine'),
                    ),
                    DropdownMenuItem(
                      value: 'Genie Controle et Instrumentation',
                      child: Text('Genie Controle et Instrumentation'),
                    ),
                    DropdownMenuItem(
                      value: "Genie Mineral",
                      child: Text("Genie Mineral"),
                    ),
                    DropdownMenuItem(
                      value: "Genie des Materiaux",
                      child: Text("Genie des Materiaux"),
                    ),
                  ],
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
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      letterRecommandationLevelController = value!;
                    });
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: "3",
                      child: Text("3ème"),
                    ),
                    DropdownMenuItem(
                      value: "4",
                      child: Text("4ème"),
                    ),
                    DropdownMenuItem(
                      value: "5",
                      child: Text("5ème"),
                    ),
                  ],
                  decoration: const InputDecoration(
                    label: Text(
                      'Niveau',
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
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      letterRecommandationIntershipTypeController = value!;
                    });
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Ouvrier',
                      child: Text('Ouvrier'),
                    ),
                    DropdownMenuItem(
                      value: 'Agent de Maitrise',
                      child: Text('Agent de Maitrise'),
                    ),
                    DropdownMenuItem(
                      value: "Fin d'etudes",
                      child: Text("Fin d'etudes"),
                    ),
                  ],
                  decoration: const InputDecoration(
                    label: Text(
                      'Type de Stage',
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
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      letterRecommandationIntershipDurationController = value!;
                    });
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Un (01) a Deux (02) mois',
                      child: Text('Un (01) a Deux (02) mois'),
                    ),
                    DropdownMenuItem(
                      value: 'Deux (02) mois',
                      child: Text('Deux (02) mois'),
                    ),
                    DropdownMenuItem(
                      value: "Quatre (04) a Six (06) mois",
                      child: Text("Quatre (04) a Six (06) mois"),
                    ),
                  ],
                  decoration: const InputDecoration(
                    label: Text(
                      'Duree',
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
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: letterRecommandationIntershipPeriodController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      'Periode',
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
                  controller: letterRecommandationCompanyNameController,
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
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      letterRecommandationCompanyDirectorController = value!;
                    });
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Le Directeur Général',
                      child: Text('Directeur Général'),
                    ),
                    DropdownMenuItem(
                      value: 'La Directrice Générale',
                      child: Text('Directrice Générale'),
                    ),
                    DropdownMenuItem(
                      value: 'Le Directeur',
                      child: Text('Directeur'),
                    ),
                    DropdownMenuItem(
                      value: 'Le Directeur des Ressources Humaines',
                      child: Text('Directeur des Ressources Humaines'),
                    ),
                    DropdownMenuItem(
                      value: 'La Directrice',
                      child: Text('Directrice'),
                    ),
                    DropdownMenuItem(
                      value: 'La Directrice des Ressources Humaines',
                      child: Text('Directrice des Ressources Humaines'),
                    ),
                    DropdownMenuItem(
                      value: 'Commandant',
                      child: Text('Commandant'),
                    ),
                    DropdownMenuItem(
                      value: 'Responsable',
                      child: Text('Responsable'),
                    ),
                    DropdownMenuItem(
                      value: 'Chef',
                      child: Text('Chef'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    label: Text(
                      'Dirigeant',
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
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: letterRecommandationCompanyCityController,
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
                InkWell(
                  onTap: () async {
                    if (!lettreRecommandationFormKey.currentState!.validate()) {
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
                    final List<String> studentInfo = [
                      letterRecommandationMatriculeController.text,
                      letterRecommandationNameController.text,
                      letterRecommandationMentionController!,
                      letterRecommandationParcoursController!,
                      letterRecommandationLevelController!,
                      letterRecommandationIntershipTypeController!,
                      letterRecommandationIntershipDurationController!,
                      letterRecommandationIntershipPeriodController.text,
                      letterRecommandationCompanyNameController.text,
                      letterRecommandationCompanyCityController.text,
                      letterRecommandationCompanyPhoneController.text,
                      letterRecommandationCompanyDirectorController!,
                    ];

                    pdfFile = await PdfParagraphApi.generateLetter(studentInfo);
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: const Text(
                          'Bravo!',
                          style: TextStyle(
                            color: Colors.blue,
                            // fontSize: 16,
                          ),
                        ),
                        message: const Text(
                          "Votre lettre de Recommandation a été générée avec succès.",
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfViewerScreen(
                                    pdfFile: pdfFile!,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Ouvrir',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Ok',
                              style: TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: const Text(
                      "Générer",
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
}
