import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomItem extends StatelessWidget {
  final String title;
  final String? description;
  final String? imageUrl;
  final IconData? icon;
  final double? rating;
  final String? distance;
  final String? time;
  final String? discountLabel;

  const CustomItem({
    Key? key,
    required this.title,
    this.description,
    this.imageUrl,
    this.icon,
    this.rating,
    this.distance,
    this.time,
    this.discountLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image or Icon section
          if (imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl!,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            )
          else if (icon != null)
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(icon, size: 40),
            ),
          // Discount label
          if (discountLabel != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                discountLabel!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          // Title section
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2, // Allow title to wrap to the next line
                  overflow: TextOverflow
                      .ellipsis, // Add ellipsis if title exceeds maxLines
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (rating != null && time != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.black, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "$rating | $time",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppTextStyles {
  static TextStyle headline = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextStyle body = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static const TextStyle discountLabel = TextStyle(
    fontSize: 10,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
