import 'package:catbreeds/src/bloc_console_debug_printer.dart';
import 'package:catbreeds/src/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/src/config/di/injection_container.dart' as injection_container;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await injection_container.init();
  Bloc.observer = BlocConsoleDebugPrinter();
  runApp(const MyApp());
}


