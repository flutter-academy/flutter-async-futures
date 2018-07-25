import 'dart:async';

void main() {
  new Future.error('boom!').catchError(print, test: (error) {
    return error is String;
  });
}
