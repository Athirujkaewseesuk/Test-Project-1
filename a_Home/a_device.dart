import 'package:flutter/material.dart';

class Device extends StatefulWidget {
  const Device({Key key}) : super(key: key);

  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Device'),
      ),
    );
  }
}
