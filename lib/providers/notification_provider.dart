import 'package:flutter/cupertino.dart';

import '../models/notification.dart';

class NotificationProvider extends ChangeNotifier {
  List<Notifications> notificationsList = [
    Notifications(
      id: "1",
      title: "New Recipe Alert",
      message:
          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
      createdAt: DateTime.now(),
    ),
    Notifications(
      id: "2",
      title: "New Recipe Alert",
      message:
          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
      createdAt: DateTime.now(),
    ),
    Notifications(
      id: "3",
      title: "New Recipe Alert",
      message:
          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
      createdAt: DateTime.now(),
    ),
    Notifications(
      id: "3",
      title: "New Recipe Alert",
      message:
          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
      createdAt: DateTime.now(),
    ),
    Notifications(
      id: "4",
      title: "New Recipe Alert",
      message:
          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
      createdAt: DateTime.now(),
    ),
    Notifications(
      id: "5",
      title: "New Recipe Alert",
      message:
          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
      createdAt: DateTime.now(),
    ),
    Notifications(
      id: "6",
      title: "New Recipe Alert",
      message:
          "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum",
      createdAt: DateTime.now(),
    ),
  ];
}
