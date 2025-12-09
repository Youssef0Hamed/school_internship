import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/my%20orders%20widgets/my_orders_widgets.dart';
import 'package:intershipflutter/Constans/widgets/my%20orders%20widgets/upcoming_history_widget.dart';
import 'package:intershipflutter/businessLogic/theme%20provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.primary, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "My Orders",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: colors.onBackground,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: UpcomingHistoryToggle(), // Make sure this widget also adapts to dark mode
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: MyOrdersWidgets(), // Ensure this widget adapts to dark mode too
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}