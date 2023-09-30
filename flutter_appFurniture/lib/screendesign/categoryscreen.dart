import 'package:flutter/material.dart';
import 'package:flutter_appltessst/models/exhibimodefllocal.dart';

class Category extends StatelessWidget {
  //const Category({ Key? key }) : super(key: key);
  final Product productid;
  Category(this.productid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppBar(
              title: Text(
                productid.name,
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
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: double.infinity,
            height: 300.0,
            child: GridTile(
              child: Image.asset(
                productid.image,
                fit: BoxFit.cover,
              ),
              footer: Container(
                height: 70.0,
                color: Colors.black.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    productid.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Specifications',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          ///////////////// spaciefication ///////////
          ///          color
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 80.0,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            'Colors : ',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ///////////////////// blu color
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 15,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '14',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          /////////////////////// grin color
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.green,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '18',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          /////////////////////  red
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.red,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '9',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                ////////////////////////////////   amunt
                Container(
                  color: Colors.blue,
                  height: 70.0,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            'The total amount : ',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                          Text(
                            '50',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ],
                      )),
                ),
                ////////////////////////////////   amont
                Container(
                  color: Colors.white,
                  height: 70.0,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'descrption : ',
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.black)),
                          TextSpan(
                              text: productid.desc,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)),
                        ]),
                      )),
                ),

                ////////////////////////////////   desc
                Container(
                  color: Colors.blue,
                  height: 70.0,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            'price : ',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                          Text(
                            ' \$ ${productid.price}',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
