import 'package:flutter/material.dart';

import 'secoundsecrren.dart';

class Firstscreen extends StatelessWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Text('Choos Your',
                        style: TextStyle(color: Colors.black, fontSize: 35)),
                    Row(
                      children: [
                        Text('Best',
                            style:
                                TextStyle(color: Colors.black, fontSize: 35)),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Furniture',
                          style:
                              TextStyle(color: Colors.red[400], fontSize: 35),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    "Bab Musalla Hall is located in Damascus opposite the Peace Furnace",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black)),
                          ]),
                        ))
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/sofa1.jpg'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/images/gch.png'),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 290,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/sofa3.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 50.0,
                          width: 50.0,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/circl.jpg'),
                                  fit: BoxFit.contain)),
                        )
                      ],
                    )),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started ',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.withOpacity(0.8)),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secoundsecreen()));
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 35,
                    ),
                    backgroundColor: Colors.black,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
