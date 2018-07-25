import 'dart:async';

void main() {
  new Future.delayed(new Duration(seconds: 5), () {
    return 1;
  }).timeout(new Duration(seconds: 2)).then(print).catchError(print);
}
