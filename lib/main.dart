import 'package:flutter/material.dart';
import 'package:flutter_beginner/routes/name_routes.dart';
import 'package:provider/provider.dart';

import 'routes/route_generator.dart';
import 'services/addpage_provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddPageProvider>(
            create: (_) => AddPageProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo List',
        initialRoute: NameRoutes.home,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
