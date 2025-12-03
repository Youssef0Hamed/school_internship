import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/models/favouriteCardModel.dart';

class FavouriteCard extends StatelessWidget {
  final Favouritecardmodel model;
  const FavouriteCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 395,
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
                width: 450,
                child: Image.asset(model.imageUrl, fit: BoxFit.cover),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Color(0xffD9D9D9),
                  child: InkWell(
                    
                    child: Icon(
                      Icons.favorite_outlined,
                      color: model.isFavourite ? Color(0xffFF4444) : Colors.grey,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 141,
                left: 10,
                child: Container(
                  child: Center(
                    child: Text(
                      "${model.discount}% off",
                      style: TextStyle(
                        color: Color(0xffC9A66B),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  width: 83,
                  height: 23,

                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
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
                          color: Color(0xff2E3A38),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 52.727455139160156,
                        height: 22.21884536743164,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              model.rate.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(Icons.star_rounded, color: Colors.amber),
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
                        Icon(Icons.mic_none_outlined, size: 15),
                        Text("Live music", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 15),
                    Row(
                      children: [
                        Icon(Icons.wifi, size: 15),
                        Text("WIFI", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 15),
                    Row(
                      children: [
                        Icon(Icons.fastfood_outlined, size: 15),
                        Text("Mexican", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 15),
                    Text("1.11 norway london", style: TextStyle(fontSize: 12)),
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
