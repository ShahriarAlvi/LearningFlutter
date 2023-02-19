import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Calendar'
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        // elevation: ,
      ),
      body: SfCalendar(
        view: CalendarView.week,
        //firstDayOfWeek: 1,
        //initialDisplayDate: DateTime(2023, 02, 18, 10, 12),
        //initialSelectedDate: DateTime(2023, 02, 18, 10, 12),

        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }}

List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
  DateTime(today.year, today.month, today.day, 0, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  
  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'SWE\n331',
      notes: 'Taken by MRU',
      color: Colors.redAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10',
      //isAllDay: true
      ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource{

MeetingDataSource(List<Appointment>source){
  appointments = source;

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
