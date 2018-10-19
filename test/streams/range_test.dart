import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

void main() {
  test('RangeStream', () async {
    final expected = const [1, 2, 3];
    var count = 0;

    final stream = new RangeStream(1, 3);

    stream.listen(expectAsync1((actual) {
      expect(actual, expected[count++]);
    }, count: expected.length));
  });

  test('RangeStream.single.subscription', () async {
    final stream = new RangeStream(1, 5);

    stream.listen(null);
    await expectLater(() => stream.listen(null), throwsA(isStateError));
  });

  test('RangeStream.single', () async {
    final stream = new RangeStream(1, 1);

    stream.listen(expectAsync1((actual) {
      expect(actual, 1);
    }, count: 1));
  });

  test('RangeStream.reverse', () async {
    final expected = const [3, 2, 1];
    var count = 0;

    final stream = new RangeStream(3, 1);

    stream.listen(expectAsync1((actual) {
      expect(actual, expected[count++]);
    }, count: expected.length));
  });

  test('rx.Observable.range', () async {
    final expected = const [1, 2, 3];
    var count = 0;

    final observable = Observable.range(1, 3);

    observable.listen(expectAsync1((actual) {
      expect(actual, expected[count++]);
    }, count: expected.length));
  });
}
