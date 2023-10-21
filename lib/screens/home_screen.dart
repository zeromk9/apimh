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

/* class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playm('assets/audio/MainTheme.mp3');
  }

  @override
  Widget build(BuildContext context) {
    final monstersProvider = Provider.of<MonstersProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow.shade700,
          title: const Center(
            child: Text('MONSTERS'),
          )),
      body: Column(
          children: [CardSwiper(monsters: monstersProvider.onDisplayMonsters)]),
      backgroundColor: Colors.yellow.shade900,
    );
  }

  Future<void> playm(String path) async {
    await player.play(AssetSource(path));
  }
} */
