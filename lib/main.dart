import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/controller/notification_provider/notification_provider.dart';
// import 'providers/notification_provider.dart';
import 'view/homepage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Store App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const HomePage(),
      ),
    );
  }
}
