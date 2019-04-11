/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: 
 * @Date: 2019-04-11 20:00:55
 * @LastEditTime: 2019-04-11 20:01:42
 */
class Person {
  String name;
  int age;
  String _gender;
  bool get isAdult => age > 18;
  set aAge(int age) {
    this.age = age;
  }
  void run() {
    print('Person class run');
  }
}