/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: 
 * @Date: 2019-04-09 10:48:29
 * @LastEditTime: 2019-04-10 15:25:51
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/Routes.dart';
import 'package:flutter_study/RoutesConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Routes(),
      routes: getRoutes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget _listItemBuilder(BuildContext context, int index) {
      return Container(
        color: Colors.red,
        margin: EdgeInsets.only(left: 15),
        height: 80,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CupertinoButton(
              child: Text(
                '${routesList[index]}',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              onPressed: () => Navigator.pushNamed(context, routesList[index]),
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Study'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: routesList.length,
        itemBuilder: _listItemBuilder,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
