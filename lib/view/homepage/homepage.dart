// lib/view/homepage/homepage.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/controller/notification_provider/notification_provider.dart';
// import 'package:storeapp/providers/notification_provider.dart';
import 'package:storeapp/view/notificationpage/notification.dart';
import 'package:storeapp/view/homepage/widgets/categoryitems.dart';
import 'package:storeapp/view/homepage/widgets/crazydeals.dart';
import 'package:storeapp/view/homepage/widgets/nearbystores.dart';
import 'package:storeapp/view/homepage/widgets/referring.dart';
import 'package:storeapp/view/homepage/widgets/toppicks.dart';
import 'package:storeapp/view/homepage/widgets/trendingitems.dart';
// import 'package:storeapp/view/homepage/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 30,
                  color: Color.fromARGB(183, 244, 67, 54),
                ),
                const SizedBox(width: 5),
                const Text(
                  "ABCD, New Delhi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(155, 0, 0, 0),
                  size: 32,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(101, 209, 199, 199),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          labelText: "Search for products/stores",
                          labelStyle: TextStyle(fontSize: 16),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Consumer<NotificationProvider>(
                      builder: (context, provider, child) {
                        return Stack(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 32,
                              ),
                              onPressed: () {
                                provider
                                    .fetchNotifications(); // Fetch notifications
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationPage(),
                                  ),
                                );
                              },
                              color: Colors.red,
                            ),
                            if (provider.notifications
                                .isNotEmpty) // Show notification count if any
                              Positioned(
                                right: 9,
                                bottom: 17,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    '2', // Replace with provider notification count if needed
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.sell_outlined,
                      size: 32,
                      color: Colors.amber,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "What would you like to do today?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const CategorySection(),
                const Text(
                  "Top picks for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                const TopPickSection(),
                const SizedBox(height: 16),
                const TrendingSection(),
                const SizedBox(height: 16),
                const Text(
                  "Craze deals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                const CrazeDealsSection(),
                const SizedBox(height: 16),
                const ReferEarn(),
                const NearbyStoresSection(),
                const SizedBox(height: 5),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 10),
                    ),
                    child: const Text(
                      "View all stores",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.amber),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.amber),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.amber),
              label: "My Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.amber),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
