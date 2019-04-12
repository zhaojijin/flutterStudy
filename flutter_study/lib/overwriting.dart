/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-12 11:28:37
 * @LastEditTime: 2019-04-12 11:52:34
 */

main(List<String> args) {
  var person1 = Person(18);
  var person2 = Person(18);
  // person1 > person2; // 没有覆写前：The operator '>' isn't defined for the class
  bool result = person1 > person2;
  print(result); // false
  person1.age;
  print(person1['age']); // 18
  print(person1 == person2); // 不覆写返回 false 覆写后返回：true
  
}

class Person {
  int age;
  Person(this.age);
  bool operator > (Person person) {
    return this.age > person.age;
  }
  int operator [] (String key) {
    if (key == 'age') {
      return this.age;
    } else {
      return 0;
    }
  }
  @override
  bool operator == (Object other) =>
      identical(this, other) || 
      other is Person &&
      runtimeType == other.runtimeType && 
      age == other.age;
  @override
  int get hashCode => age.hashCode;
}