/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-11 20:00:28
 * @LastEditTime: 2019-04-11 21:32:19
 */
import 'package:flutter/material.dart';
import 'package:flutter_study/inherit/Person.dart';
import 'package:flutter_study/inherit/Student.dart';

class InheritDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      appBar: AppBar(
        title: Text('继承'),
        elevation: 0,
      ),
      body: Container(
        color: Colors.cyanAccent,
      ),
    );
  }
}

void test() {
  var sub = SubClass('Robin','ObjcIsa');
  print(sub.name);
  return;
  var student = Student();
  student.age = 11;
  student.aAge = 10;
  student.name = 'Robin';
  print(student.age); // 100
  print(student.isAdult); // true
  print(student.name); // Robin
  student.run(); // Student run...
  
  Person person = Student(); // 多态
  if (person is Student) {
    person.study(); // Student study...
  }
}

class SupClass {
  String name;
  SupClass(this.name);
}
class SubClass extends SupClass {
  final String isa;
  /// 初始化列表必须写在父类构造方法之前
  /// 初始化列表和父类构造方法之间用逗号分隔
  SubClass(String name,String isaa) : isa = isaa, super(name); 
}

abstract class AbstractClass {
  void abs();
}

class SubAbstractClass extends AbstractClass {
  @override
  void abs() {
  }
}
