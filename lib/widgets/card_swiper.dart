import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Monster> monsters;
  const CardSwiper({Key? key, required this.monsters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.6,
      child: Swiper(
        itemCount: monsters.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.6,
        itemBuilder: (_, int index) {
          final monster = monsters[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: monster),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.orange,
                    child: Text(
                      monster.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24, // Tamaño grande para el texto
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/imgs/monsters/${monster.name}.jpg',
                    fit: BoxFit
                        .contain, // Ajustar la imagen para que se vea completa sin ser cortada
                    width:
                        250, // Tamaño específico para las imágenes (ajústalo según tus necesidades)
                    height:
                        250, // Tamaño específico para las imágenes (ajústalo según tus necesidades)
                    errorBuilder: (context, error, stackTrace) {
                      // En caso de error al cargar la imagen, cargar la imagen de respaldo
                      return Image.asset(
                        'assets/imgs/nodata.jpg',
                        fit: BoxFit
                            .contain, // Ajustar la imagen de respaldo de la misma manera
                        width:
                            250, // Tamaño específico para las imágenes de respaldo
                        height:
                            250, // Tamaño específico para las imágenes de respaldo
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
