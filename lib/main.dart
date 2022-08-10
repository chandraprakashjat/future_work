import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future_demo/my_data.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MaterialApp(
    home: MyDataWidget(),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
