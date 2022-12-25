import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:nikhil_ui/newpage.dart';

void main() {
  runApp(const MyApp());
}

Color kPrimaryColor= Color.fromRGBO(49, 87, 110, 1.0);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Automated Irrigation System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime _dateSTime;
  late DateTime _dateETime;

  String dropdownvalue = 'Wheat';

  // List of items in our dropdown menu
  var items = [
    'Bajra',
    'Wheat',
    'Rice',
  ];

  Widget buildTextField3() => TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          prefixIcon: Icon(Icons.calendar_view_day, color: Colors.blue),
          hintText: "Days",
          hintStyle: TextStyle(color: Colors.blue),
          filled: true,
          fillColor: Colors.blue[50],
        ),
      );

  Widget buildTextField2() => TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          prefixIcon: Icon(Icons.timelapse, color: Colors.blue),
          hintText: "HH:MM:SS",
          hintStyle: TextStyle(color: Colors.blue),
          filled: true,
          fillColor: Colors.blue[50],
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
        elevation: .1,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   "Select Crop",
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // DropdownButton(
            //   value: dropdownvalue,
            //   icon: const Icon(Icons.keyboard_arrow_down),
            //   items: items.map((String items) {
            //     return DropdownMenuItem(
            //       value: items,
            //       child: Text(items),
            //     );
            //   }).toList(),
            //   // After selecting the desired option,it will
            //   // change button value to selected value
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownvalue = newValue!;
            //     });
            //   },
            // ),
            SizedBox(
              height: 70,
            ),
            // TimePickerSpinner(
            //   is24HourMode: false,
            //   normalTextStyle: TextStyle(
            //       fontSize: 18,
            //       color: Colors.lightBlue
            //   ),
            //   highlightedTextStyle: TextStyle(
            //       fontSize: 24,
            //       color: Colors.blue
            //   ),
            //   spacing: 50,
            //   itemHeight: 80,
            //   isForce2Digits: true,
            //   onTimeChange: (time) {
            //     setState(() {
            //       _dateTime = time;
            //     });
            //   },
            // ),
            Padding(
              padding:  EdgeInsets.all(size.width*0.01),
              child: Container(
                height: size.height*0.13,
                width: size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(7),
              ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:size.height*0.015),
                      child: Text(
                        'Start Time',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width*0.02),
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Time",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }

                          return true;
                        },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height*0.02,),
            Padding(
              padding:  EdgeInsets.all(size.width*0.01),
              child: Container(
                height: size.height*0.13,
                width: size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:size.height*0.015),
                      child: Text(
                        'End Time',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width*0.02),
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Time",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }

                          return true;
                        },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Text(
            //   "After how many Days to give water?",
            //   style: TextStyle(fontSize: 20),
            // ),
            SizedBox(
              height: size.height*0.07,
            ),
            // buildTextField3(),
            // SizedBox(
            //   height: 70,
            // ),
            // Text(
            //   "Duration of water flow?",
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // buildTextField2(),
            // SizedBox(
            //   height: 70,
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kPrimaryColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPage()),
                );
              },
              child: Text(
                'SET',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
