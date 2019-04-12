/*
 * @Description: 
 * @Author: zhaojijin
 * @LastEditors: Please set LastEditors
 * @Date: 2019-04-12 14:49:20
 * @LastEditTime: 2019-04-12 14:52:43
 */

main(List<String> args) {
  var utils = Utils();
  utils.input(1);
  utils.input('1');
  utils.out('genericity');
  utils.out(['1','2']);
} 

class Utils<T> {
  T name;
  void input(T name) {
    this.name = name;
  }
  void out<TT>(TT genericity) {
    print(genericity);
  }
}