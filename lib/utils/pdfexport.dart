import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ';
import 'package:pdf_projectt/models/receipt.dart';
import 'package:pdf_projectt/utils/app_strings.dart';
import 'package:pdf_projectt/widgets/custom_text.dart';

Future<Uint8List> makePdf(ReceiptModel receipt) {
  TextStyle style = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  final pdf = Document();
  pdf.addPage(Page(
    pageFormat: PdfPageFormat.letter,
    build: (context) {
      return Column(children: [
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
      ]);
    },
  ));
  return pdf.save();
}
