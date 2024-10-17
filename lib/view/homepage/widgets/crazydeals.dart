import 'package:flutter/material.dart';

class CrazeDealsSection extends StatelessWidget {
  const CrazeDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildScrollableItem(
            context,
            "Customer favourite\ntop supermarkets",
            "Explore",
            Colors.black,
            'assets/image/veg.png',
          ),
          buildScrollableItem(
            context,
            "BUY 1 GET 1\nFREE ON APPLES",
            "SHOP NOW",
            Colors.black,
            'assets/image/Figma_Resources_2-removebg-preview 1 (1).png',
          ),
          buildScrollableItem(
            context,
            "SPECIAL OFFER\nON ORANGES",
            "DISCOVER",
            Colors.purple,
            'assets/image/Figma_Resources_2-removebg-preview 1 (1).png',
          ),
        ],
      ),
    );
  }

  Widget buildScrollableItem(
    BuildContext context,
    String title,
    String buttonText,
    Color backgroundColor,
    String imagePath,
  ) {
    return Container(
      height: 165,
      width: MediaQuery.of(context).size.width - 70,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title.isNotEmpty)
                    Text(
                      title,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  const SizedBox(height: 3),
                  if (buttonText.isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              buttonText,
                              style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Transform.scale(
                scale: 1.50,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 110,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
