import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egcim_un/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentAccountConfirmation extends StatefulWidget {
  const StudentAccountConfirmation({super.key});

  @override
  State<StudentAccountConfirmation> createState() =>
      _StudentAccountConfirmationState();
}

class _StudentAccountConfirmationState
    extends State<StudentAccountConfirmation> {
  CollectionReference _studentAccount =
      FirebaseFirestore.instance.collection('Users');

  late Stream<QuerySnapshot> _streamCompany;

  List<QueryDocumentSnapshot> listQueryDocumentSnapshot = [];

  @override
  void initState() {
    super.initState();
    _streamCompany = _studentAccount.snapshots();
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
          child: StreamBuilder(
            stream: _streamCompany,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                      "Une erreur s'est produite lors du chargement des entreprises"),
                );
              }
              if (snapshot.hasData) {
                QuerySnapshot querySnapshot1 = snapshot.data;
                listQueryDocumentSnapshot.addAll(querySnapshot1.docs);
                return Column(
                  children: [
                    for (var studentAccountItem
                        in listQueryDocumentSnapshot) ...[
                      if (!studentAccountItem['status']) ...[
                        Container(
                          height: 100,
                          // width: double.maxFinite,
                          padding: const EdgeInsetsDirectional.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(61, 83, 83, 83),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                              ),
                            ],
                            border: Border(
                              bottom: BorderSide(
                                width: 4,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  studentAccountItem['matriculeOrEmail'],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  try {
                                    FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(studentAccountItem[
                                            'matriculeOrEmail'])
                                        .update({
                                      'status': true,
                                    });
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) =>
                                          CupertinoActionSheet(
                                        title: const Text(
                                          'Bravo!!',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        message: const Text(
                                          'Compte approuve',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        actions: [
                                          CupertinoActionSheetAction(
                                            // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const StudentAccountConfirmation(),
                                                ),
                                              );
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } catch (e) {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) =>
                                          CupertinoActionSheet(
                                        title: const Text(
                                          'Oups!!',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        message: const Text(
                                          "Une erreur s'est produite. Veuillez recommencer s'il-vous-plait",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        actions: [
                                          CupertinoActionSheetAction(
                                            // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'Approuver',
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                      title: const Text('Informations'),
                                      content: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsetsDirectional
                                                .symmetric(
                                              vertical: 20,
                                              horizontal: 10,
                                            ),
                                            child: Text(
                                              studentAccountItem[
                                                  'matriculeOrEmail'],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsetsDirectional
                                                .symmetric(
                                              vertical: 20,
                                              horizontal: 10,
                                            ),
                                            child: Text(
                                              studentAccountItem['name'],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsetsDirectional
                                                .symmetric(
                                              vertical: 20,
                                              horizontal: 10,
                                            ),
                                            child: Text(
                                              studentAccountItem['phone'],
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        CupertinoDialogAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            try {
                                              FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc(studentAccountItem[
                                                      'matriculeOrEmail'])
                                                  .update({
                                                'status': true,
                                              });
                                              showCupertinoModalPopup(
                                                context: context,
                                                builder: (context) =>
                                                    CupertinoActionSheet(
                                                  title: const Text(
                                                    'Bravo!!',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  message: const Text(
                                                    'Compte approuve',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  actions: [
                                                    CupertinoActionSheetAction(
                                                      // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const StudentAccountConfirmation(),
                                                          ),
                                                        );
                                                      },
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } catch (e) {
                                              showCupertinoModalPopup(
                                                context: context,
                                                builder: (context) =>
                                                    CupertinoActionSheet(
                                                  title: const Text(
                                                    'Oups!!',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  message: const Text(
                                                    "Une erreur s'est produite. Veuillez recommencer s'il-vous-plait",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  actions: [
                                                    CupertinoActionSheetAction(
                                                      // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                          child: const Text('Approuver'),
                                        ),
                                        CupertinoDialogAction(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text('Ok'),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'Voir',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ]
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
