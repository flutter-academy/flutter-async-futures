void main() async {
  var fun1 = (int v) async => v + 1;
  var fun2 = (int v) async => v - 1;
  var fun3 = (int v) async => v * 10;

  var value = 10;
  value = await fun1(value);
  value = await fun2(value);
  value = await fun3(value);
  print(value);
}