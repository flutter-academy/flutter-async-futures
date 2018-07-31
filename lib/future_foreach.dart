import 'dart:async';

void main() {
  Future
      .forEach(
          [1, 2, 5],
          (delay) =>
              new Future.delayed(new Duration(seconds: delay), () => delay)
                  .then(print))
      .then(print)
      .catchError(print);
}
