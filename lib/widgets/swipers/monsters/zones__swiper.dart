import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:apimh/models/models.dart';

class ZonesSwiper extends StatelessWidget {
  final List<Zones> zones;
  const ZonesSwiper({Key? key, required this.zones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          itemCount: zones.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.6,
          itemBuilder: (_, int index) {
            final zone = zones[index];
            return GestureDetector(
              onTap: () {
                // Navegar a los detalles de la zona
                Navigator.pushNamed(context, '/zone_details', arguments: zone);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue, // Color para las zonas
                      child: Text(
                        zone.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/imgs/zones/${zone.name}.jpg', // Ruta de la imagen de la zona
                      fit: BoxFit.cover,
                      width: 250,
                      height: 250,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/imgs/nodata.jpg', // Placeholder en caso de error
                          fit: BoxFit.cover,
                          width: 250,
                          height: 250,
                        );
                      },
                    ),
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
