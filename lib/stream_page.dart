import 'package:flutter/material.dart';
import 'stream_data.dart';

class MyStreamPage extends StatefulWidget {
  MyStreamPage({this.title});
  final String title;

  @override
  StreamPageState createState() => StreamPageState();
}

class StreamPageState extends State<MyStreamPage> {
  DummyReadingsStream mySensor = DummyReadingsStream(sampleTime: 1);
  @override
  void initState() {
    super.initState();
    mySensor.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder(
              stream: mySensor.reading,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                final int reading = snapshot.data;
                return _buildUI(context, reading);
              })),
    );
  }

  Widget _buildUI(BuildContext context, int reading) {
    return Text(reading.toString());
  }
}
