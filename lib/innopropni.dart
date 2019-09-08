//this is innoprop ni, where ni stands for new iteration
import 'dart:collection';

void main(){
  Queue q = new Queue();
  q.addAll([100,200,300,400]);
  Iterator i = q.iterator;

  while(i.moveNext()){
    print(i.current);
  }

  List logMsg = new List();
  logMsg.add("WARNING");
  logMsg.add("FAULT");
  logMsg.add("INFO");
  for(String msg in logMsg){
    print(msg);
  }
  print("list as is: ${logMsg.length}");
  logMsg.remove("INFO");
  print("list shortened: ${logMsg.length}");

  Set numSetOne = new Set();
  numSetOne.add(1);
  numSetOne.add(2);
  numSetOne.add(3);
  numSetOne.add(4);
  print("runtimeType: ${numSetOne.runtimeType}");
  for(var n in numSetOne){
    print(n);
  }
  Set numSetTwo = new Set.from([12,14,17]);
  numSetTwo.add(4);
  print("runtimeType: ${numSetTwo.runtimeType}");
  for(var n in numSetTwo){
    print(n);
  }
}
