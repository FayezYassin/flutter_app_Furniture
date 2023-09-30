import 'package:flutter/material.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';
import 'package:flutter_appltessst/screendesign/secoundsecrren.dart';

import 'notificationsecrren.dart';
import 'productsscreen.dart';
import 'send_order.dart';

class Mainscreenexhi extends StatefulWidget {
  const Mainscreenexhi({Key? key}) : super(key: key);

  @override
  State<Mainscreenexhi> createState() => _MainscreenexhiState();
}

class _MainscreenexhiState extends State<Mainscreenexhi> {
  int curentindex = 0;
  List<Widget> screens = [Screenproduct(), NotificationSecrren(), SendOrder()];
  List<String> titels = ['home', 'Notification', 'Send order'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titels[curentindex]),
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curentindex,
        onTap: (value) {
          setState(() {
            curentindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'product',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add_rounded),
              label: 'notificaction'),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_quote_sharp), label: 'send order'),
        ],
      ),
      body: screens[curentindex],
    );
  }
}
