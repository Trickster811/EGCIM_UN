import 'dart:io';

import 'package:egcim_un/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {
  final File pdfFile;
  const PdfViewerScreen({
    Key? key,
    required this.pdfFile,
  }) : super(key: key);
  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(UtilFunctions.baseNameProvider(widget.pdfFile.path)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.save_alt_rounded,
              color: Colors.white,
            ),
            onPressed: () async {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text(
                    'IUT Companion',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ArialRoundedBold',
                    ),
                  ),
                  message: Column(
                    children: [
                      const Text(
                        'Votre lettre a été savegardée dans ce repertoire\n|\nv\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'ArialRoundedBold',
                        ),
                      ),
                      Text(
                        widget.pdfFile.path.substring(8),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'ArialRoundedBold',
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    CupertinoActionSheetAction(
                      // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.share_rounded,
          //     color: Colors.white,
          //   ),
          //   onPressed: () async {
          //     await Share.shareFiles(
          //         [XFile.fromData(await widget.pdfFile.readAsBytes())]);
          //   },
          // ),
        ],
      ),
      body: SfPdfViewer.file(
        widget.pdfFile,
        controller: _pdfViewerController,
      ),
    );
  }
}
