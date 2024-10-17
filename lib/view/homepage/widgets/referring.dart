import 'package:flutter/material.dart';

class ReferEarn extends StatelessWidget {
  const ReferEarn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Refer & Earn",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Invite your friends & earn 15% off",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_circle_right,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              "assets/image/gift.png",
              fit: BoxFit.contain,
              height: 90,
            ),
            const SizedBox(
              width: 8,
            )
          ],
        ),
      ),
    );
  }
}
