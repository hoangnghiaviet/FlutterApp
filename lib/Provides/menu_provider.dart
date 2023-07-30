import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';

class MenuProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _listMenu = [
    {
      "name": "Americano",
      "image": "lib/assets/images/home-americano.png",
      "price": 3.01
    },
    {
      "name": "Cappuccino",
      "image": "lib/assets/images/home-cappuccino.png",
      "price": 3.00
    },
    {
      "name": "Mocha",
      "image": "lib/assets/images/home-mocha.png",
      "price": 3.00
    },
    {
      "name": "Flat White",
      "image": "lib/assets/images/home-flatwhite.png",
      "price": 3.01
    }
  ];

  List<Map<String, dynamic>> _listCart = [
    {
      "name": "Americano",
      "image": "lib/assets/images/home-americano.png",
      "price": 3.01,
      "number": 1,
      "shot": "single",
      "select": "iced",
      "ice": "70 ice",
      "size": "medium"
    },
    {
      "name": "Cappuccino",
      "image": "lib/assets/images/home-cappuccino.png",
      "price": 3.00,
      "number": 1,
      "shot": "single",
      "select": "hot",
      "size": "medium"
    },
    {
      "name": "Mocha",
      "image": "lib/assets/images/home-mocha.png",
      "price": 3.00,
      "number": 1,
      "shot": "single",
      "select": "iced",
      "ice": "70 ice",
      "size": "medium"
    },
  ];

  List<Map<String, dynamic>> _listOrder = [
    {
      "name": "Americano",
      "image": "lib/assets/images/home-americano.png",
      "price": 3.01,
      "number": 1,
      "shot": "single",
      "select": "iced",
      "ice": "70 ice",
      "size": "medium",
      "date": "2023-07-30 15:56:38"
    },
    {
      "name": "Cappuccino",
      "image": "lib/assets/images/home-cappuccino.png",
      "price": 3.00,
      "number": 1,
      "shot": "single",
      "select": "hot",
      "size": "medium",
      "date": "2023-07-30 15:56:38"
    },
    {
      "name": "Mocha",
      "image": "lib/assets/images/home-mocha.png",
      "price": 3.00,
      "number": 1,
      "shot": "single",
      "select": "iced",
      "ice": "70 ice",
      "size": "medium",
      "date": "2023-07-30 15:56:38"
    },
  ];

  List<Map<String, dynamic>> _listHistory = [
    {
      "name": "Americano",
      "image": "lib/assets/images/home-americano.png",
      "price": 30.10,
      "number": 10,
      "shot": "single",
      "select": "iced",
      "ice": "70 ice",
      "size": "medium",
      "date": "2023-07-30 15:56:38"
    },
    {
      "name": "Cappuccino",
      "image": "lib/assets/images/home-cappuccino.png",
      "price": 15.00,
      "number": 5,
      "shot": "single",
      "select": "hot",
      "size": "medium",
      "date": "2023-07-30 15:56:38"
    },
    {
      "name": "Mocha",
      "image": "lib/assets/images/home-mocha.png",
      "price": 3.00,
      "number": 1,
      "shot": "single",
      "select": "iced",
      "ice": "70 ice",
      "size": "medium",
      "date": "2023-07-30 15:56:38"
    },
  ];

  List<Map<String, dynamic>> _listHistoryReward = [
    {
      "name": "Americano",
      "date": "2023-07-25 12:30:00",
      "point": 70,
    },
    {
      "name": "Americano",
      "date": "2023-07-24 12:30:00",
      "point": 35,
    },
    {
      "name": "Mocha",
      "date": "2023-07-20 15:40:00",
      "point": 70,
    },
    {
      "name": "Cappuccino",
      "date": "2023-07-20 08:30:00",
      "point": 35,
    },
    {
      "name": "Americano",
      "date": "2023-07-17 12:30:00",
      "point": 35,
    },
    {
      "name": "Flat White",
      "date": "2023-07-15 08:23:02",
      "point": 280,
    },
    {
      "name": "Americano",
      "date": "2023-07-14 12:30:00",
      "point": 70,
    },
    {
      "name": "Americano",
      "date": "2023-07-12 12:30:00",
      "point": 35,
    },
    {
      "name": "Mocha",
      "date": "2023-07-11 15:40:00",
      "point": 70,
    },
    {
      "name": "Cappuccino",
      "date": "2023-07-10 08:30:00",
      "point": 105,
    },
    {
      "name": "Americano",
      "date": "2023-07-8 12:30:00",
      "point": 70,
    },
    {
      "name": "Flat White",
      "date": "2023-07-7 08:23:02",
      "point": 105,
    },
    {
      "name": "Cappuccino",
      "date": "2023-07-6 08:30:00",
      "point": 105,
    },
    {
      "name": "Americano",
      "date": "2023-07-5 12:30:00",
      "point": 70,
    },
    {
      "name": "Flat White",
      "date": "2023-07-4 08:23:02",
      "point": 105,
    },
    {
      "name": "Cappuccino",
      "date": "2023-07-3 08:30:00",
      "point": 420,
    },
    {
      "name": "Americano",
      "date": "2023-07-2 12:30:00",
      "point": 210,
    },
    {
      "name": "Flat White",
      "date": "2023-07-1 08:23:02",
      "point": 210,
    }
  ];
  
  late int _loyaltyLevel;
  final int _loyaltyLimit = 8;
  int _truePoint = 0;
  int _currentPoint = 0;

  MenuProvider() {
    for (var element in _listHistoryReward) { 
      int curPoint = element['point']; 
      _truePoint += curPoint;
    }
    _currentPoint = _truePoint;
    if(_truePoint < 8000) {
      _loyaltyLevel = _truePoint ~/ 1000;
    } else {
      _loyaltyLevel = 8;
    }
  }

  int get loyaltyLevel => _loyaltyLevel;
  int get loyaltyLimit => _loyaltyLimit;
  int get truePoint => _truePoint;
  int get currentPoint => _currentPoint;
  List<Map<String, dynamic>> get listHistoryReward => _listHistoryReward;
  List<Map<String, dynamic>> get listMenu => _listMenu;
  List<Map<String, dynamic>> get listCart => _listCart;
  List<Map<String, dynamic>> get listOrder => _listOrder;
  List<Map<String, dynamic>> get listHistory => _listHistory;

  void deleteListCart(int pos) {
    if(pos >= _listCart.length) return;
    _listCart.removeAt(pos);
    notifyListeners();
  }

  void deleteListOrder(int pos) {
    if(pos > _listOrder.length) return;
    _listHistory.add(_listOrder[pos]);
    int point = _listOrder[pos]["price"];
    point *= 10;
    Map<String, dynamic> newReward = {
      "name": _listOrder[pos]["name"],
      "date": _listOrder[pos]["date"],
      "point": point
    };
    _truePoint += point;
    _currentPoint = _truePoint;
    _listOrder.removeAt(pos);
    _listHistoryReward.add(newReward);
    notifyListeners();
  }

  void clearListCart() {
    for(Map<String, dynamic> element in _listCart) {
      Map<String, dynamic> newOrder = element;
      DateTime currentDate = DateTime.now();
      newOrder["date"] = DateFormat('yyyy-MM-dd HH:mm:ss').format(currentDate);
      _listOrder.add(newOrder);
    }
    _listCart.clear();
    notifyListeners();
  }

  void addListCart(Map<String, dynamic> newCart) {
    _listCart.add(newCart);
    notifyListeners();
  }
}