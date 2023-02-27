library calendar;

import 'dart:ffi';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

part 'appointment-editor.dart';

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

bool _isAllDay = false;

String _subjectText = '',
    _startTimeText = '',
    _endTimeText = '',
    _dateText = '',
    _timeDetails = '';

class _MyAppPageState extends State<MyAppPage>{


  late final String eventName;
  late final DateTime from;
  late final DateTime to;
  late final Color background;
  late final bool isAllDay;
  late final String startTimeZone;
  late final String endTimeZone;
  late final String description;

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
      'SWE 321', 'SWE 322', 'SWE 323', 'SWE 324',
      'SWE 327', 'SWE 328', 'SWE 330',
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

      if(appointmentDetails.isAllDay) {
        _timeDetails = 'All Day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }

      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Container(
                child: Text('$_subjectText'),
              ),
              content: Container(
                height: 70,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('$_dateText'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(' '),
                      ],
                    ),
                    Row(
                      children: [
                        // Text('$_startTimeText'),
                        // Text(' - '),
                        // Text('$_endTimeText'),
                        Text(_timeDetails!,
                            style: TextStyle(
                          fontWeight: FontWeight.w400,
                              fontSize: 20,
                        )),
                      ],
                    )
                  ],
                )
              ),
                actions: [
                  new TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: new Text('close')),
                  TextButton(
                      onPressed: (){
                        showDialog(context: context,
                            builder: (BuildContext context){
                          return AppointmentEditor();
                            } );
                      },
                      child: new Text('edit'),)
                ],
            );
          });
    }

    else {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Container(
              child: Text('No event set'),
            ),
            content: Container(
                height: 70,
                child: Text('Set an event'),
    ),
            actions: [
              new TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    },
                  child: new Text('close')),
              TextButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AppointmentEditor();
                      } );
                  },
                child: new Text('edit'),)
            ],
          );
        });
    }
  }
}



class MeetingDataSource extends CalendarDataSource{
MeetingDataSource(List<Appointment>courses) {
  appointments = courses;
}

@override
  bool isAllDay(int index) => appointments?[index].isAllDay;

@override
  String getSubject(int index) => appointments?[index].eventName;

@override
  String getStartTimeZone(int index) => appointments?[index].startTimeZone;

@override
  String getNotes(int index) => appointments?[index].description;

@override
  String getEndTimeZone(int index) => appointments?[index].endTimeZone;

@override
  Color getColor(int index) => appointments?[index].background;

@override
  DateTime getStartTime(int index) => appointments?[index].from;

@override
  DateTime getEndTime(int index) => appointments?[index].to;

}
