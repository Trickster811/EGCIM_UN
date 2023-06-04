import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egcim_un/utils.dart';
import 'package:egcim_un/welcome/auth/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpFormKey = GlobalKey<FormState>();
  final signUpMatriculeController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPhoneController = TextEditingController();

  studentRegistration(studentInfo) async {
    try {
      FirebaseFirestore.instance.collection('Users').doc(studentInfo[0]).set({
        'matriculeOrEmail': studentInfo[0],
        'password': studentInfo[1],
        'name': studentInfo[2],
        'email': studentInfo[3],
        'phone': studentInfo[4],
      }).then(
        (value) => showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: const Text('EGCIM UN'),
            message: const Text(
              "Votre compte a ete cree avec succes\nVeuillez vous connecter afin d'acceder aux fonctionnalites de l'application.",
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
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
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: signUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'EGCIM UN',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 100,
                        margin: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10000,
                          ),
                        ),
                      ),
                      const Text(
                        'Ngaoundere',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Inscription',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: signUpMatriculeController,
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
                  controller: signUpPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text(
                      'Mot de passe',
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
                  controller: signUpNameController,
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
                  controller: signUpEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text(
                      'Email',
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
                  controller: signUpPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    label: Text(
                      'Téléphone',
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
                    if (!signUpFormKey.currentState!.validate()) {
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
                    // final message = await UtilFunctions().registration(
                    //   email: signUpEmailController.text,
                    //   password: signUpPasswordController.text,
                    // );
                    // if (message!.contains('Success')) {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const SignInScreen(),
                    //     ),
                    //   );
                    // }
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(message),
                    //   ),
                    // );
                    final studentInfo = [
                      signUpMatriculeController.text,
                      signUpPasswordController.text,
                      signUpNameController.text,
                      signUpEmailController.text,
                      signUpPhoneController.text,
                    ];
                    studentRegistration(studentInfo);
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: const Text(
                      "S'inscrire",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Déja un compte? ',
                    ),
                    InkWell(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      ),
                      child: const Text(
                        "Connexion",
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
