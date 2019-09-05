import 'dart:math';

enum Status {
   none,
   running,
   stopped,
   paused
}

test_param(int a, String b, [s1]){//s1 is optional parameter
  const k = 123;
  if(a < k){
    print(b);
  } else {
    print(a);
  }
  print(s1);
}

void main(){
  var myvar='hell';
  var Myvar='o';
  double n=2.20;// int n = "word"; is an error
  var num = n is! int;
  dynamic tom = "tom";
  dynamic appleAmount = 10;
  final v1 = 12;
  const v2 = 13;
  //v2 = 12;
  print (n is int);//with checking
  print (myvar+Myvar+", "+tom+" has $appleAmount apples");//combine String and int
  print (appleAmount);
  print (v1);
  print (v2);
  //======
  var number = 5;
  var factorial = 1;
  for( var i = number ; i >= 1; i-- ) {
   factorial *= i ;
   //print(factorial);
  }
  print(factorial);
  print("=======");
  var myArrIsObject = [12,13,14];//this is object
   for (var iterator in myArrIsObject) {
      print(iterator);
   }
   print("=======");
   var a = null;
   var res = a ?? number; // ?? = Assign the value only if the variable is null
   print(res);
   print("=======");
   if (number>0) {
      print("number is positive");
   }
   bool test;
   test = 12 > 5;
   print(test);
   print("=======");
   var lst = new List();
   //var lst = new List(3);
   //lst[0]=00;
   //lst[1]=01;
   //lst[2]=02;
   print("list consist ${lst} elements, so empty is: ${lst.isEmpty}, and lst length is: ${lst.length}.");
   print(lst.isEmpty);
   lst.add(12);
   lst.add(13);
   for(int i = 0; i < 20;i++){
     lst.add(i);
   }
   print(lst);
   print("last element of list is: ${lst.last}");
   print("the list values in reverse order: ${lst.reversed}");
   List l = [1, 2, 3,4,5,6,7,8,9];
   print('The value of list before replacing ${l}');
   l.replaceRange(0,3,[11,23,24]);
   print('The value of list after replacing the items between the range [0-3] is ${l}');
   dynamic remover = l.removeAt(1);
   print('The value of the element ${res}');
   print('The value of list after removing the list element ${l}');
   var details = {'Usrname':'tom','Password':'pass@123'};
   print(details);
   details['Uid'] = 'Uqoolele';
   print(details);
   print("=======");
   var five = 5;
   for( int i = 0; i < 10; i++) {
    five *= 5 ;
    print(five);
   }
   var usrMap = {"name": "Tom", 'Email': 'tom@xyz.com'};
   usrMap.forEach((k,v) => print('${k}: ${v}'));
   print("=======");
   print(Status.values);
   Status.values.forEach((v) => print('value: $v, index: ${v.index}'));
   print('running: ${Status.running}, ${Status.running.index}');
   print('running index: ${Status.values[1]}');
   print("=======");
   test_param(122,"This is not enough");
   print("=======");
}
