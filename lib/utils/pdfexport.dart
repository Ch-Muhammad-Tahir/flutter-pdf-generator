import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ';
import 'package:pdf_projectt/models/receipt.dart';
import 'package:pdf_projectt/utils/app_strings.dart';
import 'package:pdf_projectt/widgets/custom_text.dart';
import 'package:http/http.dart' as http;

Future<Uint8List> makePdf(ReceiptModel receipt) async {
  final response = await http.get(Uri.parse(
      'https://i.etsystatic.com/15382926/r/il/80e4a1/3726758913/il_fullxfull.3726758913_s8oy.jpg'));
  final backgroundImageBytes = response.bodyBytes;
  final backgroundImage = MemoryImage(backgroundImageBytes);
  TextStyle style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  final pdf = Document();
  pdf.addPage(Page(
      //margin: EdgeInsets.all(50),
      pageFormat: PdfPageFormat(
        3.46,
        5.5,
      ),
      build: (context) {
        print(receipt.customerName);
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(AppStrings.nameLabel, style: style),
                Text(receipt.customerName, style: style)
              ]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(AppStrings.itemLabel, style: style),
                Text(receipt.item.itemName, style: style)
              ]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(AppStrings.itemQuantity, style: style),
                Text(receipt.item.itemQuantity, style: style),
              ]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(AppStrings.itemPrice, style: style),
                Text(receipt.item.itemPrice, style: style),
              ])
            ]));
      }));
  return pdf.save();
}
