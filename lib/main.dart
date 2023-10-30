import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_my_meals/my_app.dart';

// para funcionar as chamadas http feitas no app, não sei se é assim sempre, mas estou precisando usar
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// para saber a altura da AppBar, podemos armazenar ela em uma variável e usar a prop preferredSize.height
// para saber a altura da status bar do celular, podemos usar MediaQuery.of(context).padding.top

// essas medidas são úteis pra calcular alturas dinamicamente com o size.height do MediaQuery

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
