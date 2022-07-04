import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/home_page.dart';
import 'services/home_provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo List',
        home: HomePage(),
      ),
    );
  }
}
