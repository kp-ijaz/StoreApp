import 'package:flutter/material.dart';
// import 'package:storeapp/main.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.count(
            padding: EdgeInsets.zero,
            childAspectRatio: 0.76,
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              CategoryItem(
                  imagePath: "assets/image/G0.png",
                  label: "Food\nDelivery",
                  discount: "10% Off"),
              CategoryItem(
                  imagePath: "assets/image/G1.png",
                  label: "Medicines",
                  discount: "10% Off"),
              CategoryItem(
                  imagePath: "assets/image/G2.png",
                  label: "Pet\nSupplies",
                  discount: "10% Off"),
              CategoryItem(imagePath: "assets/image/G3.png", label: "Gifts"),
              CategoryItem(imagePath: "assets/image/G4.png", label: "Meat"),
              CategoryItem(imagePath: "assets/image/G5.png", label: "Cosmetic"),
              CategoryItem(
                  imagePath: "assets/image/G6.png", label: "Stationery"),
              CategoryItem(
                  imagePath: "assets/image/G7.png",
                  label: "Stores",
                  discount: "10% Off"),
            ],
          ),
        ),
        Center(
          child: TextButton.icon(
            onPressed: () {},
            label: const Text(
              "More",
              style: TextStyle(color: Colors.green),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.green,
            ),
            iconAlignment: IconAlignment.end,
          ),
        )
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final String? discount;

  const CategoryItem(
      {super.key, required this.imagePath, required this.label, this.discount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            if (discount != null)
              Positioned(
                top: 1,
                right: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    discount!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          // style: normalTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
