import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Components/cart_section.dart';
import 'package:my_app/Provides/menu_provider.dart';
import 'package:my_app/Components/title_bar.dart';
import 'package:my_app/checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late List<int> _listDelete;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _listDelete = List.generate(context.watch<MenuProvider>().listCart.length, (index) => 0);
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for(Map<String, dynamic> cart in context.watch<MenuProvider>().listCart) {
      double curPrice = cart["price"];
      totalPrice += curPrice;
    };
    return Scaffold(
      body: Column(
        children: <Widget>[
          TitleBar(title: "My cart"),
          Expanded(
            child: ListView(
              children: List.generate(context.watch<MenuProvider>().listCart.length, (index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(24, 0, 24, 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _listDelete[index] = 1 - _listDelete[index];
                            });
                          },
                          child: CartSection(cartInfo: index),
                        ),
                      ),
                      (_listDelete[index] == 0)
                      ?
                      Container()
                      :
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            context.read<MenuProvider>().deleteListCart(index);
                            _listDelete.removeAt(index);
                          });
                            // print(context.watch<MenuProvider>().listCart);
                        },
                        child: Container(
                          height: 96,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE5E5), 
                            borderRadius: BorderRadius.circular(20), 
                          ),
                          margin: const EdgeInsets.only(left: 11),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: const Icon(
                            Icons.delete_outline,
                            color: Color(0xFFFF3030),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(33, 20, 33, 33),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Total price"
                      ),
                      Text(
                        "\$" + totalPrice.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      context.read<MenuProvider>().clearListCart();
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => Checkout(),
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
                      "Checkout",
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
        ],
      ),
    );
  }
}