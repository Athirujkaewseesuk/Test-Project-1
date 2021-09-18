import 'package:flutter/material.dart';


class Classroom extends StatefulWidget {
  const Classroom({Key key}) : super(key: key);

  @override
  _ClassroomState createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Classroom'),
      ),
    );
  }
}
