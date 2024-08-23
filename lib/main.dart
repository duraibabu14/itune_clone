import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ituneclone/my_app.dart';
import 'package:ituneclone/utils/ssl_cer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SSLCer.initialize();

  runApp(const ProviderScope(child: MyApp()));
}
