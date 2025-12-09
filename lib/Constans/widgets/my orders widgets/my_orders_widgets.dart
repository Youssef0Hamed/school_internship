// will create my widget
import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';

class MyOrdersWidgets extends StatelessWidget {
  const MyOrdersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 192,
        width: 330,
        decoration: BoxDecoration(
          color: Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 160,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/e09fb6628eac6a0ab1526b10543ab47ff30bfbef.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    height: 113,
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Tacos",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Container(
                                height: 28.25177574157715,
                                width: 52.727455139160156,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "4.3",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                      size: 22,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_circle_outline_sharp,
                                  size: 10,
                                ),
                                SizedBox(width: 3),
                                Text("Mexican", style: TextStyle(fontSize: 7)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 10),
                                SizedBox(width: 3),
                                Text(
                                  "1.11 norway london",
                                  style: TextStyle(fontSize: 7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 140,
                    height: 44,
                    child: Center(
                      child: Text(
                        "RE-Book",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColors().primary),
                      
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    width: 140,
                    height: 44,
                    child: Center(
                      child: Text(
                        "review",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: mainColors().primary,
                      
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
