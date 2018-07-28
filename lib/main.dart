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
      home: new SendRequestPage(title: 'Send HTTP Request'),
    );
  }
}

typedef SetUrl = Function(String url);

class URLInput extends StatelessWidget {
  URLInput(this.setUrl, {Key key}) : super(key: key);

  final SetUrl setUrl;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new TextField(
            onSubmitted: setUrl,
          ))
        ],
      ),
    );
  }
}

class RequestSender extends StatelessWidget {
  RequestSender(this.url, {Key key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: url != null
                ? http.get(url).then((response) => response.body)
                : null,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('Input a URL to start');
                case ConnectionState.waiting:
                  return new Center(child: new CircularProgressIndicator());
                case ConnectionState.active:
                  return new Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return new Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return new ListView(
                        children: <Widget>[new Text(snapshot.data)]);
                  }
              }
            }));
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
            new URLInput(_setUrl),
            new Expanded(child: new RequestSender(_url))
          ],
        ),
      ),
    );
  }
}
