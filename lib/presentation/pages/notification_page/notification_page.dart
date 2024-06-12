import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:recipbook/const.dart';
import 'package:recipbook/providers/notification_provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, notificationProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black,
                  fontSize: 18,
                )),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedindex = 0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Durations.long4,
                          padding: EdgeInsets.all(8),
                          decoration: selectedindex == 0
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor,
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "All",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedindex == 0
                                    ? Colors.white
                                    : primaryColor.withOpacity(0.7),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedindex = 1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Durations.long4,
                          padding: EdgeInsets.all(8),
                          decoration: selectedindex == 1
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor,
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Read",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedindex == 1
                                    ? Colors.white
                                    : primaryColor.withOpacity(0.7),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedindex = 2;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Durations.long4,
                          padding: EdgeInsets.all(8),
                          decoration: selectedindex == 2
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor,
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Unread",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedindex == 2
                                    ? Colors.white
                                    : primaryColor.withOpacity(0.7),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    children: [
                      Center(
                        child: Text(
                          "Today",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ...notificationProvider.notificationsList.map(
                        (notification) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: CupertinoColors.tertiarySystemFill,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notification.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20.0),
                                      child: Text(
                                        notification.message.toString(),
                                        style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          // fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${notification.createdAt.day} mins ago",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                                Positioned(
                                  top: 1,
                                  right: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: secondaryColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      IconlyBold.paper,
                                      color: secondaryColor,
                                      size: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
