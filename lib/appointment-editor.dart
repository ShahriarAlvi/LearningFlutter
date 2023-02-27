part of calendar;

class AppointmentEditor extends StatefulWidget{

  const AppointmentEditor({super.key});

  @override
  AppointmentEditorState createState() => AppointmentEditorState();

}

class AppointmentEditorState extends State<AppointmentEditor>{
  Widget _getAppointmentEditor(BuildContext context){
    return Container(
      color: Colors.white,
      child: ListView(
        children: [

          ListTile(
            title: Row(
                children: [Text('$_subjectText',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),),]
            ),
          ),

          const Divider(
            height: 1.0,
            thickness: 0.5,
          ),


          ListTile(
            title: Row(
                children: [
                  Text('All day',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: _isAllDay,
                            onChanged: (bool value){
                              setState(() {
                                _isAllDay = value;
                              });
                            },
                          )
                      )
                  )
                ]
            ),
          ),

          const Divider(
            height: 1.0,
            thickness: 0.5,
          ),

          ListTile(
            title: Row(
                children: [Text('$_startTimeText',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),),]
            ),
          ),

          const Divider(
            height: 1.0,
            thickness: 0.5,
          ),

          ListTile(
            title: Row(
                children: [Text('$_endTimeText',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),)]
            ),
          ),

          const Divider(
            height: 1.0,
            thickness: 0.5,
          ),

          new TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('Close'),),


        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          title: Text(getTile(),),
              backgroundColor: Colors.redAccent,

          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ), onPressed: () {
              Navigator.pop(context);
          },
          ),
        ),
        body: Stack(
          children: [_getAppointmentEditor(context)],
        )

      )
    );
  }

  String getTile() {
    return _subjectText.isEmpty ? 'New Event' : 'Event Details';
  }
}