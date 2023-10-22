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
  const _MonsterName({super.key, required this.monster});
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Image(
            fit: BoxFit.fitHeight,
            image: AssetImage(monster.mhimage),
          ),
        ),
      ],
    );
  }
}

/* 
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Monster monster =
        ModalRoute.of(context)?.settings.arguments as Monster;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(
            monsters: monster,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [_PosterAndTitle(monster: monster), const _Overview()],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  final Monster monsters;

  const _CustomAppbar({required this.monsters});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            monsters.name,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: AssetImage('assets/${monsters.name}.jpg'),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Monster monster;
  const _PosterAndTitle({required this.monster});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              height: 250,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //centra a izquierda
              children: [
                Text(
                  monster.name,
                  style: const TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  monster.description,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      monster.locations.toString(),
                      style: const TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text(
        'Description of the Monster,',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
 */