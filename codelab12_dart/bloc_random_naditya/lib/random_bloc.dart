import 'dart:async';
import 'dart:math';

class RandomNumberBloc {
  // StreamController untuk input events
  final _generateRandomController = StreamController<void>();
  // StreamController untuk output (hasil random number)
  final _randomNumberController = StreamController<int>();

  // Input Sink
  Sink<void> get generateRandom => _generateRandomController.sink;

  // Output Stream
  Stream<int> get randomNumber => _randomNumberController.stream;

  // Constructor
  RandomNumberBloc() {
    _generateRandomController.stream.listen((_) {
      final random = Random().nextInt(10); // angka 0-9
      _randomNumberController.sink.add(random);
    });
  }

  // Method dispose()
  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }
}
