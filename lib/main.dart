import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apimh/providers/providers.dart';
import 'package:apimh/screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MONSTER HUNTER',
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/monsters_details': (_) => const DetailsMonstersScreen(),
        '/armors_details': (_) => const DetailsArmorsScreen(),
        '/weapons_details': (_) => const DetailsWeaponsScreen(),
        '/items_details': (_) => const DetailsItemsScreen(),
        '/zones_details': (_) => const DetailsZonesScreen(),
      },
    );
  }
}
