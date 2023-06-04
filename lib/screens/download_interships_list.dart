import 'package:egcim_un/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DownloadIntershipsListScreen extends StatelessWidget {
  const DownloadIntershipsListScreen({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Télécharger La liste des stages enregistrés',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => const CupertinoActionSheet(
                  title: Text(
                    'Désolé!!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  message: Text(
                      'Liste non disponible.\nVeuillex réessayer plutard.'),
                ),
              ),
              child: Container(
                height: 75,
                // width: 150,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 100.0,
                ),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                child: const Text(
                  'Stages Ecole',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => const CupertinoActionSheet(
                  title: Text(
                    'Désolé!!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  message: Text(
                      'Liste non disponible.\nVeuillex réessayer plutard.'),
                ),
              ),
              child: Container(
                height: 75,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 100.0,
                ),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                child: const Text(
                  'Stages Etudiants',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
