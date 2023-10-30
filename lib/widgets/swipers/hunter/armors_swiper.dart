import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';

class ArmorsSwiper extends StatelessWidget {
  final List<Armors> armors;
  const ArmorsSwiper({Key? key, required this.armors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          itemCount: armors.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.6,
          itemBuilder: (_, int index) {
            final armor = armors[index];
            return GestureDetector(
              onTap: () {
                // Navegar a los detalles de la armadura
                Navigator.pushNamed(context, '/armor_details',
                    arguments: armor);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.green, // Color para las armaduras
                      child: Text(
                        armor.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Puedes agregar más información de la armadura aquí si es necesario
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
