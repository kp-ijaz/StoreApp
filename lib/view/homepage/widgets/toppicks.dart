import 'package:flutter/material.dart';

class TopPickSection extends StatelessWidget {
  const TopPickSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildScrollableItem(
            context,
            "DISCOUNT\n25% ALL\nFRUITS",
            "CHECK NOW",
            Colors.green,
            'assets/image/Figma_Resources_2-removebg-preview 1 (1).png',
          ),
          _buildScrollableItem(
            context,
            "BUY 1 GET 1\nFREE ON APPLES",
            "SHOP NOW",
            Colors.blue,
            'assets/image/Figma_Resources_2-removebg-preview 1 (1).png',
          ),
          _buildScrollableItem(
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

  Widget _buildScrollableItem(
    BuildContext context,
    String title,
    String buttonText,
    Color backgroundColor,
    String imagePath,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
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
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 175, 54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: SizedBox(
                      width: 160,
                      height: 30,
                      child: Center(
                          child: Text(
                        buttonText,
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // color: Colors.amber,
              child: Transform.scale(
                scale: 1.3,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
