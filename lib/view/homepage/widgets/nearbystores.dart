import 'package:flutter/material.dart';
import 'package:storeapp/view/homepage/widgets/sectionheader.dart';

class NearbyStoresSection extends StatelessWidget {
  const NearbyStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Nearby stores", onSeeAll: () {}),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return const NearbyStoreItem();
          },
        ),
      ],
    );
  }
}

class NearbyStoreItem extends StatelessWidget {
  const NearbyStoreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // border: Border.all(
        //     color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/nearby.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Freshly Baker",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Sweets, North Indian",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Site No - 1 | 6.4 kms",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(174, 169, 209, 224),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Top Store",
                        style: TextStyle(fontSize: 10, color: Colors.blue[900]),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "★ 4.1",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "45 mins",
                      style: TextStyle(fontSize: 16, color: Colors.orange[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            // color: Colors.grey[300],
            indent: 80,
          ),
          Row(
            children: [
              const SizedBox(
                width: 80,
              ),
              Image.asset(
                "assets/image/Vector.png",
                fit: BoxFit.contain,
                height: 15,
              ),
              const SizedBox(width: 5),
              const Text(
                "Upto 10% OFF",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Image.asset(
                "assets/image/grocery (1) 1.png",
                fit: BoxFit.contain,
                height: 15,
              ),
              const SizedBox(width: 5),
              const Text(
                "3400+ items available",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
