import 'package:flutter/material.dart';
// import 'package:storeapp/main.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const SectionHeader({super.key, required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          // style: headerStyle
        ),
        TextButton(
            onPressed: onSeeAll,
            child: const Text(
              "See all",
              style: TextStyle(color: Colors.green),
            )),
      ],
    );
  }
}
