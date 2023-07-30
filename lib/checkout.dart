import 'package:flutter/material.dart';
import 'package:my_app/order.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "lib/assets/images/checkout.png",
          ),
          Text(
            "Order Success",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            "Your order has been placed successfully.",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            "For more details, go to my orders.",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => Order(),
                  ),
                );
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF324A59),
                borderRadius: BorderRadius.circular(30.0),
              ),
              alignment:Alignment.center,
              padding: EdgeInsets.fromLTRB(29, 14, 29, 14),
              child: const Text(
                "Track my order",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}