//this is innoprop ni, where ni stands for new iteration
import 'dart:collection';

void main(){
  Queue q = new Queue();
  q.addAll([100,200,300,400]);
  Iterator i = q.iterator;

  while(i.moveNext()){
    print(i.current);
  }

  List <String> logMsg = new List <String>();
  logMsg.add("WARNING");
  logMsg.add("FAULT");
  logMsg.add("INFO");
  logMsg.add("11111111");
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
  numSetTwo.add(4);//add() works
  print("runtimeType: ${numSetTwo.runtimeType}");
  for(var n in numSetTwo){
    print(n);
  }
  var accounts = new HashMap();
  accounts['dept']='HR';
  accounts['name']='Tom';
  accounts['email']='tom@xyz.com';
  accounts['dept1']='HR';
  accounts['name']='Som';
  accounts['email']='Som@xyz.com';
  accounts['dept']='PR';
  accounts['name']='Dom';
  accounts['email']='dom@xyz.com';
  //print('adding  entries :${accounts}');
  //accounts.addAll({'dept':'PR','name':'Kom','email':'kom@xyz.com'});
  print('here is :${accounts['dept']}');
  accounts.forEach((k,v) => print(v));
  Set numSetthree = new  HashSet();
  numSetthree.addAll([100,200,300]);
  print("numSetthree hashet.. ${numSetthree}");
  numSetthree.remove(100);
  print("numSetthree hashet.. ${numSetthree}");
  numSetthree.clear();
  print("numSetthree hashet.. ${numSetthree}");
  var details = new Map();
  details['Usrname']='admin';
  details['Password']='admin@123';
  print('Details :${details}');
  Map <String,String>pm={'name':'Pom','Id':'E1001'};
   print('Map :${pm}');
}


