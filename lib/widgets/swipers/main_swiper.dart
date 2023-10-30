import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:apimh/widgets/widgets.dart';

class MainSwiper extends StatelessWidget {
  final List<Monster> monsters;
  final List<Armors> armors;
  final List<Weapons> weapons;
  final List<Items> items;
  final List<Zones> zones;

  const MainSwiper({
    Key? key,
    required this.monsters,
    required this.armors,
    required this.weapons,
    required this.items,
    required this.zones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return MonsterSwiper(monsters: monsters);
            case 1:
              return WeaponsSwiper(weapons: weapons);
            case 2:
              return ArmorsSwiper(armors: armors);
            case 3:
              return ItemsSwiper(items: items);
            case 4:
              return ZonesSwiper(zones: zones);
            default:
              return Container();
          }
        },
      ),
    );
  }
}
