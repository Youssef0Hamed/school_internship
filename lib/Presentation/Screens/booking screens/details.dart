import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/text%20filed/custom_text_field.dart.dart';
import 'package:intershipflutter/Presentation/Screens/booking%20screens/confirmation_screen.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _BookTableScreenState();
}

class _BookTableScreenState extends State<Details> {
  String value = 'Birthday';

  final TextEditingController controllername = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController controllerphone = TextEditingController();

  @override
  void dispose() {
    controllername.dispose();
    controlleremail.dispose();
    controllerphone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF085651),
          ),
        ),
        title: const Text(
          "Book a table",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your information details",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: "Name",
                hintText: "",
                controller: controllername,
                enabled: true,
              ),
              const SizedBox(height: 11),
              CustomTextField(
                label: "Email",
                hintText: "",
                controller: controlleremail,
                enabled: true,
              ),
              const SizedBox(height: 11),
              CustomTextField(
                label: "Phone number",
                hintText: "",
                controller: controllerphone,
                enabled: true,
              ),
              const SizedBox(height: 11),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Occasion',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: value,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(136, 190, 190, 190)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 73, 73, 73)),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'Birthday', child: Text('Birthday')),
                        DropdownMenuItem(
                            value: 'Anniversary', child: Text('Anniversary')),
                        DropdownMenuItem(
                            value: 'Businessl', child: Text('Business')),
                        DropdownMenuItem(value: 'Date', child: Text('Date')),
                        DropdownMenuItem(
                            value: 'Family', child: Text('Family')),
                        DropdownMenuItem(
                            value: 'something else',
                            child: Text('something else')),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            value = val;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => confirmation(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            backgroundColor: Color(0xFF085651),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFF085651)),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Text(
            "Continue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
