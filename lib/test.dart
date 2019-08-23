import 'dart:async';

void main() {

  _testTransform();

}

void _testTransform() {
  StreamController<int> streamController = StreamController<int>.broadcast();
  final transformer = StreamTransformer<int,String>.fromHandlers(
      handleData:(value, sink){
        if(value==100){
          sink.add("你猜对了");
        }
        else{ sink.addError('还没猜中，再试一次吧');
        }
      });

  streamController.stream
      .transform(transformer)
      .listen(
          (data) => print(data),
      onError:(err) => print(err));

  streamController.sink.add(23);
  streamController.sink.add(100);


  streamController.sink.close();
  streamController.close();


}

void _testBroadcast() {
  StreamController streamController = StreamController.broadcast();

  streamController.stream.listen((data) {
    print("one :-> $data");
  });

  streamController.stream.listen((data) {
    print("two :-> $data");
  });

  streamController.stream.listen((data) {
    print("three :-> $data");
  });

  streamController.add("123");
}

void _testBasicFunction() {
  StreamController streamController = StreamController.broadcast();

  StreamSubscription subscription = streamController.stream.listen((data) {
    print(data);
  });

  subscription.onDone(() {
    print("onDone");
  });

  streamController.sink.add("123");

  streamController.close();
}
