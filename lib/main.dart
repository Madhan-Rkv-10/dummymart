import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/products/screens/products.dart';

void main() {
  HttpOverrides.global = _HttpOverrides();

  runApp(const ProviderScope(child: DummyMartApp()));
}

class DummyMartApp extends StatelessWidget {
  const DummyMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DummyMart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProductsScreen(),
    );
  }
}

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, __, ___) => true;
  }
}
