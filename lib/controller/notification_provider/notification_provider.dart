// lib/providers/notification_provider.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/model/notificationmode.dart';
import 'dart:convert';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<NotificationModel> get notifications => _notifications;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchNotifications() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
            'https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData.containsKey('data')) {
          final List<dynamic> data = responseData['data'];
          _notifications =
              data.map((item) => NotificationModel.fromJson(item)).toList();
        } else {
          _errorMessage = 'Invalid response format: "data" key not found';
        }
      } else {
        _errorMessage =
            'Failed to load notifications. Status code: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
