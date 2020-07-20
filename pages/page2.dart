import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Page2  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var data=[
      Contacts(new DateTime(2017, 9, 19), 5),
      Contacts(new DateTime(2017, 9, 26), 25),
      Contacts(new DateTime(2017, 10, 3), 100),
      Contacts(new DateTime(2017, 10, 4), 200),
      Contacts(new DateTime(2017, 10, 5), 180),
      Contacts(new DateTime(2017, 10, 6), 150),
      Contacts(new DateTime(2017, 10, 7), 20),
      Contacts(new DateTime(2017, 10, 8), 100),
      Contacts(new DateTime(2018, 10, 8), 50),
      Contacts(new DateTime(2019, 10, 8), 100),
      Contacts(new DateTime(2020, 10, 8), 200),
    ];

    var series=[
      charts.Series(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Contacts sales, _) => sales.time,
        measureFn: (Contacts sales, _) => sales.sales,
        data: data,
      )
    ];

    var chart = charts.TimeSeriesChart(
      series,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Text("Mon Suivi", style: TextStyle(fontSize: 20, color:Colors.green),),
              SizedBox(height: 275, child: chart,),

            ]
          )
        )
      )
    );
  }
}

class Contacts {
  final DateTime time;
  final int sales;


  Contacts(this.time, this.sales);

}











