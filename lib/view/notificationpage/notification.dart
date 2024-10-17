import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  List<dynamic> notifications = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchNotifications() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      final response = await http.get(
        Uri.parse(
            'https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData.containsKey('data')) {
          final List<dynamic> data = responseData['data'];
          setState(() {
            notifications = data;
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
            errorMessage = 'Invalid response format: "data" key not found';
          });
        }
      } else {
        setState(() {
          isLoading = false;
          errorMessage =
              'Failed to load notifications. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred: $e';
      });
      debugPrint('Error fetching notifications: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 16,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                color: Colors.green,
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            elevation: 1,
            title: const Text("Notifications"),
          ),
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage.isNotEmpty
                  ? Center(child: Text(errorMessage))
                  : notifications.isEmpty
                      ? const Center(child: Text('No notifications available.'))
                      : ListView.builder(
                          itemCount: notifications.length,
                          itemBuilder: (context, index) {
                            final notification = notifications[index];
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10),
                                      child: Image.asset(
                                        'assets/image/N$index.png',
                                        // width: 70,
                                        // height: 70,
                                        scale: 0.8,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(
                                                    Icons.image_not_supported),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notification['title'] ?? 'No Title',
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(notification['body'] ??
                                              'No Description'),
                                          const SizedBox(height: 7),
                                          if (index == 0)
                                            const Text(
                                              "57 mins ago",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          else if (index > 0 && index <= 3)
                                            const Text(
                                              "2 days ago",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    )
                                  ],
                                ),
                                if (index < notifications.length - 1)
                                  const Divider(),
                              ],
                            );
                          },
                        )),
    );
  }
}
