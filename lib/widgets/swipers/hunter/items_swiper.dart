import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';

class ItemsSwiper extends StatelessWidget {
  final List<Items> items;
  const ItemsSwiper({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          itemCount: items.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.6,
          itemBuilder: (_, int index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                // Navegar a los detalles del item
                Navigator.pushNamed(context, '/item_details', arguments: item);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.yellow, // Color para los items
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Puedes agregar más información del item aquí si es necesario
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
