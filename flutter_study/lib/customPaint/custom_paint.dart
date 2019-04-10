/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: 
 * @Date: 2019-04-09 10:51:02
 * @LastEditTime: 2019-04-10 15:26:12
 */
import 'dart:ui';
import 'dart:ui' as ui;
import '../Utils.dart';
import 'package:flutter/material.dart';

const PI = 3.141592654;
ui.Image image;
class CustomPaintDemo extends StatefulWidget {
  @override
  _CustomPaintDemoState createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemo> {
  @override
  // void initState() {
    
  //   super.initState();
  //   init();
  // }

  // void init() async {
  //   image = await Utils.getImage('images/wukong.png');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPainter'),
        elevation: 0,
      ),
      body: CustomPaint(
        painter: LinePainter(),
      ),
    );
  }
}

/// 新建类继承于CustomPainter并且实现CustomPainter里面的paint（）和shouldRepaint方法
class LinePainter extends CustomPainter {
  
  ///Flutter中负责View绘制的地方，使用传递来的canvas和size即可完成对目标View的绘制
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制直线
    _drawLine(canvas);

    // 绘制点
    _drawPoint(canvas);

    // 绘制圆
    _drawCircle1(canvas);
    _drawCircle2(canvas);

    // 绘制椭圆drawOval
    _drawOval(canvas);

    //绘制圆弧drawArc
    _drawArc1(canvas);
    _drawArc2(canvas);

    // 绘制圆角矩形drawDRRect
    _drawRRect(canvas);

    // 绘制双圆角矩形drawDRRect
    _drawDRRect(canvas);
    _drawDRRect1(canvas);

    // 绘制路径drawPath
    _drawPath(canvas);

    // 使用三阶贝塞尔曲线绘制❤
    // _drawPathCubicTo(canvas);

    _drawColor(canvas);
  }

  ///控制自定义View是否需要重绘的，返回false代表这个View在构建完成后不需要重绘。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Paint _paint = Paint()
  ..color = Colors.blueAccent // 画笔颜色
  ..strokeCap = StrokeCap.round // 画笔笔触类型
  ..isAntiAlias = true // 是否启动抗锯齿
  // ..blendMode = BlendMode.exclusion // 颜色混合模式
  ..style = PaintingStyle.stroke // 绘画风格，默认是填充
  // ..colorFilter = ColorFilter.mode(Colors.blueAccent,
  // BlendMode.exclusion) // 颜色渲染模式，一般是矩阵效果来改变的，但是flutter中只能使用颜色混合模式
  // ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) // 模糊遮罩效果，flutter中只有这个
  ..filterQuality = FilterQuality.high
  ..strokeWidth = 5.0;

void _drawLine(Canvas canvas) {
  // 绘制直线
  Offset p1 = Offset(20, 20);
  Offset p2 = Offset(120, 20);
  canvas.drawLine(p1, p2, _paint);
}

void _drawPoint(Canvas canvas) {
  canvas.drawPoints(

      ///PointMode的枚举类型有三个，
      ///points（点）， lines（线，隔点连接）， polygon（线，相邻连接）
      PointMode.polygon,
      [
        Offset(20, 50),
        Offset(120, 50),
        Offset(80, 100),
        Offset(80, 150),
        Offset(60, 170),
        Offset(60, 100),
        Offset(20, 50),
      ],
      _paint);
}

void _drawCircle1(Canvas canvas) {
  // 绘制圆 参数（圆心，半径，画笔）
  canvas.drawCircle(Offset(150, 80), 20, _paint);
}

void _drawCircle2(Canvas canvas) {
  Paint paint = Paint()
    ..color = Colors.green
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 5;
  ;
  // 绘制圆 参数（圆心，半径，画笔）
  canvas.drawCircle(Offset(150, 140), 20, paint);
}

void _drawOval(Canvas canvas) {
  Paint paint = Paint()
    ..color = Colors.red
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke;

  /** 
    使用左上和右下角坐标来确定矩形的大小和位置
    fromPoints(Offset a, Offset b)
    
    使用圆的圆心点坐标和半径和确定外切矩形的大小和位置
    fromCircle({ Offset center, double radius })
    
    使用矩形左边的X坐标、矩形顶部的Y坐标、矩形右边的X坐标、矩形底部的Y坐标来确定矩形的大小和位置
    fromLTRB(double left, double top, double right, double bottom)

    使用矩形左边的X坐标、矩形顶部的Y坐标矩形的宽高来确定矩形的大小和位置
    fromLTWH(double left, double top, double width, double height)
 */
  Rect rect = Rect.fromPoints(Offset(200, 20), Offset(300, 60));
  canvas.drawRect(rect, paint);
  canvas.drawOval(rect, _paint);
}

void _drawArc1(Canvas canvas) {
  Paint paint = Paint()
    ..color = Colors.orange
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;

  Rect rect = Rect.fromLTWH(200, 80, 100, 40);
  canvas.drawRect(rect, paint);
  double startAngle = 0;
  double sweepAngle = PI / 2;
  bool useCenter = true;
  canvas.drawArc(rect, startAngle, sweepAngle, useCenter, _paint);
}

void _drawArc2(Canvas canvas) {
  Paint paint = Paint()
    ..color = Colors.purple
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;

  Rect rect = Rect.fromLTWH(320, 20, 80, 80);
  canvas.drawRect(rect, paint);
  double startAngle = 0;
  double sweepAngle = PI / 2;
  bool useCenter = true;
  canvas.drawArc(rect, startAngle, sweepAngle, useCenter, _paint);
}

void _drawRRect(Canvas canvas) {
  Rect rect = Rect.fromCircle(center: Offset(70, 250), radius: 50);
  Radius radius = Radius.circular(20);
  // Radius radius = Radius.circular(50); 改成50会变成一个圆
  RRect rrect = RRect.fromRectAndRadius(rect, radius);
  // RRect rrect = RRect.fromRectAndCorners(rect,topLeft: Radius.circular(20),bottomRight: Radius.circular(10));
  canvas.drawRRect(rrect, _paint);
}

void _drawDRRect(Canvas canvas) {
  Radius radius1 = Radius.circular(10);
  Rect rect1 = Rect.fromCircle(center: Offset(200, 250), radius: 50);
  RRect outer = RRect.fromRectAndRadius(rect1, radius1);
  // canvas.drawRRect(inner, _paint);
  Radius radius2 = Radius.circular(5);
  Rect rect2 = Rect.fromCircle(center: Offset(200, 250), radius: 20);
  RRect inner = RRect.fromRectAndRadius(rect2, radius2);
  // canvas.drawRRect(outer, _paint);
  canvas.drawDRRect(outer, inner, _paint); // 注意 当outer和inner位置相反时，绘制不出结果
}

void _drawDRRect1(Canvas canvas) {
  Paint paint1 = Paint()
    ..color = Color(0xffc8a556)
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;

  // Paint paint2 = Paint()
  // ..color = Color.fromRGBO(0, 0, 0, 1)
  // ..strokeCap = StrokeCap.round
  // ..strokeWidth = 5
  // ..style = PaintingStyle.fill
  // ..isAntiAlias = true
  // ;
  Radius radius1 = Radius.circular(50);
  Rect rect1 = Rect.fromCircle(center: Offset(330, 250), radius: 50);
  RRect outer = RRect.fromRectAndRadius(rect1, radius1);
  canvas.drawRRect(outer, paint1);
  Radius radius2 = Radius.circular(5);
  Rect rect2 = Rect.fromCircle(center: Offset(330, 250), radius: 20);
  RRect inner = RRect.fromRectAndRadius(rect2, radius2);
  canvas.drawRRect(inner, paint1);
}

void _drawPath(Canvas canvas) {
/**
    Path的常用方法：
    将路径起始点移动到指定的位置
    moveTo
    相对于当前位置移动到
    relativeMoveTo
    从当前位置连接指定点
    lineTo
    相对当前位置连接到
    relativeLineTo
    曲线
    arcTo
    贝塞尔曲线
    conicTo
    添加其他图形，如addArc，在路径是添加圆弧
    add**
    路径上是否包括某点
    contains
    给路径做matrix4变换
    transfor
    结合两个路径
    combine
    关闭路径，连接路径的起始点
    close
    重置路径，恢复到默认状态
    reset
 */

  Path path = Path()
  ..moveTo(20, 320);
  path.lineTo(50, 340);
  path.lineTo(70, 330);
  path.relativeLineTo(10, 20);
  canvas.drawPath(path, _paint);

  // 贝赛尔曲线
  Path path1 = Path()..moveTo(90, 330);
  Rect rect = Rect.fromLTWH(100, 330, 60, 60);
  // 如果“forceMoveTo”参数为false，则添加一条直线段和一条弧段。
  // 如果“forceMoveTo”参数为true，则启动一个新的子路径，其中包含一个弧段。
  // path1.arcTo(rect, startAngle, sweepAngle, forceMoveTo)
  path1.arcTo(rect, 0, PI/2, false);
  canvas.drawPath(path1, _paint);

  Path path2 = Path()..moveTo(150, 330);
  Rect rect2 = Rect.fromLTWH(150, 330, 60, 60);
  path2.arcTo(rect2, 0, PI/2, true);
  canvas.drawPath(path2, _paint);

  Path path3 = Path()..moveTo(250, 330);
  Rect rect3 = Rect.fromLTWH(250, 330, 60, 60);
  path3.arcTo(rect3, 0, 3.14 * 2, true); // PI *2/3.141592654 *2不会有绘制结果 
  canvas.drawPath(path3, _paint);
  // 使用控制点（x1，y1）和权重w，添加从当前点到给定点（x2，y2）的曲线段。 
  // 如果重量大于1，那么曲线就是双曲线; 如果重量等于1，那就是抛物线; 如果小于1，则为椭圆形。
  // path.conicTo(x1, y1, x2, y2, w)
}

// 使用三阶贝塞尔曲线绘制❤
void _drawPathCubicTo(Canvas canvas) {
  // var width = 200;
  // var height = 300;
  // Path path = Path()..moveTo(20, 350);
  // // 使用控制点（x1，y1）和（x2，y2）添加从当前点到给定点（x3，y3）的曲线的三次贝塞尔曲线段。
  // // path.cubicTo(x1, y1, x2, y2, x3, y3)
  // path.cubicTo(x1, y1, x2, y2, x3, y3)

    var width = 200;
    var height = 300;
    Path path = Path();
    path.moveTo(width / 2, height / 4);
    path.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path, _paint);

    Path path2 = new Path();
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height/ 9, width / 21, (height * 2) / 5,
        width / 2, (height * 7) / 12);
    canvas.drawPath(path2, _paint);
}

_drawColor(Canvas canvas) {
  // canvas.save();
  // ui.Image image = await Utils.getImage('images/wukong.png');
  // ui.Image image = await Utils.getImage('images/wukong.png');
  // canvas.drawColor(Colors.red, BlendMode.colorBurn);
  // canvas.drawImage(image, Offset(0, 0), _paint);
  // canvas.save();
  // canvas.restore();
  // canvas.drawImageNine(Image.asset('images/wukong.png'), Rect.fromCircle(center: Offset(dx, dy)), dst, _paint);
}
