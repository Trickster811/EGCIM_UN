import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egcim_un/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResearchCompanyScreen extends StatefulWidget {
  const ResearchCompanyScreen({super.key});

  @override
  State<ResearchCompanyScreen> createState() => _ResearchCompanyScreenState();
}

class _ResearchCompanyScreenState extends State<ResearchCompanyScreen> {
  CollectionReference _company =
      FirebaseFirestore.instance.collection('Companies');
  late Stream<QuerySnapshot> _streamCompany;
  List<QueryDocumentSnapshot> listQueryDocumentSnapshot = [];

  @override
  void initState() {
    super.initState();
    _streamCompany = _company.snapshots();
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
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoSearchTextField(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(61, 83, 83, 83),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    ),
                  ],
                ),
                onChanged: (String value) {
                  print('The text has changed to: $value');
                },
                onSubmitted: (String value) {
                  print('Submitted text: $value');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
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
                        for (var companyItem in listQueryDocumentSnapshot) ...[
                          InkWell(
                            onTap: () {},
                            child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        companyItem['companyName']
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        companyItem['companySector'],
                                      ),
                                      Text(
                                        companyItem['companyPhone'],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        companyItem['companyTown'],
                                      ),
                                      Text(
                                        companyItem['companyCoord'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
