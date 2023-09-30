import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appltessst/controlapi/blockapp.dart';
import 'package:flutter_appltessst/controlapi/statesapp.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';
import 'package:flutter_appltessst/models/Storemodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class AddeStor extends StatefulWidget {
  bool issaved;
  int? indexitem;
  AddeStor({required this.issaved, this.indexitem});

  @override
  _AddeStorState createState() =>
      _AddeStorState(ischos_save: issaved, index: indexitem);
}

class _AddeStorState extends State<AddeStor> {
  File? pickedImage;
  bool ischos_save;
  int? index;
  _AddeStorState({required this.ischos_save, this.index});

  // void imagePickerOption() {
  //   Get.bottomSheet(
  //     SingleChildScrollView(
  //       child: ClipRRect(
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(10.0),
  //           topRight: Radius.circular(10.0),
  //         ),
  //         child: Container(
  //           color: Colors.white,
  //           height: 250,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 const Text(
  //                   "Pic Image From",
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton.icon(
  //                   style: ElevatedButton.styleFrom(primary: kPrimaryColor),
  //                   onPressed: () {
  //                     pickImage(ImageSource.camera);
  //                   },
  //                   icon: const Icon(
  //                     Icons.camera,
  //                     color: Colors.white,
  //                   ),
  //                   label: const Text("CAMERA"),
  //                 ),
  //                 ElevatedButton.icon(
  //                   style: ElevatedButton.styleFrom(primary: kPrimaryColor),
  //                   onPressed: () {
  //                     pickImage(ImageSource.gallery);
  //                   },
  //                   icon: const Icon(Icons.image, color: Colors.white),
  //                   label: const Text("GALLERY"),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton.icon(
  //                   style: ElevatedButton.styleFrom(primary: kPrimaryColor),
  //                   onPressed: () {
  //                     Get.back();
  //                   },
  //                   icon: const Icon(
  //                     Icons.close,
  //                     color: Colors.white,
  //                   ),
  //                   label: const Text("CANCEL"),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
    var controlerspace = TextEditingController();
    return BlocConsumer<Cubitapp, Statesapp>(
        listener: (context, stat) {},
        builder: (context, stat) {
          print('object:  $ischos_save');
          print('object:  $index');

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Updat a Stor'),
              backgroundColor: kPrimaryColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  /*Align(
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
                  // ),*/
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
                              'Name Stor ',
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
                          controller: controlerspace,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              label: Text(
                                ' Space ',
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
                          obscureText: cubitmangment.ispassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            label: Text(
                              ' password ',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  cubitmangment.changepassword();
                                },
                                icon: Icon(
                                  cubitmangment.ispassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: kPrimaryColor,
                                )),
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
                            cubitmangment.addnstor(
                                newstor: Storemodel(
                                    namestor: controlername.text,
                                    titlestor: controlertitle.text,
                                    emilestor: controleremail.text,
                                    passwordstor: controlerpassword.text,
                                    spacestor: controlerspace.text));
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