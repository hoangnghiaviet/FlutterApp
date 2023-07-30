import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Provides/menu_provider.dart';
import 'package:my_app/Components/title_bar.dart';
import 'package:my_app/cart.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  late int _drinkIndex;

  Detail({Key? key, required int drinkIndex}) : super(key: key) {
    _drinkIndex = drinkIndex;
  }

  int get drinkIndex => _drinkIndex;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late int _drinkIndex;

  int _numDrink = 1;

  int _shotChoice = 0;
  final List<String> _listShot = ["Single", "Double"];
  int _selectChoice = 1;
  final List<String> _listSelect = ["lib/assets/images/detail-select-hot-1.png", "lib/assets/images/detail-select-cold-1.png"];
  final List<String> _listSelected = ["lib/assets/images/detail-select-hot-2.png", "lib/assets/images/detail-select-cold-2.png"];
  
  int _iceChoice = 1;
  final List<String> _listIce = ["lib/assets/images/detail-size-small-1.png", "lib/assets/images/detail-size-medium-1.png", "lib/assets/images/detail-size-big-1.png"];
  final List<String> _listIceSelected = ["lib/assets/images/detail-size-small-2.png", "lib/assets/images/detail-size-medium-2.png", "lib/assets/images/detail-size-big-2.png"];
  
  int _sizeChoice = 1;
  final List<String> _listSize = ["lib/assets/images/detail-size-small-1.png", "lib/assets/images/detail-size-medium-1.png", "lib/assets/images/detail-size-big-1.png"];
  final List<String> _listSizeSelected = ["lib/assets/images/detail-size-small-2.png", "lib/assets/images/detail-size-medium-2.png", "lib/assets/images/detail-size-big-2.png"];

  @override
  void initState() {
    super.initState();
    _drinkIndex = widget.drinkIndex;
  }
  
  Widget numDrinkButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if(_numDrink > 1) {
                setState(() {
                  _numDrink--;
                });
              }
            },
            child: const Text(
              "-",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            "$_numDrink",
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              if(_numDrink < 10) {
                setState(() {
                  _numDrink++;
                });
              }
            },
            child: const Text(
              "+",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget shotRadio() {
    return Row(
      children: List.generate(_listShot.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _shotChoice = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: (_shotChoice == index) ? Colors.black : Colors.grey,
                width: (_shotChoice == index) ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            margin: (index == 0) ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 8),
            child: Text(
              _listShot[index],
              style: TextStyle(
                fontWeight: (_shotChoice == index) ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget selectRadio() {
    return Row(
      children: List.generate(_listSelect.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectChoice = index;
            });
          },
          child: Container(
            margin: (index == 0) ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 30),
            child: Image.asset(
              (_selectChoice == index)
              ? _listSelected[index]
              : _listSelect[index],
            ),
          ),
        );
      }),
    );
  }

  Widget iceRadio() {
    return Row(
      children: List.generate(_listIce.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _iceChoice = index;
            });
          },
          child: Container(
            margin: (index == 0) ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 28),
            child: Image.asset(
              (_iceChoice == index)
              ? _listIceSelected[index]
              : _listIce[index],
            ),
          ),
        );
      }),
    );
  }

  Widget sizeRadio() {
    return Row(
      children: List.generate(_listSize.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _sizeChoice = index;
            });
          },
          child: Container(
            margin: (index == 0) ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 28),
            child: Image.asset(
              (_sizeChoice == index)
              ? _listSizeSelected[index]
              : _listSize[index],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> _listMenu = context.read<MenuProvider>().listMenu;
    return Scaffold(
      body: Column(
        children: <Widget>[
          TitleBar(title: "Details"),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FB),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1),
              ),
              padding: const EdgeInsets.fromLTRB(77, 9, 77, 9),
              child: Image.asset(
                _listMenu[_drinkIndex]["image"],
                width: 172,
                height: 128,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 21, 3, 21),
                  child: Row(
                    children: [
                      Text(
                        _listMenu[_drinkIndex]["name"],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(child: Container()),
                      numDrinkButton(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: const Color(0xFFF4F5F7),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(3, 21, 3, 21),
                  child: Row(
                    children: [
                      const Text(
                        "Shot",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(child: Container()),
                      shotRadio(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: const Color(0xFFF4F5F7),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(3, 21, 3, 21),
                  child: Row(
                    children: [
                      const Text(
                        "Select",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(child: Container()),
                      selectRadio(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: const Color(0xFFF4F5F7),
                ),

                Visibility(
                  visible: _selectChoice == 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(3, 21, 3, 21),
                    child: Row(
                      children: [
                        const Text(
                          "Ice",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(child: Container()),
                        iceRadio(),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _selectChoice == 1,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: const Color(0xFFF4F5F7),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 21, 3, 21),
                  child: Row(
                    children: [
                      const Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(child: Container()),
                      sizeRadio(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 19, 30, 19),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Text(
                      "Total Amount",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      "\$" + ( _listMenu[_drinkIndex]["price"] * _numDrink).toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Map<String, dynamic> newCart = {
                        "name": _listMenu[_drinkIndex]["name"],
                        "image": _listMenu[_drinkIndex]["image"],
                        "price": _listMenu[_drinkIndex]["price"] * _numDrink,
                        "number": _numDrink,
                        "shot": (_shotChoice == 0) ? "single" : "double",
                        "select": (_selectChoice == 0) ? "hot" : "iced",
                        "ice": (_iceChoice == 0) ? "30 ice" : (_iceChoice == 1) ? "50 ice" : "70 ice",
                        "size": (_sizeChoice == 0) ? "small" : (_sizeChoice == 1) ? "medium" : "big"
                      };
                      context.read<MenuProvider>().addListCart(newCart);
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => Cart(),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF324A59),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    alignment:Alignment.center,
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}