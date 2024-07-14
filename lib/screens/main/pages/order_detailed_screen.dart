import 'package:flutter/material.dart';
import 'package:wholesalegrocery/screens/main/pages/home_screen.dart';
import 'package:wholesalegrocery/screens/main/pages/order_item_card.dart';
import 'package:wholesalegrocery/utils/constant.dart';
import 'package:wholesalegrocery/widget/socail_button.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              // Placeholder for future order summary
              Text(
                "Your order details will be displayed here.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(itemBuilder: (context, index) {
                  return OrderedItemCard(
                    numOfItem: 5,
                    title: "Chicken",
                    description: "BoneLess Chicken",
                    price: 50,
                  );
                }),
              ),
              const SizedBox(height: defaultPadding * 2),
              SaveButton(
                title: "Continue Shopping",
                onTap: () {
                  // Navigate to the home screen and replace the current screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
