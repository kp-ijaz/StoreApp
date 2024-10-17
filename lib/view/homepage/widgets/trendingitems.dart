import 'package:flutter/material.dart';
// import 'package:storeapp/main.dart';
import 'package:storeapp/view/homepage/widgets/sectionheader.dart';
import 'package:storeapp/view/homepage/widgets/widgets.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Trending", onSeeAll: () {}),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return const TrendingItem();
            },
          ),
        ),
        const SizedBox(height: 22),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return const TrendingItem();
            },
          ),
        ),
      ],
    );
  }
}

class TrendingItem extends StatelessWidget {
  const TrendingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245,
      margin: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage("assets/image/TLD6iCOlyb0.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.amber),
          ),
          const SizedBox(width: 11),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mithas Bhandar",
                  //  style: subHeaderStyle
                ),
                const SizedBox(height: 4),
                const Text("Sweets, North Indian", style: AppTextStyles.body),
                const SizedBox(height: 4),
                const Text("(store location) | 6.4 kms",
                    style: AppTextStyles.body),
                const SizedBox(height: 4),
                Text(
                  "★ 4.1 | 45 mins",
                  // style: normalTextStyle
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
