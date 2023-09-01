import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_projectt/provider/genete_pdf_provider.dart';
import 'package:pdf_projectt/utils/app_assets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_projectt/utils/app_strings.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_Text_field.dart'; // Add this import

class HomePageScreenWidget extends StatefulWidget {
  HomePageScreenWidget({super.key});

  @override
  State<HomePageScreenWidget> createState() => _HomePageScreenWidgetState();
}

class _HomePageScreenWidgetState extends State<HomePageScreenWidget> {
  String pdfPath = ''; // Store the path to the generated PDF
  TextEditingController nameController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            // CustomTextField(
            //     controller: nameController,
            //     hintText: AppStrings.enterNameHint,
            //     labelText: AppStrings.nameLabel),
            // const SizedBox(
            //   height: 20,
            // ),
            // CustomTextField(
            //     controller: itemNameController,
            //     hintText: AppStrings.enterItemNameHint,
            //     labelText: AppStrings.itemLabel),
            // const SizedBox(
            //   height: 20,
            // ),
            // CustomTextField(
            //     controller: itemQuantityController,
            //     hintText: AppStrings.itemQuantityHint,
            //     labelText: AppStrings.itemQuantity),
            // const SizedBox(
            //   height: 20,
            // ),
            // CustomTextField(
            //     controller: itemPriceController,
            //     hintText: AppStrings.itemPriceHint,
            //     labelText: AppStrings.itemPrice),

            // const SizedBox(
            //   height: 60,
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       String name = nameController.text.toString();
            //       String itemName = itemNameController.text.toString();
            //       String quantity = itemQuantityController.text.toString();
            //       String price = itemPriceController.text.toString();
            //       Provider.of<GeneratePdfProvider>(context, listen: false)
            //           .checkValidation(
            //               name, itemName, quantity, price, context);
            //     },
            //     child: Text(AppStrings.generatePDF)),

            ElevatedButton(
              onPressed: () async {
                generatePDF();
              },
              child: Text(AppStrings.generatePDF),
            ),
            // Show the PDF viewer if a PDF has been generated
            if (pdfPath.isNotEmpty)
              Expanded(
                child: PDFView(
                  filePath: pdfPath,
                  enableSwipe: true,
                  swipeHorizontal: true,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void generatePDF() async {
    final pdf = pw.Document();
    // final ByteData data = await rootBundle.load(AppAssets.pdfBackground);
    // final Uint8List bytes = data.buffer.asUint8List();
    // final backgroundImage = pw.MemoryImage(bytes);

    final response = await http.get(Uri.parse(
        'https://i.etsystatic.com/15382926/r/il/80e4a1/3726758913/il_fullxfull.3726758913_s8oy.jpg'));
    final backgroundImageBytes = response.bodyBytes;
    final backgroundImage = pw.MemoryImage(backgroundImageBytes);
    // final String imageUrl = 'https://picsum.photos/250?image=9';
    // final backgroundImage = await Image.network(imageUrl);
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat(3.46, 5.5).portrait,
      build: (context) {
        return pw.Stack(children: [
          pw.Image(backgroundImage, fit: pw.BoxFit.fill),
          pw.Center(
              child: pw.Text(
            "Hello World",
            style: pw.TextStyle(fontSize: 0.21),
          )),
        ]);
      },
    ));

    final pdfBytes = await pdf.save();
    final output = await getTemporaryDirectory();
    // final file = File("${output.path}/example.pdf");
    final file = File("/storage/emulated/0/Download/example.pdf");
    await file.writeAsBytes(pdfBytes);
    print(file);

    setState(() {
      pdfPath = file.path; // Update the PDF path
    });
  }
}
