import 'package:flutter/material.dart';

import 'package:flutter_appltessst/homescreen.dart';

import 'package:flutter_appltessst/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'Store/Stores.dart';
import 'admin_exhibition/getstorge.dart';
import 'admin_exhibition/mainscreen.dart';
import 'admin_exhibition/send_order.dart';
import 'controlapi/blockapp.dart';
import 'controlapi/diohelper.dart';
import 'controlapi/testlist.dart';
import 'exhibition.dart';
import 'screendesign/secoundsecrren.dart';

void main() {
  DioHelper.intidio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Cubitapp(),
        child: (GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: Getstorgesecreen(),
        )));
  }
}
