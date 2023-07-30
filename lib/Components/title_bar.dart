import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleBar extends StatefulWidget {
  late String _title;

  TitleBar({Key? key, required String title}) : super(key: key) {
    _title = title;
  }

  String get title => _title;

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  late String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 23, 26, 35),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: const Icon(Icons.arrow_back),
          ),
          Expanded(
            child: Center(
              child: Text(
                _title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}