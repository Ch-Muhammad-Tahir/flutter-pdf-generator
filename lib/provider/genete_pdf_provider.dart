import 'package:flutter/material.dart';
import 'package:pdf_projectt/models/item.dart';
import 'package:pdf_projectt/models/receipt.dart';
import 'package:pdf_projectt/utils/pdfexport.dart';
import 'package:pdf_projectt/views/view_pdf_screen/view_pdf_screen.dart';

class GeneratePdfProvider extends ChangeNotifier {
  String customerName = "";
  String itemName = "";
  String itemQuantity = "";
  String itemPrice = "";
  ReceiptModel? receipt;
  void checkValidation(String name, String itemName, String quantity,
      String price, BuildContext context) {
    if (name.isEmpty || itemName.isEmpty || price.isEmpty || quantity.isEmpty) {
    } else {
      customerName = name;
      itemName = itemName;
      itemQuantity = quantity;
      itemPrice = price;
      receipt = ReceiptModel(
          item: ItemModel(
              itemName: itemName,
              itemPrice: itemPrice,
              itemQuantity: itemQuantity),
          customerName: customerName);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewPDfScreenWidget(
                    receipt: receipt!,
                  )));
    }
  }
}
