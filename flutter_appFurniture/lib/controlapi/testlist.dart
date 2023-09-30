import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/controlapi/statesapp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blockapp.dart';

class Testapi extends StatelessWidget {
  const Testapi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cubitapp(),
      child: BlocConsumer<Cubitapp, Statesapp>(
        listener: (context, stat) {},
        builder: (context, stat) {
          var cubit = Cubitapp.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.getdatafromapi();
              },
              child: Text('get'),
            ),
          );
        },
      ),
    );
  }
}
