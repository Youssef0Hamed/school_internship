import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/favouriteCardModel.dart';

class FavouriteCard extends StatelessWidget {

  final Favouritecardmodel model;
  const FavouriteCard({super.key, required this.model});

  @override
  Widget build(BuildContext context, ) {
    
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 264,
      decoration: BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),

      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 163,
                width: double.infinity,
                child: Image.network(model.imageUrl, fit: BoxFit.cover),
              ),
              
              Positioned(
                top: 141,
                left: 10,
                child: Container(
                  width: 83,
                  height: 23,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      "${model.discount}% off",
                      style: TextStyle(
                        color: const Color(0xFFC9A66B), // keep gold highlight
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                      Container(
                        width: 53,
                        height: 22,
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              model.rate.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: colors.onSurface,
                              ),
                            ),
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.mic_none_outlined,
                          size: 15,
                          color: colors.onSurface,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Live music",
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        Icon(Icons.wifi, size: 15, color: colors.onSurface),
                        const SizedBox(width: 4),
                        Text(
                          "WIFI",
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.fastfood_outlined,
                          size: 15,
                          color: colors.onSurface,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Mexican",
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: colors.onSurface,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "1.11 norway london",
                      style: TextStyle(fontSize: 12, color: colors.onSurface),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
