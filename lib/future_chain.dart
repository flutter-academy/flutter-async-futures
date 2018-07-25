import 'dart:async';

void main() {
  var future = new Future.value('a').then((v1) {
    return new Future.value('$v1 b').then((v2) {
      return new Future.value('$v2 c').then((v3) {
        return new Future.value('$v3 d');
      });
    });
  });
  future.then(print, onError: print);
}
