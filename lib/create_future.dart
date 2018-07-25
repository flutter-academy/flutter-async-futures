import 'dart:async';

void main() {
  new Future(() {
    var sum = 0;
    for (var i = 0; i < 50000; i++) {
      sum += i;
    }
    return sum;
  }).then(print);
}