import 'dart:async';

class RandomNumberBloc {
  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void generateNumber() {
    int number = DateTime.now().millisecond % 10;
    _controller.sink.add(number);
  }

  void dispose() {
    _controller.close();
  }
}