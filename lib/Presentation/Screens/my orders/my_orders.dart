import 'package:flutter/material.dart';
import 'package:intershipflutter/Constans/widgets/colors.dart';
import 'package:intershipflutter/Constans/widgets/my%20orders%20widgets/my_orders_widgets.dart';
import 'package:intershipflutter/Constans/widgets/my%20orders%20widgets/upcoming_history_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: mainColors().primary,
          size: 30,
          fontWeight: FontWeight.bold,
        ),
        title: Text(
          "My Orders",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: UpcomingHistoryToggle(),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                
                
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: MyOrdersWidgets(),
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
