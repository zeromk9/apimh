import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';

class WeaponsSwiper extends StatelessWidget {
  final List<Weapons> weapons;
  const WeaponsSwiper({Key? key, required this.weapons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          itemCount: weapons.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.6,
          itemBuilder: (_, int index) {
            final weapon = weapons[index];
            return GestureDetector(
              onTap: () {
                // Navegar a los detalles del arma
                Navigator.pushNamed(context, '/weapon_details',
                    arguments: weapon);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.red, // Color para las armas
                      child: Text(
                        weapon.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Puedes agregar más información del arma aquí si es necesario
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
