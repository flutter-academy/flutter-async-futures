import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'HTTP Request Sender',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SendRequestPage(title: 'Send Request'),
    );
  }
}

class SendRequestPage extends StatefulWidget {
  SendRequestPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SendRequestState createState() => new _SendRequestState();
}

class _SendRequestState extends State<SendRequestPage> {
  String _url;

  void _setUrl(String url) {
    setState(() {
      _url = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(child: new TextField(
                    onSubmitted: (value) {
                      _setUrl(value);
                    },
                  ))
                ],
              ),
            ),
            new Expanded(
                child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: _url != null
                        ? FutureBuilder(
                            future: http
                                .get(_url)
                                .then((response) => response.body),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return new Center(
                                      child: new CircularProgressIndicator());
                                default:
                                  if (snapshot.hasError) {
                                    return new Text(
                                      '${snapshot.error}',
                                      style: TextStyle(color: Colors.red),
                                    );
                                  } else {
                                    return new Text(
                                      snapshot.data,
                                      overflow: TextOverflow.clip,
                                    );
                                  }
                              }
                            })
                        : new Text('Input a URL to start')))
          ],
        ),
      ),
    );
  }
}
