import 'package:http/http.dart' as http;

void main() async {
  var response = await http.get('http://google.com');
  print(response.body);
}