import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Provides/menu_provider.dart';

// ignore: must_be_immutable
class CartSection extends StatefulWidget {
  late int _cartInfo;

  CartSection({Key? key, required int cartInfo}) : super(key: key) {
    _cartInfo = cartInfo;
  }

   int get cartInfo => _cartInfo;

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  late int _cartInfo;
  @override
  void initState() {
    super.initState();
    _cartInfo = widget._cartInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 96,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FB), 
          borderRadius: BorderRadius.circular(20), 
          border: Border.all(width: 1),
        ),
        padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
        child: Row(
          children: <Widget>[
            Image.asset(
              context.watch<MenuProvider>().listCart[_cartInfo]["image"],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.watch<MenuProvider>().listCart[_cartInfo]["name"],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          context.watch<MenuProvider>().listCart[_cartInfo]["shot"] + " | ",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          context.watch<MenuProvider>().listCart[_cartInfo]["select"] + " | ",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        (context.watch<MenuProvider>().listCart[_cartInfo]["select"] == "iced")
                        ?
                        Text(
                          context.watch<MenuProvider>().listCart[_cartInfo]["ice"] + " | ",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        )
                        :
                        Container()
                        ,
                        Text(
                          context.watch<MenuProvider>().listCart[_cartInfo]["size"],
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "x ${context.watch<MenuProvider>().listCart[_cartInfo]["number"]}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "\$" + (context.watch<MenuProvider>().listCart[_cartInfo]["price"]).toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
    );
  }
}