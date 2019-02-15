# flutter_stream_learning

I wanted to understand how I could get data from a feed like an mqtt subscription and have a value
get updated in the UI.  Being new to Flutter/Dart, I knew I wanted to do something with a Stream and
StreamBuilder, but wasn't sure how to approach it. 
# Resources
## Reddit Q&A
 I asked the question: ["Best" way to update ListView with data coming in from mqtt](https://www.reddit.com/r/FlutterDev/comments/aqprhd/best_way_to_update_listview_with_data_coming_in/)

vferreitati responded with:  

_Create a stream controller of the same type of your data, something like this:_  
```
var controller = StreamController<List<MyDataClass>>()
```
_Expose this controller's stream by adding the getter:_
```
Stream<List<MyDataClass>> objects get => controller.stream;
```
_Your streambuildet widget should listen to this exposed stream.  To add data to the stream, use te controller's sink:_
```
controller.sink.add(newData)
```
_This data will go through the stream and rebuild the streambuilder widget._

_Edit: Don't forget to close the controller when the page is destroyed. Also, your controller should be private. I'm on mobile, can't format anything correctly._
# Code Example
I then recalled code that I thought might shed more light on how to do this.  And yes indeedy - THANK YOU shamblett for:  
* [isensor.dart](https://github.com/shamblett/iot-home/blob/master/lib/src/sensors/isensor.dart)  
* [dummy_sensor.dart](https://github.com/shamblett/iot-home/blob/master/lib/src/sensors/dummy_sensor.dart)

