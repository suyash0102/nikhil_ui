import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikhil_ui/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class NewPage extends StatefulWidget {
  const NewPage({
    Key? key,
  }) : super(key: key);

// final String crop;
//   final String days;
//   final String time;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  late SfCartesianChart chart;
  late SfCartesianChart chart2;
  late TrackballBehavior _trackballBehavior;
  late TrackballBehavior _trackballBehavior2;


  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    _trackballBehavior2 = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  int totalWater = 70;


  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(10, 17),
      ChartData(20, 34),
      ChartData(30, 25),
      ChartData(40, 10),
      ChartData(50, 28)
    ];
    chart = SfCartesianChart(
        backgroundColor: Colors.white,
        primaryXAxis: NumericAxis(interval: 10),
        trackballBehavior: _trackballBehavior,
        series: <CartesianSeries>[
          LineSeries<ChartData, double>(
              enableTooltip: true,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
        ]);
    chart2 = SfCartesianChart(
        backgroundColor: Colors.white,
        primaryXAxis: NumericAxis(interval: 10),
        trackballBehavior: _trackballBehavior2,
        series: <CartesianSeries>[
          LineSeries<ChartData, double>(
              enableTooltip: true,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
        ]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        title: Center(child: Text("Automated Irrigation System")),
        elevation: .1,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Center(
                child: Text(
              "DASHBOARD",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: size.width * 0.07),
            )),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.2,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 150,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 50,
                                    color: Colors.green),
                                GaugeRange(
                                    startValue: 50,
                                    endValue: 100,
                                    color: Colors.orange),
                                GaugeRange(
                                    startValue: 100,
                                    endValue: 150,
                                    color: Colors.red)
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: 60,
                                  needleEndWidth: 9,
                                  needleStartWidth: 1,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('60.0',
                                            style: TextStyle(
                                                fontSize: size.width * 0.05,
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]))),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Center(
                    child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.2,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 150,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 50,
                                    color: Colors.green),
                                GaugeRange(
                                    startValue: 50,
                                    endValue: 100,
                                    color: Colors.orange),
                                GaugeRange(
                                    startValue: 100,
                                    endValue: 150,
                                    color: Colors.red)
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                  value: 90,
                                  needleEndWidth: 9,
                                  needleStartWidth: 1,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('90.0',
                                            style: TextStyle(
                                                fontSize: size.width * 0.05,
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ]))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Container(
                    height: size.height * 0.255,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            'Flow Meter - 1',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: size.height*0.005,),
                        Container(
                            height: size.height * 0.2,
                            width: size.width*0.4,
                            child: chart),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Container(
                    height: size.height * 0.255,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            'Flow Meter - 2',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: size.height*0.005,),
                        Container(
                            height: size.height * 0.2,
                            width: size.width*0.4,
                            child: chart2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "Total Water used: ",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.06),
                )),
                Center(
                    child: Text(
                  "$totalWater",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.06),
                )),
                Center(
                    child: Text(
                  " L ",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.06),
                )),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Container(
                    height: size.height * 0.13,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            'Soil Moisture 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.redAccent,
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Container(
                    height: size.height * 0.13,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            'Soil Moisture 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Container(
                    height: size.height * 0.13,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            'Soil Moisture 3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Container(
                    height: size.height * 0.13,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            'Soil Moisture 4',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015),
                          child: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void show() {
    _trackballBehavior.showByIndex(1);
  }

  void hide() {
    _trackballBehavior.hide();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}
