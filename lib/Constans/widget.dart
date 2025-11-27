import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intershipflutter/Constans/colors.dart';

Widget mainbutton(String text,double width,double height,{VoidCallback? onPressed,}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,  
      style: ElevatedButton.styleFrom(
        backgroundColor:  mainColors().primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget Textfiled(String Text){
  return   TextField(
                  decoration: InputDecoration(
                    hintText: "${Text}" ,
                    hintStyle:  TextStyle(fontSize: 15),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding:
                         EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                );
}

 Widget socialIcon(String url) {
    return Container(
      padding:  EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            spreadRadius: 1,
            offset:  Offset(0, 2),
          )
        ],
      ),
      child: Image.network(url, height: 26),
    );
  }