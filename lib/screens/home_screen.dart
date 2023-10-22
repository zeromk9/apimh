import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apimh/widgets/widgets.dart';
import 'package:apimh/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final monstersProvider = Provider.of<MonstersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
/*         actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          )
        ], */
        title: const Center(
          child: Text('MONSTERS'),
        ),
      ),
      body: Column(
        children: [
          CardSwiper(
            monsters: monstersProvider.onDisplayMonsters,
          ),
        ],
      ),
    );
  }
}
