/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-12 10:50:42
 * @LastEditTime: 2019-04-12 10:59:20
 */

main(List<String> args) {
  var d = D();
  d.isa = 'isa';
  d.a(); // 打印结果C.a()...  A、B、C中都有a()方法，最终打印的是C.a()这说明与Mixin的顺序有关，因C在B的后面
}

class A {
  String isa;
  void a() {
    print('A.a()...');
  }
}

class B {
  void a() {
    print('B.a()...');
  }
  void b() {
    print('B.b()...');
  }
}

class C {
  void a() {
    print('C.a()...');
  }
  void b() {
    print('C.b()...');
  }
  void c() {
    print('C.c()...');
  }
}

class D extends A with B, C {
  void d() {
    print('D.d()...');
  }
}

abstract class Engine {
  void work();
}

class OilEngine implements Engine {
  @override
  void work() {
    print('Work with oil');
  }
}
class ElectricEngine implements Engine {
  @override
  void work() {
    print('Work with electric');
  }
}

class Tyre {
  String name;
  void run(){}
}
// 简写方式 前提是class Car没有其他属性或方法
class Car = Tyre with ElectricEngine; 
// 完整写法 可以添加属性或方法
class TCar extends Type with ElectricEngine {
  String name;
}

class Bus = Tyre with OilEngine;
