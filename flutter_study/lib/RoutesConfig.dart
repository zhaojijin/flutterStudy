/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-10 15:27:02
 * @LastEditTime: 2019-04-11 20:07:39
 */
import 'package:flutter/material.dart';
import 'package:flutter_study/customPaint/custom_paint.dart';
import 'package:flutter_study/inherit/inheritDemo.dart';

List<String> routesList = ['customPaint', 'inherit'];
List<String> titleList = ['customPaint', '继承'];
List<IconData> iconList = [Icons.flag, Icons.inbox];


List<WidgetBuilder> routesBuilderList = [
  (_) => CustomPaintDemo(),
  (_) => InheritDemo()
];

Map<String, WidgetBuilder> getRoutes() {
  var routes = Map<String, WidgetBuilder>();
  if (routesList.length != routesBuilderList.length) {
    return routes;
  }
  for (int i = 0; i < routesList.length; i++) {
    routes[routesList[i]] = routesBuilderList[i];
  }
  return routes;
}
