import 'package:flutter/material.dart';
import 'package:flutter_appltessst/mangaccount/components/rounded_button.dart';

import 'send_order.dart';

class NotificationSecrren extends StatelessWidget {
  const NotificationSecrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => iteamnotificationlist(context),
      separatorBuilder: (context, index) => Container(
        color: Colors.red,
        height: 1.0,
      ),
      itemCount: 12,
    );
  }

  Widget iteamnotificationlist(context) {
    return Dismissible(
      key: Key('value'),
      onDismissed: (direction) {},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
            title: Text("chair"),
            subtitle: Text(
                'The number of sofas in the hall is less than it should be'),
            trailing: Container(
              color: Colors.amber,
              child: TextButton(
                child: Text('send request'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SendOrder()));
                },
              ),
            )),
      ),
    );
  }
}
