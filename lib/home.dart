import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Provides/profile_provider.dart';
import 'package:my_app/Provides/menu_provider.dart';
import 'package:my_app/Components/loyalty_bar.dart';
import 'package:my_app/Components/bottom_nav_bar.dart';
import 'package:my_app/reward.dart';
import 'package:my_app/detail.dart';
import 'package:my_app/profile.dart';
import 'package:my_app/cart.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _listMenu = context.read<MenuProvider>().listMenu;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 18, 26, 18),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: <Widget>[
                    const Text(
                      "Good morning",
                      style: TextStyle(
                        color: Color(0xFFD8D8D8),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      context.watch<ProfileProvider>().userProfile["name"]!,
                      style: const TextStyle(
                        color: Color(0xFF001833),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container(),),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => Cart(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                        size: 23,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 23,
                  ),
                ),
              ],
            ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Reward(),
              ),
            );
          },
          child: LoyaltyBar(),
        ),
        const SizedBox(height: 38),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF324A59),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                const Text(
                  "Choose your drinks",
                  style: TextStyle(
                    color: Color(0xFFD8D8D8),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 20,
                  runSpacing: 17,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => Detail(drinkIndex: index),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        width: 154,
                        height: 164,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              // "lib/assets/images/home-" + _listCoffeeImage[index % 4] + ".png",
                              _listMenu[index % 4]["image"],
                            ),
                            Expanded(child: Container()),
                            Text(
                              // _listCoffeeName[index % 4],
                              _listMenu[index % 4]["name"],
                              style: const TextStyle(
                                color: Color(0xFF001833),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
        ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(curPage: 0,),
    );
  }
}