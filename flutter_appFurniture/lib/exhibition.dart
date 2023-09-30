import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/controlapi/blockapp.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';
import 'package:flutter_appltessst/models/Salamodel.dart';
import 'package:flutter_appltessst/updathall_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'addexhibition.dart';
import 'controlapi/statesapp.dart';
import 'models/Exhibitionmodel.dart';
import 'screendesign/fiesrtscreen.dart';

class Exhibition extends StatefulWidget {
  //const Exhibition({Key? key}) : super(key: key);

  @override
  State<Exhibition> createState() => _ExhibitionState();
}

class _ExhibitionState extends State<Exhibition> {
  static List<Sala> mainlist = [];

  /*[
    Exhibimodel(title: 'bab mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'erbin mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'doma mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'marba mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'maza mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'bab mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'bab mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'erbin mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'doma mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'marba mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'maza mosla', subtitle: 'bab aba baba nab', image: ''),
    Exhibimodel(title: 'bab mosla', subtitle: 'bab aba baba nab', image: ''),
  ];*/

  List<Sala> desplydata = List.from(mainlist);
  void searchfromlist(value) {
    setState(() {
      desplydata = mainlist
          .where((element) => element.namesala!.contains(value.toString()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {


    Cubitapp cubitappmangment = Cubitapp.get(context);
    return BlocConsumer<Cubitapp, Statesapp>(
        listener: (context, stat) {},
        builder: (context, stat) {
          // List<Sala> temp = Cubitapp.get(context).salas;
          return Scaffold(
            backgroundColor: Colors.white, //Color(0xFF1f1545),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'serach for a Hall',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      //searchfromlist(val);
                      // print('befoer tempsearch ${temp.length}');

                      cubitappmangment.searchfromhall(val);
                      // print('tempsearch ${temp.length}');
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'searh for Hall',
                        fillColor: kPrimaryColor,
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        focusColor: Colors.amber),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                      child: Cubitapp.get(context).searchResult.length == 0
                          ? Center(
                              child: Text(
                                'Not result found',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) => ListTile(
                                    title: Text(
                                      Cubitapp.get(context).searchResult[index].title.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      Cubitapp.get(context).searchResult[index].title.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit_rounded,
                                            color: Colors.amber[900],
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdathallScreen(
                                                          issaved: true,
                                                          salaupdat:
                                                              cubitappmangment
                                                                  .salas[index],
                                                          indexitem: index,
                                                        )));
                                          },
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete_sweep_rounded,
                                            color: Colors.amber[900],
                                          ),
                                          onPressed: () {
                                            // cubitappmangment.deletehall(index);
                                            //print(index);
                                            _showsousomdialog(
                                                cubitappmangment, index);
                                          },
                                        ),
                                      ],
                                    ),
                                    leading: CircleAvatar(
                                      radius: 28.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kPrimaryColor, width: 2),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(360),
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: Cubitapp.get(context).searchResult[index].imagesrs != null
                                              ? Image.file(
                                            Cubitapp.get(context).searchResult[index].imagesrs!,
                                                  width: 170,
                                                  height: 170,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  'assets/addsala.jpg',
                                                  width: 170,
                                                  height: 170,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Firstscreen()));
                                    },
                                  ),
                              separatorBuilder: (context, index) => Container(
                                    color: Colors.amber[900],
                                    height: 1.0,
                                    width: 200.0,
                                  ),
                              itemCount: Cubitapp.get(context).searchResult.length))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Addexhibition(issaved: false)));
              },
              child: Icon(CupertinoIcons.add),
            ),
          );
        });
  }

  _showsousomdialog(cubitappmangment, index) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Delete',
      desc: 'Are you sure you want to delete ?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        cubitappmangment.deletehall(index);
      },
    )..show();
  }
}
