import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egcim_un/utils.dart';
import 'package:egcim_un/welcome/auth/admin_signin_page.dart';
import 'package:egcim_un/welcome/auth/signup_page.dart';
import 'package:egcim_un/welcome/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final signInFormKey = GlobalKey<FormState>();
  String? accountType;
  final signInMatriculeController = TextEditingController();
  final signInPasswordController = TextEditingController();

  authentification(idmat) async {
    // QuerySnapshot querySnapshot;
    List<String> docs = [];
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(idmat[0])
          .get()
          .then((DocumentSnapshot doc) async {
        // print(doc.data());
        docs.add(doc['matriculeOrEmail']);
        docs.add(doc['password']);

        // print(docs);

        if (docs[0] == idmat[0] && docs[1] == idmat[1]) {
          UtilFunctions.setFirstTime(true);
          UtilFunctions.setUserInfo(idmat);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                accountType: accountType!,
              ),
            ),
          );
        } else {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              title: const Text(
                'Oups!!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              message: const Text(
                'Identifiants are incorrect',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                  // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
      });
      // return 0;
    } catch (e) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text(
            'Oups!!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          message: const Text(
            'Une erreur est survenue',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              // onPressed: () => imageGallerypicker(ImageSource.camera, context),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
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
            key: signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onLongPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminSignInScreen(),
                    ),
                  ),
                  child: Container(
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
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Connexion',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      accountType = value!;
                    });
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'studentAccountType',
                      child: Text('Etudiant'),
                    ),
                    DropdownMenuItem(
                      value: 'teacherAccountType',
                      child: Text('Enseignant'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    label: Text(
                      'Compte',
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
                  controller: signInMatriculeController,
                  keyboardType: accountType == 'studentAccountType'
                      ? TextInputType.text
                      : TextInputType.emailAddress,
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
                  controller: signInPasswordController,
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
                InkWell(
                  onTap: () async {
                    if (accountType == null) {
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
                            "Veuillez s'il vous plaît choisir un type de compte",
                          ),
                        ),
                      );
                      return;
                    }
                    if (!signInFormKey.currentState!.validate()) {
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
                    // final message = await UtilFunctions().login(
                    //   email: signInMatriculeController.text,
                    //   password: signInPasswordController.text,
                    // );
                    // if (message!.contains('Success')) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          accountType: accountType!,
                        ),
                      ),
                    );
                    // }
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(message),
                    //   ),
                    // );
                    final userInfo = [
                      signInMatriculeController.text,
                      signInPasswordController.text,
                    ];
                    // authentification(userInfo);
                  },
                  child: Container(
                    height: 40,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: const Text(
                      'Se Connecter',
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
                      'Pas encore de compte?   ',
                    ),
                    InkWell(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                      child: const Text(
                        "S'inscrire",
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
