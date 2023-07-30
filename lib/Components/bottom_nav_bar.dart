import 'package:flutter/material.dart';
import 'package:my_app/home.dart';
import 'package:my_app/order.dart';
import 'package:my_app/reward.dart';
import 'package:my_app/cart.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  late int _curPage;

  BottomNavBar({Key? key, required int curPage}) : super(key: key) {
    _curPage = curPage;
  }

  int get curPage => _curPage;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Map<String, dynamic>> _listNav = [
    {
      "Icon": Icon(Icons.home, color: Colors.black),
      "Tip": 'Home',
      "Page": Home()
    },
    {
      "Icon": Icon(Icons.coffee, color: Colors.black),
      "Tip":  'Order',
      "Page": Order(),
    },
    {
      "Icon": Icon(Icons.shopping_cart_outlined, color: Colors.black),
      "Tip":  'Cart',
      "Page": Cart()
    },
    {
      "Icon": Icon(Icons.card_giftcard, color: Colors.black),
      "Tip":  'Reward',
      "Page": Reward()
    },
  ];

  late int _curPage;

  @override
  void initState() {
    super.initState();
    _curPage = widget.curPage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF324A59),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child:BottomAppBar(
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: List.generate(_listNav.length, (index) {
                return IconButton(
                  tooltip: _listNav[index]["Tip"],
                  icon: _listNav[index]["Icon"],
                  onPressed: () {
                    if(index == _curPage) return;
                    if(_listNav[index]["Page"] == Null) return;
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => _listNav[index]["Page"],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}