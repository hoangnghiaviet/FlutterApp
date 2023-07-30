import 'package:flutter/material.dart';
import 'package:my_app/Provides/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Provides/profile_provider.dart';

class LoyaltyBar extends StatefulWidget {
  const LoyaltyBar({super.key});

  @override
  State<LoyaltyBar> createState() => _LoyaltyBarState();
}

class _LoyaltyBarState extends State<LoyaltyBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF324A59),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.fromLTRB(23, 14, 23, 17),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Loyalty card",
                  style: TextStyle(
                    color: Color(0xFFD8D8D8),
                    fontSize: 14,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "${context.watch<MenuProvider>().loyaltyLevel} / ${context.watch<MenuProvider>().loyaltyLimit}",
                  style: TextStyle(
                    color: Color(0xFFD8D8D8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(context.watch<MenuProvider>().loyaltyLimit, (index) {
                  return Image.asset(
                    (index < context.watch<MenuProvider>().loyaltyLevel)
                    ? 'lib/assets/images/coffee-cup-1.png'
                    : 'lib/assets/images/coffee-cup-2.png',
                    width: 30,
                    height: 30,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}