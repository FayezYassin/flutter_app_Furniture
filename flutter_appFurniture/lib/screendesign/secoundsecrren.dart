import 'package:flutter/material.dart';
import 'package:flutter_appltessst/models/exhibimodefllocal.dart';
import 'package:flutter_appltessst/screendesign/styleScheme.dart';
import 'package:flutter_appltessst/mangaccount/constants.dart';

import 'categoryscreen.dart';

class Secoundsecreen extends StatefulWidget {
  const Secoundsecreen({Key? key}) : super(key: key);

  @override
  State<Secoundsecreen> createState() => _SecoundsecreenState();
}

class _SecoundsecreenState extends State<Secoundsecreen> {
  String selectedCategory = "All";
  static List<Product> dataprodect = [
    Product(
        id: 1,
        name: 'sofa spring',
        price: '3250',
        color: ['red', 'gren'],
        desc:
            'Made of the strongest types of wood and the finest types of upholstery',
        image: 'assets/sofa1.jpg',
        amount: '23'),
    Product(
        id: 2,
        name: 'chair spring',
        price: '183',
        color: ['red', 'gren'],
        desc:
            'Made of the strongest types of wood and the finest types of upholstery',
        image: 'assets/sofa3.jpg',
        amount: '38'),
    Product(
        id: 3,
        name: 'sofa spring',
        price: '123',
        color: ['red', 'gren'],
        desc:
            'Made of the strongest types of wood and the finest types of upholstery',
        image: 'assets/sofa4.jpg',
        amount: '23'),
    Product(
        id: 4,
        name: 'chair spring',
        price: '250',
        color: ['red', 'gren'],
        desc:
            'Made of the strongest types of wood and the finest types of upholstery',
        image: 'assets/sofa2.jpg',
        amount: '65'),
    Product(
        id: 5,
        name: 'chair spring',
        price: '123',
        color: ['red', 'gren'],
        desc: 'orginal chair',
        image: 'assets/sofa2.jpg',
        amount: '23'),
    Product(
        id: 6,
        name: 'chair spring',
        price: '89',
        color: ['red', 'gren'],
        desc:
            'Made of the strongest types of wood and the finest types of upholstery',
        image: 'assets/images/gch.png',
        amount: '98'),
    Product(
        id: 7,
        name: 'sofa spring',
        price: '586.00',
        color: ['red', 'gren'],
        desc: 'orginal chair',
        image: 'assets/sofa1.jpg',
        amount: '325'),
    Product(
        id: 8,
        name: 'sofa spring',
        price: '3250',
        color: ['red', 'gren'],
        desc: 'orginal chair',
        image: 'assets/sofa1.jpg',
        amount: '23'),
    Product(
        id: 9,
        name: 'sofa spring',
        price: '123',
        color: ['red', 'gren'],
        desc: 'orginal chair',
        image: 'assets/sofa1.jpg',
        amount: '23'),
    Product(
        id: 10,
        name: 'sofa spring',
        price: '123',
        color: ['red', 'gren'],
        desc: 'orginal chair',
        image: 'assets/sofa4.jpg',
        amount: '23'),
    Product(
        id: 11,
        name: 'chair spring',
        price: '123',
        color: ['red', 'gren'],
        desc: 'orginal chair',
        image: 'assets/images/gch.png',
        amount: '23'),
  ];
  //
  List<Product> desplydata = List.from(dataprodect);
  void searchfromlist(value) {
    setState(() {
      desplydata = dataprodect
          .where((element) => element.name!.contains(value.toString()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  AppBar(
                    title: Text(
                      'Good morning ',
                      style: TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 35,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Perfect Furaniture',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'For your hous',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        categoryWidget("All"),
                        categoryWidget("Chair"),
                        categoryWidget("Sofa"),
                        categoryWidget("Fursh"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Text('Popular Proudect ', style: TextStyle(fontSize: 22)),
                  SizedBox(
                    height: 17.0,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1 / 1.20,
                    children: List.generate(desplydata.length,
                        (index) => gridviewitem(context, desplydata[index])),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  InkWell categoryWidget(String title) {
    return InkWell(
      onTap: () {
        selectCategory(title);
      },
      child: Container(
        margin: EdgeInsets.only(right: 5, bottom: 5),
        height: 50,
        width: 150,
        decoration: containerStyle("all").copyWith(
            border: (title == selectedCategory)
                ? Border.all(
                    color: kPrimaryColor,
                    width: 2,
                  )
                : null),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor),
          ),
        ),
      ),
    );
  }

  void selectCategory(String title) {
    selectedCategory = title;
    if (title.contains('All')) {
      desplydata = List.from(dataprodect);
    } else if (title.contains('Chair')) {
      searchfromlist('chair');
    } else if (title.contains('Sofa')) {
      searchfromlist('ofa');
    }

    setState(() {});
  }
}

Widget gridviewitem(context, modelproduct) {
  return InkWell(
    child: Column(
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage(modelproduct.image), fit: BoxFit.cover)),
        ),
        Text(modelproduct.name, style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Icon(
              Icons.format_list_numbered_rtl,
              color: Colors.amber[900],
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(modelproduct.amount,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Text(
              '\$ ${modelproduct.price}',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    ),
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Category(modelproduct)));
    },
  );
}
