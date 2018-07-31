import 'dart:async';

void main() {
  var future1 = new Future.delayed(new Duration(seconds: 1), () => 1);
  var future2 = new Future.delayed(new Duration(seconds: 2), () => throw 'error');
  var future3 = new Future.delayed(new Duration(seconds: 3), () => 3);
  Future
      .wait([future1, future2, future3], eagerError: true, cleanUp: (value) {
        print('processed $value');
      })
      .then(print)
      .catchError(print);
}
