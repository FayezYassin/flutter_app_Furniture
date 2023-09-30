import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/admin_exhibition/getstorge.dart';
import 'package:flutter_appltessst/admin_exhibition/send_order.dart';
import 'package:flutter_appltessst/controlapi/diohelper.dart';
import 'package:flutter_appltessst/controlapi/statesapp.dart';
import 'package:flutter_appltessst/models/Storemodel.dart';
import 'package:flutter_appltessst/models/Salamodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constantapi.dart';

class Cubitapp extends Cubit<Statesapp> {
  Cubitapp() : super(Initoapp()) {
    searchResult = [...salas];
  }

  late List<Sala> searchResult;

  static Cubitapp get(context) => BlocProvider.of(context);

  List<Sala> salas = [
    Sala(
        emile: 'first@gmail.come',
        namesala: 'first',
        password: '2314',
        title: 'damas'),
    Sala(
        emile: 'secound@gmail.come',
        namesala: 'secound',
        password: '2314',
        title: 'damas'),
    Sala(
        emile: 'thersd@gmail.come',
        namesala: 'thersd',
        password: '2314',
        title: 'damas'),
    Sala(
        emile: 'first@gmail.come',
        namesala: 'first',
        password: '2314',
        title: 'damas'),
    Sala(
        emile: 'first@gmail.come',
        namesala: 'first',
        password: '2314',
        title: 'damas'),
  ];

  List<Storemodel> Stors = [
    Storemodel(
        namestor: 'first stors',
        titlestor: 'damasces',
        emilestor: 'admin@gmail.com',
        passwordstor: '12345',
        spacestor: '120km'),
    Storemodel(
        namestor: 'secound stors',
        titlestor: 'damasces',
        emilestor: 'admin2@gmail.com',
        passwordstor: '12345',
        spacestor: '120km'),
    Storemodel(
        namestor: 'Third stors',
        titlestor: 'damasces',
        emilestor: 'admin3@gmail.com',
        passwordstor: '12345',
        spacestor: '120km'),
    Storemodel(
        namestor: ' fourth stors',
        titlestor: 'damasces',
        emilestor: 'admin4@gmail.com',
        passwordstor: '12345',
        spacestor: '120km')
  ];

  //////////////////////////// login ////////////////

  bool ispassword = true;

  void changepassword() {
    ispassword = !ispassword;
    emit(changeispassowrdstat());
  }

  ///////////////////////////////////////////////
  List<dynamic> employ = [];

  List<dynamic> bussnice = [];

  getdatafromapi() {
    emit(getdataloading());
    DioHelper.getdata(url: 'posts', qury: {'': ''}).then((value) {
      employ = value.data;
      print(employ[0]['title']);
      emit(getdatsucsse());
      // print('lenght : ${employ.length}');
    }).catchError((onError) {
      print('error : ${onError.toString()}');
    });
  }

  void getbussinenews() {
    emit(getdataloading());
    DioHelper.getdata(url: 'v2/top-headlines', qury: {
      'country': 'eg',
      'apiKey': 'b739f2cf151342dfbaee6b6c9b010d8a'
    }).then((value) {
      bussnice = value.data['articles'];
      emit(getdatsucsse());
      print('fayez : ${bussnice.length.toString()}');
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void postlogin({required String email, required String password}) {
    emit(Loginloading());
    DioHelper.postdata(url: Login, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      emit(Logihnsucsse());
    }).catchError((error) {
      emit(Loginerror());
      print(error.toString());
    });
  }

  //////////////////  sala //////////////////////////////

  void addnewhall({required Sala newhall}) {
    salas.add(newhall);
    searchResult.add(newhall);
    emit(addhall());
  }

  void updathall({required Sala newhall, index}) {
    salas[index] = newhall;
    emit(updathallstat());
  }

  void deletehall(index) {
    salas.removeAt(index);
    emit(delethall());
  }

  void searchfromhall(String namehall) {
     emit(loadinghall());
    searchResult =salas
        .where((element) => element.title.contains(new RegExp(namehall, caseSensitive: false)))
        .toList();
    emit(sucssesfulysearch());
   }

  /////////////////////////////  end sala /////////////////

  /////////////////////////////  Start stor /////////////////

  void addnstor({required Storemodel newstor}) {
    Stors.add(newstor);
    emit(addstorstat());
  }

  void updatstor({required Storemodel newstor, index}) {
    Stors[index] = newstor;
    emit(updatstorstat());
  }

  void deletestor(index) {
    Stors.removeAt(index);
    emit(deletestorstat());
  }

   ///////////////////// sala mangement

  Future getstor(context) async {
    emit(loadbeststor_stat());
    Future.delayed(Duration(seconds: 3), () {
      emit(successflybeststor_stat());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Getstorgesecreen()));
    });
  }

  Future chooceStor(context) async {
    emit(loadbeststor_stat());
    Future.delayed(Duration(seconds: 3), () {
      emit(successflybeststor_stat());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SendOrder()));
    });
  }


/*
  List<Sala> searchfromstor(String namestor) {
    List<Storemodel> search = [];
    emit(loadinghall());
    search = Stors
        .where((element) => element.namestor!.contains(namestor.toString()))
        .toList();
    emit(sucssesfulysearchstor(search: search));
    return search;
  }*/

}
