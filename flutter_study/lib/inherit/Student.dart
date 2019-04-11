/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-11 20:01:14
 * @LastEditTime: 2019-04-11 20:34:46
 */
import 'package:flutter_study/inherit/Person.dart';

class Student extends Person {

  ///重写父类getter方法
  @override
  bool get isAdult {
    return this.age > 10;
  }
  ///重写父类setter方法
  @override
  set aAge(int age) {
    this.age = age * 10;
  }
  ///重写父类方法
  @override
  void run() {
    print('Student run...');
  }
  void study() {
    print('Student study...');
  }
}