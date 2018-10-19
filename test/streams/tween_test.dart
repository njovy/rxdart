import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

void main() {
  test('rx.Observable.tween', () async {
    const expectedValues = [
      [0.0, 0.0, 0.0, 0.0],
      [1.0, 0.01, 1.99, 0.02],
      [2.0, 0.04, 3.96, 0.08],
      [3.0, 0.09, 5.91, 0.18],
      [4.0, 0.16, 7.84, 0.32],
      [5.0, 0.25, 9.75, 0.5],
      [6.0, 0.36, 11.64, 0.72],
      [7.0, 0.49, 13.51, 0.98],
      [8.0, 0.64, 15.36, 1.28],
      [9.0, 0.81, 17.19, 1.62],
      [10.0, 1.0, 19.0, 2.0],
      [11.0, 1.21, 20.79, 2.42],
      [12.0, 1.44, 22.56, 2.88],
      [13.0, 1.69, 24.31, 3.38],
      [14.0, 1.96, 26.04, 3.92],
      [15.0, 2.25, 27.75, 4.5],
      [16.0, 2.56, 29.44, 5.12],
      [17.0, 2.89, 31.11, 5.78],
      [18.0, 3.24, 32.76, 6.48],
      [19.0, 3.61, 34.39, 7.22],
      [20.0, 4.0, 36.0, 8.0],
      [21.0, 4.41, 37.59, 8.82],
      [22.0, 4.84, 39.16, 9.68],
      [23.0, 5.29, 40.71, 10.58],
      [24.0, 5.76, 42.24, 11.52],
      [25.0, 6.25, 43.75, 12.5],
      [26.0, 6.76, 45.24, 13.52],
      [27.0, 7.29, 46.71, 14.58],
      [28.0, 7.84, 48.16, 15.68],
      [29.0, 8.41, 49.59, 16.82],
      [30.0, 9.0, 51.0, 18.0],
      [31.0, 9.61, 52.39, 19.22],
      [32.0, 10.24, 53.76, 20.48],
      [33.0, 10.89, 55.11, 21.78],
      [34.0, 11.56, 56.44, 23.12],
      [35.0, 12.25, 57.75, 24.5],
      [36.0, 12.96, 59.04, 25.92],
      [37.0, 13.69, 60.31, 27.38],
      [38.0, 14.44, 61.56, 28.88],
      [39.0, 15.21, 62.79, 30.42],
      [40.0, 16.0, 64.0, 32.0],
      [41.0, 16.81, 65.19, 33.62],
      [42.0, 17.64, 66.36, 35.28],
      [43.0, 18.49, 67.51, 36.98],
      [44.0, 19.36, 68.64, 38.72],
      [45.0, 20.25, 69.75, 40.5],
      [46.0, 21.16, 70.84, 42.32],
      [47.0, 22.09, 71.91, 44.18],
      [48.0, 23.04, 72.96, 46.08],
      [49.0, 24.01, 73.99, 48.02],
      [50.0, 25.0, 75.0, 50.0],
      [51.0, 26.01, 75.99, 51.98],
      [52.0, 27.04, 76.96, 53.92],
      [53.0, 28.09, 77.91, 55.82],
      [54.0, 29.16, 78.84, 57.68],
      [55.0, 30.25, 79.75, 59.5],
      [56.0, 31.36, 80.64, 61.28],
      [57.0, 32.49, 81.51, 63.02],
      [58.0, 33.64, 82.36, 64.72],
      [59.0, 34.81, 83.19, 66.38],
      [60.0, 36.0, 84.0, 68.0],
      [61.0, 37.21, 84.79, 69.58],
      [62.0, 38.44, 85.56, 71.12],
      [63.0, 39.69, 86.31, 72.62],
      [64.0, 40.96, 87.04, 74.08],
      [65.0, 42.25, 87.75, 75.5],
      [66.0, 43.56, 88.44, 76.88],
      [67.0, 44.89, 89.11, 78.22],
      [68.0, 46.24, 89.76, 79.52],
      [69.0, 47.61, 90.39, 80.78],
      [70.0, 49.0, 91.0, 82.0],
      [71.0, 50.41, 91.59, 83.18],
      [72.0, 51.84, 92.16, 84.32],
      [73.0, 53.29, 92.71, 85.42],
      [74.0, 54.76, 93.24, 86.48],
      [75.0, 56.25, 93.75, 87.5],
      [76.0, 57.76, 94.24, 88.48],
      [77.0, 59.29, 94.71, 89.42],
      [78.0, 60.84, 95.16, 90.32],
      [79.0, 62.41, 95.59, 91.18],
      [80.0, 64.0, 96.0, 92.0],
      [81.0, 65.61, 96.39, 92.78],
      [82.0, 67.24, 96.76, 93.52],
      [83.0, 68.89, 97.11, 94.22],
      [84.0, 70.56, 97.44, 94.88],
      [85.0, 72.25, 97.75, 95.5],
      [86.0, 73.96, 98.04, 96.08],
      [87.0, 75.69, 98.31, 96.62],
      [88.0, 77.44, 98.56, 97.12],
      [89.0, 79.21, 98.79, 97.58],
      [90.0, 81.0, 99.0, 98.0],
      [91.0, 82.81, 99.19, 98.38],
      [92.0, 84.64, 99.36, 98.72],
      [93.0, 86.49, 99.51, 99.02],
      [94.0, 88.36, 99.64, 99.28],
      [95.0, 90.25, 99.75, 99.5],
      [96.0, 92.16, 99.84, 99.68],
      [97.0, 94.09, 99.91, 99.82],
      [98.0, 96.04, 99.96, 99.92],
      [99.0, 98.01, 99.99, 99.98],
      [100.0, 100.0, 100.0, 100.0],
      [100.0, 100.0, 100.0, 100.0]
    ];
    var count = 0;

    Observable.zip4(
            Observable.tween(0.0, 100.0, const Duration(seconds: 2),
                intervalMs: 20),
            Observable.tween(0.0, 100.0, const Duration(seconds: 2),
                intervalMs: 20, ease: Ease.IN),
            Observable.tween(0.0, 100.0, const Duration(seconds: 2),
                intervalMs: 20, ease: Ease.OUT),
            Observable.tween(0.0, 100.0, const Duration(seconds: 2),
                intervalMs: 20, ease: Ease.IN_OUT),
            (double a, double b, double c, double d) => [a, b, c, d])
        .map((values) => values.map((value) => (value * 100).round() / 100))
        .listen(expectAsync1((result) {
          // test to see if the combined output matches
          final expected = expectedValues[count++];

          for (var i = 0, len = result.length; i < len; i++)
            expect(expected[i], result.elementAt(i));
        }, count: expectedValues.length));
  });

  test('rx.Observable.tween.single.subscription', () async {
    final observable = Observable.tween(0.0, 100.0, const Duration(seconds: 2),
        intervalMs: 20);

    observable.listen(null);
    await expectLater(() => observable.listen(null), throwsA(isStateError));
  });

  test('rx.Observable.tween.asBroadcast', () async {
    final observable =
        Observable.tween(0.0, 100.0, const Duration(seconds: 2), intervalMs: 20)
            .asBroadcastStream();

    observable.listen(null);
    observable.listen(null);

    await expectLater(observable.isBroadcast, isTrue);
  });
}
