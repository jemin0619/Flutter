import 'dart:io';

void main() async{
  var flybyObjects = ['abc','def','ghi','jkl'];
  try { //try는 동기/비동기에서 전부 동작한다.
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } 
  on IOException catch (e) { //IO 에러만 잡음
    print('Could not describe object: $e');
  } 
  catch(e){ //모든 에러를 잡음
    print('모든 에러 $e');
  }
  finally {
    flybyObjects.clear();
  }
}
