import 'dart:async';

void main() {
  new Future.error('boom!').then(print, onError: (error) {
    print('handle original error: $error');
    throw 'new error';
  }).then(print, onError: (error) {
    print('handle new error: $error');
  });
}
