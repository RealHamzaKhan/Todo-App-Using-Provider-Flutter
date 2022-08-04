import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watodo/task_data.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>TaskData()),
        ],
    child:  MaterialApp(
        home: HomeScreen(),
    ),
    );
  }
}

