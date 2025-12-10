import 'package:flutter/material.dart';

class EditRestaurantScreen extends StatefulWidget {
  const EditRestaurantScreen({Key? key}) : super(key: key);

  @override
  _EditRestaurantScreenState createState() => _EditRestaurantScreenState();
}

class _EditRestaurantScreenState extends State<EditRestaurantScreen> {
  bool isEditing = false;

  final TextEditingController nameController =
      TextEditingController(text: "Tacos");
  final TextEditingController aboutController =
      TextEditingController(text: "At Tacos, we believe food should...");
  final TextEditingController phoneController =
      TextEditingController(text: "0111111111");
  final TextEditingController emailController =
      TextEditingController(text: "Tacos@gmail.com");

  void toggleEdit() {
    setState(() {
      // لو كنت بأعدل، يبقى دلوقتي هعمل Save
      // ولو مش بأعدل، هبدء تعديل
      isEditing = !isEditing;
    });

    if (!isEditing) {
      // هنا تعمل عملية حفظ البيانات في الـ backend
      print("Saved:");
      print(nameController.text);
      print(aboutController.text);
      print(phoneController.text);
      print(emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: toggleEdit,
        child: Icon(
          isEditing ? Icons.save : Icons.edit,
          size: 28,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              enabled: isEditing,
              decoration: customInputDecoration("Tacos"),
            ),
            const SizedBox(height: 18),
            const Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: aboutController,
              enabled: isEditing,
              decoration: customInputDecoration("Tacos"),
              maxLines: 4,
            ),
            const SizedBox(height: 18),
            const Text("Phone", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneController,
              decoration: customInputDecoration("Tacos"),
              enabled: isEditing,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 18),
            const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: customInputDecoration("Tacos"),
              enabled: isEditing,
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration customInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.teal, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    ),
  );
}
