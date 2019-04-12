/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-12 10:36:58
 * @LastEditTime: 2019-04-12 10:39:45
 */

void main() {
  var interface = InterfaceDemo();
  interface.action();
}

class InterfaceDemo {
  void action() {
    print('print');
  }
}

class Person {
  String name;
  int get age => 18;
  void run() {
    print('Person run...');
  }
}

class Student implements Person {
  @override
  String name;

  @override
  // TODO: implement age
  int get age => null;

  @override
  void run() {
    // TODO: implement run
  }
}

abstract class SupPerson {
  void supRun();
}

class Runner implements SupPerson {
  @override
  void supRun() {
    // TODO: implement supRun
  }
}