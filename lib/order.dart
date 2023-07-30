import 'package:flutter/material.dart';
import 'package:my_app/Components/bottom_nav_bar.dart';
import 'package:my_app/Components/title_bar.dart';
import 'package:my_app/Provides/menu_provider.dart';
import 'package:my_app/Provides/profile_provider.dart';
import 'package:provider/provider.dart';

Widget orderSection(BuildContext context, Map<String, dynamic> orderInfo) {
  return Container(
    margin: const EdgeInsets.fromLTRB(32, 0, 32, 23),
    padding: const EdgeInsets.only(bottom: 10),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    orderInfo["date"],
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        orderInfo["shot"] + " | ",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        orderInfo["select"] + " | ",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      (orderInfo["select"] == "iced")
                      ?
                      Text(
                        orderInfo["ice"] + " | ",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      )
                      :
                      Container()
                      ,
                      Text(
                        orderInfo["size"],
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "\$" + (orderInfo["price"]).toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Icon(Icons.coffee_outlined, size: 20),
            Text(
              orderInfo["name"],
              style: const TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.location_on_outlined, size: 20),
            Text(
              context.watch<ProfileProvider>().userProfile["address"]!,
              style: const TextStyle(
                fontSize: 10,
              ),
            )
          ],
        )
      ],
    ),
  );
}

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int _curPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TitleBar(title: "My order"),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _curPage = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 16),
                    margin: EdgeInsets.only(bottom: 50, left: 40, right: 40),
                    decoration: 
                    (_curPage == 0)
                    ?
                    const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    )
                    :
                    const BoxDecoration(),
                    child: Text(
                      "On going",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _curPage = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 16),
                    margin: EdgeInsets.only(bottom: 50, left: 40, right: 40),
                    decoration: 
                    (_curPage == 1)
                    ?
                    const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    )
                    :
                    const BoxDecoration(),
                    child: Text(
                      "History",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: List.generate((_curPage == 0) ? context.watch<MenuProvider>().listOrder.length : context.watch<MenuProvider>().listHistory.length, (index) {
                return (_curPage == 0)
                ?
                GestureDetector(
                  onTap: () {
                    setState(() {
                      context.read<MenuProvider>().deleteListOrder(index);
                    });
                  },
                  child: orderSection(context, context.watch<MenuProvider>().listOrder[index]),
                )
                : orderSection(context, context.watch<MenuProvider>().listHistory[index]);
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(curPage: 1),
    );
  }
}