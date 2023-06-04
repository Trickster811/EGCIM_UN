import 'package:egcim_un/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CompanyLocalizationScreen extends StatelessWidget {
  CompanyLocalizationScreen({
    Key? key,
  }) : super(key: key);

  final companyLocalizationFormKey = GlobalKey<FormState>();
  final companyLocalizationCompanyNameController = TextEditingController();
  final companyLocalizationCompanyActivitySectorController =
      TextEditingController();
  final companyLocalizationCompanyCityController = TextEditingController();
  final companyLocalizationCompanyDescriptionController =
      TextEditingController();
  final companyLocalizationCompanyCoordoneesController =
      TextEditingController();
  final companyLocalizationCompanyPhoneController = TextEditingController();
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
            key: companyLocalizationFormKey,
            child: Column(
              children: [
                const Text(
                  'Enregistrer une Entreprise',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: companyLocalizationCompanyNameController,
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
                  controller:
                      companyLocalizationCompanyActivitySectorController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      "Secteur d'Activité",
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
                  controller: companyLocalizationCompanyCityController,
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
                  controller: companyLocalizationCompanyDescriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      "Description",
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
                  controller: companyLocalizationCompanyCoordoneesController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      "Coordonées",
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
                  controller: companyLocalizationCompanyPhoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(
                      'Contact',
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
                  onTap: () {
                    if (!companyLocalizationFormKey.currentState!.validate()) {
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
                            onPressed: () {},
                            child: const Text(
                              'Ouvrir',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {},
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
