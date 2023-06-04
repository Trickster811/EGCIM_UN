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
  final letterRecommandationMentionController = TextEditingController();
  final letterRecommandationParcoursController = TextEditingController();
  final letterRecommandationCompanyNameController = TextEditingController();
  final letterRecommandationCompanyCityController = TextEditingController();
  final letterRecommandationCompanyPhoneController = TextEditingController();
  var letterRecommandationStartDateController = TextEditingController();
  var letterRecommandationEndDateController = TextEditingController();
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
                TextFormField(
                  controller: letterRecommandationMentionController,
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
                  controller: letterRecommandationParcoursController,
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
                  controller: letterRecommandationCompanyPhoneController,
                  keyboardType: TextInputType.number,
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
                  onTap: () {
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
