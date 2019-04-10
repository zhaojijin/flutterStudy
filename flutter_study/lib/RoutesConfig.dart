import 'package:flutter/material.dart';
import 'package:flutter_study/customPaint/custom_paint.dart';

List<String> routesList = ['customPaint'];

List<WidgetBuilder> routesBuilderList = [(_) => CustomPaintDemo()];

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