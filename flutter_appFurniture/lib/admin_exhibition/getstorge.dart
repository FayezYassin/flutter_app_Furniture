
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/controlapi/blockapp.dart';
import 'package:flutter_appltessst/controlapi/statesapp.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Getstorgesecreen extends StatefulWidget {
  const Getstorgesecreen({Key? key}) : super(key: key);

  @override
  State<Getstorgesecreen> createState() => _GetstorgesecreenState();
}

class _GetstorgesecreenState extends State<Getstorgesecreen> {
  @override
  Widget build(BuildContext context) {
    bool checkfirst=true;
    return BlocConsumer<Cubitapp,Statesapp>(
        listener: (context,stat){},
        builder: (context,stat){
        Cubitapp mangementcubit=Cubitapp.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text('Suggested repositories'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(children: [
                    Card(
                      shadowColor: kPrimaryColor,
                      elevation: 15.0,
                      margin: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30.0,),
                          Text('Choose the right warehouse',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: kPrimaryColor
                            ),),
                          SizedBox(height: 35,),
                          Row(
                            children: [
                              Text(' the first stor '),
                              Checkbox(
                                  activeColor: kPrimaryColor,
                                  value: checkfirst, onChanged: (valu){})
                            ],
                          ),
                          Row(
                            children: [
                              Text(' the secound stor '),
                              Checkbox(
                                  activeColor: kPrimaryColor,
                                  value: checkfirst, onChanged: (valu){})
                            ],
                          ),
                          Row(
                            children: [
                              Text(' the therd stor '),
                              Checkbox(
                                  activeColor: kPrimaryColor,
                                  value: checkfirst, onChanged: (valu){})
                            ],
                          ),
                          SizedBox(height: 20.0,),

                          ConditionalBuilder(condition: stat is ! loadbeststor_stat,
                              builder: (context){
                                return Container(
                                  width: 180.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: kPrimaryColor,
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      mangementcubit.chooceStor(context);
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
                          ),
                          SizedBox(height: 40.0,)
                        ],
                      ),
                    )
                  ],),
                ),
              )
            ]),
      );
    });
  }
}
