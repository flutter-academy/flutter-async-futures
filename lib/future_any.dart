import 'dart:async';

void main() {
  Future
      .any([1, 2, 5].map(
          (delay) => new Future.delayed(new Duration(seconds: delay), () => delay)))
      .then(print)
      .catchError(print);
}
