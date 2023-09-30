import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/controlapi/blockapp.dart';
import 'package:flutter_appltessst/controlapi/statesapp.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'getstorge.dart';

class SendOrder extends StatefulWidget {
  const SendOrder({Key? key}) : super(key: key);

  @override
  State<SendOrder> createState() => _SendOrderState();
}

class _SendOrderState extends State<SendOrder> {
  TextEditingController controlertitle = new TextEditingController();
  TextEditingController controlerdate = new TextEditingController();
  TextEditingController controlertime = new TextEditingController();

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  bool isshowbootum = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitapp,Statesapp>(
    listener: (context,stat){},
        builder: (context, stat){
      Cubitapp mangementcubit=Cubitapp.get(context);
      return Scaffold(
          key: scaffoldkey,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: controlertitle,
                    decoration: InputDecoration(
                        label: Text(
                          'name hall',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        prefixIcon: Icon(
                          Icons.hdr_auto_outlined,
                          color: kPrimaryColor,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is faled';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controlertime,
                    decoration: InputDecoration(
                        label: Text("Quantity",
                            style: TextStyle(color: kPrimaryColor)),
                        prefixIcon: Icon(Icons.format_list_numbered,
                            color: kPrimaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is faled';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controlertime,
                    decoration: InputDecoration(
                        label: Text("Required item",
                            style: TextStyle(color: kPrimaryColor)),
                        prefixIcon: Icon(Icons.request_quote_outlined,
                            color: kPrimaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is faled';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: controlerdate,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        label:
                        Text('Date', style: TextStyle(color: kPrimaryColor)),
                        prefixIcon: Icon(Icons.calendar_today_rounded,
                            color: kPrimaryColor)),
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2022-12-20'))
                          .then((value) {
                        controlerdate.text = DateFormat.yMMMd().format(value!);
                        print(DateFormat.yMMMd().format(value).toString());
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this is faled';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 23.0,
                  ),
                  ConditionalBuilder(condition: stat is ! loadbeststor_stat,
                      builder: (context){
                    return Container(
                      width: 230.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: kPrimaryColor,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                        mangementcubit.getstor(context);
                        },
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                      },
                      fallback: (context)=>Center(child:
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      )
                      )
                  )
                ],
              ),
            ),
          ));
    }
    );
  }
/*
  Future getstor() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Getstorgesecreen()));
    });
  }*/
}
