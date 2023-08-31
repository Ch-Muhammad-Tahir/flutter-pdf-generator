import 'package:pdf_projectt/models/item.dart';

class ReceiptModel {
  final String customerName;
  final ItemModel item;
  //final List<ItemModel> items;
  ReceiptModel({
    required this.item,
    required this.customerName,
  });
}
