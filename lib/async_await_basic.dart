import 'dart:async';

void main() async {
  var future = new Future.delayed(new Duration(seconds: 3), () {
    return 1;
  });
  var result = await future;
  print(result + 1);
}