import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_color_tester/pages/home.dart';
import 'package:ui_color_tester/util/theme.dart';

Future<void> main() async {

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),

    child: Consumer<ThemeNotifier>(
      builder:(context, ThemeNotifier notifier, child){

        return MaterialApp(
          theme: notifier.darkTheme ? dark : light,
          home: Home(),
        );
      },
    ),
  )
  );
}

