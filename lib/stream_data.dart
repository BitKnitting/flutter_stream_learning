import 'dart:async';
import 'dart:math';

// Stream, StreamController, StreamBuilder.

// Interface for all the sensors
abstract class ReadingsStream {
  // The value of the sensor
  dynamic value;
  // A Stream controller alerts the stream when new data is available.
  // The controller should be private.
  var _reading = StreamController<int>();
  // A Stream lets us know when new data is available.
  Stream<int> get reading => _reading.stream;

  /// Start sensing
  void start();

  /// Stop sensing
  void stop() {
    _reading.close();
  }
}

class DummyReadingsStream extends ReadingsStream {
  // Constructure
  int sampleTime;

  DummyReadingsStream({sampleTime: 3}) {
    this.sampleTime = sampleTime;
  }
  Timer _timer;
  void start() {
    // Start the periodic timer
    _timer =
        new Timer.periodic(new Duration(seconds: sampleTime), _timerCallBack);
  }

  void stop() {
    super.stop();
    _timer.cancel();
  }

  void _timerCallBack(Timer timer) {
    Random _random = new Random();
    int value = _random.nextInt(100);
    _reading.add(value);
  }
}
