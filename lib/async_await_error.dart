import 'dart:async';

void main() async {
  var future = new Future.delayed(new Duration(seconds: 3), () {
    return new Future.error('boom!');
  });
  try {
    var result = await future;
    print(result + 1);
  } catch (e) {
    print('error: $e');
  } finally {
    print('done!');
  }
}
