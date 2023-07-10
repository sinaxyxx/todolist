import 'package:flutter/material.dart';
import 'package:list_todo3/view_model/viewModel.dart';
import 'package:provider/provider.dart';

import 'views/input_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewBrain(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}
