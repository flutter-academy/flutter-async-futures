import 'dart:async';

void main() {
  new Future.value(1).then((v) {
    return new Future.error('boom!');
  }).then((v) {
    return new Future.value('hello');
  }).catchError((error) {
    print('error: $error');
  });
}
