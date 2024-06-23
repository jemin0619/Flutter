# 2024-06-22
### [Dart 문법 학습](https://www.youtube.com/watch?v=2qMZ9bvoJZk&t=1012s)

## Input_And_Output
  - Hello World!
  - 변수
  - 코드흐름
  - 함수
  - 주석
  - 라이브러리 추가

## Class_Practice1  
  - 클래스(1)

## Class_Practice2
  - 클래스(2)
  - 상속
  - Mixins
  - 인터페이스, 추상 클래스

## Async_Await
  - 비동기 프로그래밍(async, await)

## Exeption_P
  - 예외처리

## 추가 정리
+ Stream와 Future
  - Future: 단일 비동기 작업이 완료될 때 결과를 필요로 할 때 사용
  - Stream: 비동기적으로 여러 값이나 이벤트를 처리해야 할 때 사용

```Dart
Future<void> printDelayed(String message) async {
  await Future.delayed(Duration(seconds: 2));
  print(message);
}

void main() {
  print('시작');
  printDelayed('2초 후 출력');
  print('끝');
}
```

```Dart
Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
  int i = 0;
  while (maxCount == null || i < maxCount) {
    await Future.delayed(interval);
    yield i++;
  }
}

void main() async {
  await for (int i in timedCounter(Duration(seconds: 1), 5)) {
    print(i);  // 0, 1, 2, 3, 4를 순차적으로 1초마다 출력
  }
}
```
