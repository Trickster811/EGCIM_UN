import 'package:egcim_un/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResearchCompanyScreen extends StatefulWidget {
  const ResearchCompanyScreen({super.key});

  @override
  State<ResearchCompanyScreen> createState() => _ResearchCompanyScreenState();
}

class _ResearchCompanyScreenState extends State<ResearchCompanyScreen> {
  List companyList = [];
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'rechercher une entreprise',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: const CircularProgressIndicator.adaptive())
            ],
          ),
        ),
      ),
    );
  }
}
