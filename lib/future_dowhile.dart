import 'dart:async';
import 'dart:math';

void main() {
  var random = new Random();
  var totalDelay = 0;
  Future
      .doWhile(() {
        if (totalDelay > 10) {
          print('total delay: $totalDelay seconds');
          return false;
        }
        var delay = random.nextInt(5) + 1;
        totalDelay += delay;
        return new Future.delayed(new Duration(seconds: delay), () {
          print('waited $delay seconds');
          return true;
        });
      })
      .then(print)
      .catchError(print);
}
