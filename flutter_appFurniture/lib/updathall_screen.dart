import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import 'controlapi/blockapp.dart';
import 'controlapi/statesapp.dart';
import 'models/Salamodel.dart';

class UpdathallScreen extends StatefulWidget {
  bool issaved;
  int indexitem;
  Sala salaupdat;
  UpdathallScreen(
      {required this.issaved,
      required this.salaupdat,
      required this.indexitem});

  @override
  _UpdathallScreenState createState() => _UpdathallScreenState(
      ischos_save: issaved, salaupdat: salaupdat, index: indexitem);
}

class _UpdathallScreenState extends State<UpdathallScreen> {
  File? pickedImage;
  bool ischos_save;
  int index;
  Sala salaupdat;
  _UpdathallScreenState(
      {required this.ischos_save,
      required this.salaupdat,
      required this.index});

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Cubitapp cubitmangment = Cubitapp.get(context);
    var controlerpassword = TextEditingController();
    var controleremail = TextEditingController();
    var controlertitle = TextEditingController();
    var controlername = TextEditingController();
    return BlocConsumer<Cubitapp, Statesapp>(
        listener: (context, stat) {},
        builder: (context, stat) {
          //Sala updatsala = cubitmangment.salas[index];

          print('object:  ${salaupdat.namesala}');
          print('object:  $index');
          controlername.text = salaupdat.namesala;
          controleremail.text = salaupdat.emile;
          controlertitle.text = salaupdat.title;
          controlerpassword.text = salaupdat.password;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Updat a hall'),
              backgroundColor: kPrimaryColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: ClipOval(
                            child: pickedImage != null
                                ? Image.file(
                                    pickedImage!,
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
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: IconButton(
                            onPressed: imagePickerOption,
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        onPressed: imagePickerOption,
                        icon: const Icon(Icons.add_a_photo_sharp),
                        label: const Text('UPLOAD IMAGE')),
                  ),
                  // SizedBox(
                  //   height: 15.0,
                  // ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: TextFormField(
                          controller: controlername,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            label: Text(
                              'Name Exhibition ',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: TextFormField(
                          controller: controlertitle,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              label: Text(
                                ' Title ',
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              prefixIcon: Icon(
                                Icons.title,
                                color: kPrimaryColor,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: TextFormField(
                          controller: controleremail,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              label: Text(
                                ' Email ',
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: kPrimaryColor,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: TextFormField(
                          controller: controlerpassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            label: Text(
                              ' password ',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 230.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: kPrimaryColor,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            cubitmangment.updathall(
                                newhall: Sala(
                                    emile: controleremail.text,
                                    namesala: controlername.text,
                                    password: controlerpassword.text,
                                    title: controlertitle.text,
                                    imagesrs: pickedImage),
                                index: index);
                            Navigator.pop(context);
                            //print('lenth : ${cubitmangment.salas.length}');
                          },
                          child: Text(
                            ischos_save ? 'Updat ' : 'Saved',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}



/*

Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('IMAGE PICKER'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage!,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: imagePickerOption,
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  onPressed: imagePickerOption,
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('UPLOAD IMAGE')),
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      label: Text(
                        'Name Exhibition ',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        label: Text(
                          ' Title ',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        prefixIcon: Icon(
                          Icons.title,
                          color: kPrimaryColor,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        label: Text(
                          ' Email ',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Text(
                        ' password ',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 230.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kPrimaryColor,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      /*  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Listimage()));*/
                    },
                    child: Text(
                      'Saved',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                )
              ],
            )
          ],
        ),
      ),
    );

*/