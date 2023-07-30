import 'package:flutter/material.dart';
import 'package:my_app/Provides/menu_provider.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Provides/profile_provider.dart';
import 'package:my_app/Components/loyalty_bar.dart';
import 'package:my_app/Components/title_bar.dart';
import 'package:my_app/Components/bottom_nav_bar.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TitleBar(title: "Rewards"),
          LoyaltyBar(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF324A59),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "My Points:",
                        style: TextStyle(
                          color: Color(0xFFD8D8D8),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${context.watch<MenuProvider>().currentPoint}",
                        style: const TextStyle(
                          color: Color(0xFFD8D8D8),
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container(),),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(19, 162, 205, 233),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.fromLTRB(9, 7, 9, 7),
                    child: const Text(
                      "Redeem drinks",
                      style: TextStyle(
                        color: Color(0xFFD8D8D8),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(31, 31, 31, 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "History rewards",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(31, 0, 34, 10),
              children: List.generate(context.watch<MenuProvider>().listHistoryReward.length, (index) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFF4F5F7), // Customize the color of the border here
                          width: 2, // Customize the width of the border here
                        ),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 16, 2, 20),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              context.watch<MenuProvider>().listHistoryReward[index]["name"],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              context.watch<MenuProvider>().listHistoryReward[index]["date"],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(70, 50, 74, 89),
                              ),
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                        Text(
                          "+ ${context.watch<MenuProvider>().listHistoryReward[index]["point"]} Pts",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(curPage: 3,),
    );
  }
}