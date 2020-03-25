import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyModule2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Module 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const nativeChannel = const MethodChannel('com.example.flutter/native');
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _goback() {
    _callBackAction();
  }

  Future<void> _callBackAction() async {
    try {
      if(Navigator.canPop(context)) {
        Navigator.of(context).pop();
      } else {
        nativeChannel.invokeMethod("backAction", "hello1");
      }
    } on PlatformException catch (e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(
          color: Colors.white,
          onPressed: _goback,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
