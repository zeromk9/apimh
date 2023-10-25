import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isTextVisible = true;
  void toggleTextVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Monster monster =
        ModalRoute.of(context)?.settings.arguments as Monster;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange, title: Text(monster.name)),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate:
                SliverChildListDelegate.fixed([_MonsterName(monster: monster)]),
          ),
        ],
      ),
    );
  }
}

class _MonsterName extends StatelessWidget {
  const _MonsterName({required this.monster});
  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.topLeft,
          child: Text(
            monster.name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          alignment: Alignment.topLeft,
          child: Text(
            monster.description,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
        ),
/*         Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Image(
            fit: BoxFit.fitHeight,
            image: AssetImage(monster.mhimage),
          ),
        ), */
      ],
    );
  }
}
