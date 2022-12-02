> array는 같은 type의 element들의 collection이다. array는 index를 통해서 값을 설정하고 반환할 수 있다.

## array 특징

### 1. array는 뭐든지 담을 수 있다.

```swift
let ints = [1, 2, 3]
let strings = ["a", "b", "c"]
let people = [Person(), Person(), Person()]
```


### 2. array의 size는 고정돼있다.
swift에서는 size를 명시하지는 않는다.

```swift
let ints = [Int]()
let strings = [String]()
let people = [Person]()
```

### 3. array는 random access를 지원한다.
list는 가능하지만 linked list, stack, queue는 불가능하다. 
 
```swift
var array = ["a", "b", "c", "d"]
array.remove(at: 1)
array.insert("b", at: 1)
array.append("e")
```
* index를 알기때문에 get(4), set(5, "a") 같은 메소드는 O(1)시간(constant time)만큼 걸린다.
 
<br> 

### Insert
insert는 copy, inserting, incrementing을 통해 실행된다.

#### copy up

["a", "c", "d"]가

["a", (_), "c", "d"] 된다.

#### insert

["a", "b", "c", "d"]


#### incrementing

array의 size를 3에서 4로 increment

* insert는 copy 부분 때문에 insert는 O(n)시간 걸린다.

### Delete

delete는 insert와 비슷하다 copy up대신 copy down을 실행한다.

* delete는 O(n)시간 걸린다.


<br>


## Growing the Size of and Array

1. add(5)
[1, 2, 3, 4]

2. create new array(size x2)
[( ), ( ), ( ), ( ), ( ), ( ), ( ), ( )]

3. copy & point to new
[1, 2, 3, 4, ( ), ( ), ( ), ( )]

4. insert
[1, 2, 3, 4, 5, ( ), ( ), ( )]

* O(n)시간 걸린다.

<br>

## What's different about Swift?

array를 정의할 때 size를 명시하지 않는다.

```swift
let arrayOfSpecificSize = Array<Int>(repeating: 1, count: 10)
```
다음 처럼 명시해 줄 수도 있다.



