import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/text filed/custom_text_field.dart.dart';
import 'package:intershipflutter/Presentation/Screens/booking screens/confirmation_screen.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
    final colors = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: colors.onBackground),
        ),
        title: Text(
          "Book a table",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colors.onBackground, // Auto color based on theme
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your information details",
                style: TextStyle(
                  fontSize: width * 0.05,
                  color: colors.onBackground,
                ),
              ),
              SizedBox(height: 15),

              /// Name
              CustomTextField(
                label: "Name",
                hintText: "Youssef",
                controller: controllername,
                enabled: true,
              ),
              SizedBox(height: 12),

              /// Email
              CustomTextField(
                label: "Email",
                hintText: "example@gmail.com",
                controller: controlleremail,
                enabled: true,
              ),
              SizedBox(height: 12),

              /// Phone
              CustomTextField(
                label: "Phone number",
                hintText: "0123 456 789",
                controller: controllerphone,
                enabled: true,
              ),
              SizedBox(height: 12),

              /// Occasion
              Text(
                'Occasion',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: colors.onBackground,
                ),
              ),
              SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: value,
                icon: Icon(Icons.keyboard_arrow_down, color: colors.onBackground),
                dropdownColor: colors.surface, // Auto dark/light
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colors.surface,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: colors.onBackground.withOpacity(0.3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: colors.onBackground.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: colors.primary),
                  ),
                ),
                style: TextStyle(color: colors.onBackground), // text auto update
                items: const [
                  DropdownMenuItem(value: 'Birthday', child: Text('Birthday')),
                  DropdownMenuItem(value: 'Anniversary', child: Text('Anniversary')),
                  DropdownMenuItem(value: 'Business', child: Text('Business')),
                  DropdownMenuItem(value: 'Date', child: Text('Date')),
                  DropdownMenuItem(value: 'Family', child: Text('Family')),
                  DropdownMenuItem(value: 'Something else', child: Text('Something else')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      value = val;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 15),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ConfirmationScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: colors.primary),
              ),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.045,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}