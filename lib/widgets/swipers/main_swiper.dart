import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:apimh/widgets/widgets.dart';

class MainSwiper extends StatelessWidget {
  final List<Monster> monsters;
  const MainSwiper({Key? key, required this.monsters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return MonsterSwiper(
                  monsters: monsters); // Pasar la lista de monstruos
            case 1:
              return WeaponsSwiper(); // Pasar los datos de armas si es necesario
            case 2:
              return ArmorsSwiper(); // Pasar los datos de armaduras si es necesario
            case 3:
              return ItemsSwiper(); // Pasar los datos de items si es necesario
            case 4:
              return LocalizationsSwiper(); // Pasar los datos de localizaciones si es necesario
            default:
              return Container();
          }
        },
      ),
    );
  }
}
