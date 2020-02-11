import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Sheet',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: Colors.transparent
      ),
      home: BottomSheetHome(),
    );
  }
}

class BottomSheetHome extends StatefulWidget {
  @override
  _BottomSheetHomeState createState() => _BottomSheetHomeState();
}

class _BottomSheetHomeState extends State<BottomSheetHome> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  VoidCallback _showpersistantBottomsheetCallback;

  @override
  void initState() {
    _showpersistantBottomsheetCallback = _showBottomsheet;
    super.initState();
  }

  void _showBottomsheet() {
    setState(() {
      _showpersistantBottomsheetCallback = null;
    });
    _scaffoldkey.currentState
        .showBottomSheet((context) {
          return Container(
            height: 300,
            child: Center(
              child: Text(
                'Mr CK',
                style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showpersistantBottomsheetCallback = _showBottomsheet;
            });
          }
        });
  }
  void _showModeeBottomsheet(){
    showModalBottomSheet(context: context, builder: (builder){
      return Container(
            height: 300,
            child: Center(
              child: Text(
                'Mr CK',
                style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Bottom Sheet'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: RaisedButton(
              onPressed: _showpersistantBottomsheetCallback,
              child: Text('Presistent'),
            )),
            Center(
                child: RaisedButton(
              onPressed: _showModeeBottomsheet,
              child: Text('Model'),
            )),
          ],
        ),
      ),
    );
  }
}
