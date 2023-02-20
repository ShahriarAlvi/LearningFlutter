import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      home: MyAppPage(),
    );
  }}

class MyAppPage extends StatefulWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage>{

  String? _subjectText = '',
  _startTimeText = '',
  _endTimeText = '',
  _dateText = '',
  _timeDetails = '';

  late MeetingDataSource _events;
  late List<Appointment> _courses;
  late List<CalendarResource> _courseTeachers;
  late List<TimeRegion> _specialTimeRegion;

  @override
  void initState() {
    addAppointments();
    addResourceDetails();
    addSpecialRegion();
    _events = MeetingDataSource(_courses);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        // elevation: ,
      ),

      body: SfCalendar(
        onTap: calendarTapped,
        view: CalendarView.week,
        timeSlotViewSettings: TimeSlotViewSettings(
            startHour: 8, endHour: 17, timeFormat: 'h:mm',
            timeInterval: Duration(minutes: 30,)),
        todayHighlightColor: Colors.green[500],
        appointmentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 13.5,
          fontWeight: FontWeight.bold,
        ),

        dataSource: _events,
        specialRegions: _specialTimeRegion,
      ),
    );
  }

  // List<Appointment> getAppointments(){
  //   List<Appointment> meetings = <Appointment>[];
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime =
  //   DateTime(today.year, today.month, today.day, 10, 30, 0);
  //   final DateTime endTime = startTime.add(const Duration(hours: 1, minutes: 30));
  //
  //   return meetings;
  // }

  void addAppointments(){
    var subjectCollection = [
      'SWE\n321', 'SWE322', 'SWE323', 'SWE324',
      'SWE327', 'SWE328', 'SWE330',
    ];

    _courses = <Appointment>[];

    _courses.add(Appointment(
        startTime: DateTime(2023, 2, 12, 9, 30, 0),
        endTime: DateTime(2023, 2, 12, 10, 30, 0),
        subject: subjectCollection[0],
        color: Colors.redAccent,

        recurrenceRule: 'FREQ=DAILY,INTERVAL=7,COUNT=20',
    ));

  }

  void addResourceDetails() {
    var courseTeachers = [
      'MRU', 'PPP', 'SSC', 'AMS', 'AHB',
    ];

    var teacherImages = [];

    _courseTeachers = <CalendarResource>[];


  }

  void addSpecialRegion() {
    final DateTime date = DateTime(2023, 2, 12, 8, 0, 0);
    _specialTimeRegion = [
      TimeRegion(startTime: DateTime(2023, 2, 12, 13, 0, 0),
          endTime: DateTime(2023, 2, 12, 14, 0, 0),
      text: 'LUNCH',
      recurrenceRule: 'FREQ=DAILY,INTERVAL=1',
      enablePointerInteraction: false)
    ];

  }


  void calendarTapped(CalendarTapDetails details) {

    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final Appointment appointmentDetails = details.appointments![0];
      _subjectText = appointmentDetails.subject;

      _dateText = DateFormat('MMMM dd, yyyy').
      format(appointmentDetails.startTime).toString();

      _startTimeText = DateFormat('hh:mm a').
          format(appointmentDetails.startTime).toString();
      _endTimeText = DateFormat('hh:mm a').
          format(appointmentDetails.endTime).toString();

      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Container(
                child: Text('$_subjectText'),
              ),
              //content: ,

            );
          });
    };
  }
}



class MeetingDataSource extends CalendarDataSource{
MeetingDataSource(List<Appointment>courses){
  appointments = courses;
}}



// practice
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[800],
//       appBar: AppBar(
//         title: const Text('ID Card'),
//         centerTitle: true,
//         backgroundColor: Colors.amber[300],
//         // elevation: ,
//       ),
//       body:
//       Column(
//         children: [
//           Expanded(
//             flex: 6,
//             child: Container(
//               //alignment: Alignment.centerLeft,
//                 child: Image.asset('assets/1672921962063.jpg', )),
//           ),
//
//           Expanded(
//             flex: 1,
//             child: Container(
//               padding: EdgeInsets.fromLTRB(2, 2, 2, 0),
//               //color: Colors.blue,
//               alignment: Alignment.centerLeft,
//               child: Text('Name',
//                 style: TextStyle(
//                   color: Colors.white60,
//                   letterSpacing: 3.0,
//                   fontSize: 17,
//                 ),
//               ),
//             ),
//           ),
//
//           Expanded(
//             flex: 2,
//             child: Container(
//               padding: EdgeInsets.fromLTRB(2, 0, 2, 6),
//               //color: Colors.cyan,
//               alignment: Alignment.centerLeft,
//               child: Text('Sherlock Holmes',
//               style: TextStyle(
//               color: Colors.amber,
//                 letterSpacing: 3.0,
//                 fontSize: 30,
//               ),
//               ),
//             ),
//           ),
//
//           Expanded(
//             flex: 1,
//             child: Container(
//                 padding: EdgeInsets.fromLTRB(2, 2, 2, 6),
//                 //color: Colors.green,
//                 alignment: Alignment.centerLeft,
//                 child: Text('Address',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ), )),
//           ),
//
//           Expanded(
//
//             flex: 3,
//             child: Container(
//                 padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
//                 color: Colors.white,
//                 alignment: Alignment.centerLeft,
//                 child: Text('221/B Baker Street',
//                   style: TextStyle(
//                     color: Colors.yellow,
//                     fontSize: 40,
//                   ),)),
//           ),
//
//           Container(
//             padding: EdgeInsets.fromLTRB(0, 0, 0, 250),
//             child: Row(
//               children: [
//                 Icon(Icons.mail,
//                   color: Colors.white,),
//                 Text('sherlocked@gmail..com',
//                     style: TextStyle(
//                     color: Colors.white,
//                 ),)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
