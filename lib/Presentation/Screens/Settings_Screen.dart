import 'package:flutter/material.dart';
import 'package:intershipflutter/businessLogic/Theme_Provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Themes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // DARK MODE SWITCH
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.2),

                    blurRadius:
                        Theme.of(context).brightness == Brightness.dark ? 2 : 4,
                    spreadRadius:
                        Theme.of(context).brightness == Brightness.dark ? 1 : 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Dark mode", style: TextStyle(fontSize: 16)),
                  Switch(
                    value: themeProvider.isDark,
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildLanguageTile("English"),
            const SizedBox(height: 15),
            _buildLanguageTile("Arabic"),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(String language) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => setState(() => selectedLanguage = language),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),

              blurRadius:
                  Theme.of(context).brightness == Brightness.dark ? 2 : 4,
              spreadRadius:
                  Theme.of(context).brightness == Brightness.dark ? 1 : 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(language, style: const TextStyle(fontSize: 16)),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.2),

                    blurRadius:
                        Theme.of(context).brightness == Brightness.dark ? 2 : 4,
                    spreadRadius:
                        Theme.of(context).brightness == Brightness.dark ? 1 : 4,
                    offset: const Offset(0, 1),
                  ),
                ],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.teal, width: 2),
              ),
              child:
                  selectedLanguage == language
                      ? Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal,
                          ),
                        ),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
