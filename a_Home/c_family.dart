import 'package:flutter/material.dart';

class Family extends StatefulWidget {
  const Family({Key key}) : super(key: key);

  @override
  _FamilyState createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Family'),
      ),
    );
  }
}
