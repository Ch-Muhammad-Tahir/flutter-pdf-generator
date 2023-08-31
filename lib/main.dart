import 'package:flutter/material.dart';
import 'package:pdf_projectt/provider/genete_pdf_provider.dart';
import 'package:pdf_projectt/views/home_page/home_page_screen_widget.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GeneratePdfProvider>(
          create: (context) => GeneratePdfProvider())
    ],
    child: MaterialApp(
      home: HomePageScreenWidget(),
    ),
  ));
}
