import 'package:first_ui/Disease/services/disease_provider.dart';
import 'package:first_ui/Disease/src/home_page/home.dart';
import 'package:first_ui/Disease/src/suggestions_page/suggestions.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class DetectionApp extends StatelessWidget {
  const DetectionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiseaseService>(
      create: (context) => DiseaseService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Detect diseases',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SFRegular'),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Suggestions.routeName:
                    return const Suggestions();
                  case Home.routeName:
                  default:
                    return const Home();
                }
              });
        },
      ),
    );
  }
}
