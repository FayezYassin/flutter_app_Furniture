import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'Store/Stores.dart';
import 'chartReport/bar_chart_model.dart';
import 'mangaccount/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';
import 'exhibition.dart';
import 'screendesign/fiesrtscreen.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> imagecaurousel = [
    'assets/car.jpg',
    'assets/carousl2.jpg',
    'assets/carousl.jpg',
  ];
  ///////////////////////////////////   chart circle

  Map<String, double> dataMap = {
    "Sofas Items": 18.47,
    "Chairs": 17.70,
    "Technology": 4.25,
    "Cosmetics": 3.51,
    "Other": 2.83,
  };

  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  /////////////////////////////////  graph chart

  final List<BarChartModel> data = [
    BarChartModel(
      year: "2014",
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      year: "2015",
      financial: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      year: "2016",
      financial: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartModel(
      year: "2017",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    BarChartModel(
      year: "2018",
      financial: 630,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      year: "2019",
      financial: 950,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      year: "2020",
      financial: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];

  //////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Secreen'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* SizedBox(
              height: 5.0,
            ),
            Container(
                height: 380.0, child: getReportGraph(series) // Reportcircler(),
                ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 380.0,
              child: Reportcircler(),
            ),*/

            CarouselSlider(
                items: imagecaurousel
                    .map((e) => Image(
                          image: AssetImage(
                            e,
                          ),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),

            SizedBox(
              height: 15.0,
            ),
            Text(
              ' Exhibitions',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/car.jpg',
                            name: 'first hall')),
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa1.jpg',
                            name: ' second hall')),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa2.jpg',
                            name: 'الصالة الاولى')),
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa1.jpg',
                            name: 'الصالة الثانية')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa1.jpg',
                            name: 'الصالة الثالة')),
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa1.jpg',
                            name: 'الصالة الرابعة')),
                  ],
                ),
                InkWell(
                  child: Text(
                    ' ... عرض المزيد ',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Exhibition()));
                  },
                )
              ],
            ),
            /////////////////////////////////////////////
            SizedBox(
              height: 15.0,
            ),

            Text(
              ' stores',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa4.jpg',
                            name: ' المستودع الاول')),
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa4.jpg',
                            name: 'المستودع الثاني')),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa4.jpg',
                            name: ' المستودع الثالث')),
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa4.jpg',
                            name: 'المستودع الرابع')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa4.jpg',
                            name: ' المستودع الاول')),
                    Expanded(
                        child: gridviewitem(
                            context: context,
                            imagesrs: 'assets/sofa4.jpg',
                            name: 'المستودع الثاني')),
                  ],
                ),
                InkWell(
                  child: Text(
                    ' ... عرض المزيد ',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Exhibition()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
      drawer: getDrawlist(context),
    );
  }

  Drawer getDrawlist(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: kPrimaryColor),
            accountName: Text('Admin'),
            accountEmail: Text('Admin@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            title: Text(
              'storehouse page',
            ),
            subtitle: Text('storge home'),
            leading: Icon(
              Icons.storage_rounded,
              color: kPrimaryColor,
            ),
            isThreeLine: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Exhibition();
                  },
                ),
              );
            },
          ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            title: Text(
              'stores management',
            ),
            subtitle: Text('storge home'),
            leading: Icon(
              Icons.sailing,
              color: kPrimaryColor,
            ),
            isThreeLine: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Storessecreen();
                  },
                ),
              );
            },
          ),
          Divider(
            height: 1.0,
          )
        ],
      ),
    );
  }

  Widget Reportcircler() {
    return Center(
      child: PieChart(
        dataMap: dataMap,
        colorList: colorList,
        chartRadius: MediaQuery.of(context).size.width / 2,
        centerText: "Budget",
        ringStrokeWidth: 24,
        animationDuration: const Duration(seconds: 3),
        chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
            showChartValuesOutside: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false),
        legendOptions: const LegendOptions(
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle: TextStyle(fontSize: 15),
            legendPosition: LegendPosition.bottom,
            showLegendsInRow: true),
        gradientList: gradientList,
      ),
    );
  }

  Widget getReportGraph(series) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: charts.BarChart(
        series,
        animate: true,
      ),
    );
  }
}

Widget gridviewitem({context, name, imagesrs}) {
  return InkWell(
    child: Column(
      children: [
        Container(
          height: 200.0,
          width: 220.0,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image: AssetImage(imagesrs), fit: BoxFit.cover)),
        ),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Firstscreen()));
    },
  );
}
