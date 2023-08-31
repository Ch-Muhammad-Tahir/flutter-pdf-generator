import 'package:flutter/material.dart';
import 'package:pdf_projectt/models/receipt.dart';
import 'package:pdf_projectt/provider/genete_pdf_provider.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import '../../utils/pdfexport.dart';

class ViewPDfScreenWidget extends StatelessWidget {
  final ReceiptModel receipt;
  const ViewPDfScreenWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(receipt),
      ),
    );
  }
}
