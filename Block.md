# Block

**Block** 是 **Objective-C** 的一个数据类型

用法类似于 **Java** 的匿名类



**Block** 内部是对一段代码的封装，**Block** 可以传入参数，**Block** 可以被调用，**Block** 可以作为**函数的参数**，**返回值**



**Block** 很类似传统的函数指针，但是有区别，**Block** 是 **inline** 的，而且默认情况下它对局部变量是 **只读** 的

### Block 的定义

```objc
// 数据类型：
<返回值> (^)([参数列表])
  
// 定义方法1 typedef 这里相当于定义了一种数据类型 名字为 MySum
typedef int (^MySum) (int,int);

Mysum sum = ^(int a,int b) {
  return a+b;
}

// 定义方法2 直接定义直接使用  
int (^MySum)(int x,int y) = ^(int a, int b) {
		return a+b;
}

// 调用:
int res = MySum(10,20);


//作为函数参数,返回值
+ (void)dataWithSuccess:(void(^)(NSArray *array))success {
    //这个方法传入了一个Block，Block内部有一个参数 array

    //do something...网络请求到数据data
  	NSArray = data;

    //调用这个success，传入block就是为了调用，传data进去让外界对data处理
    success(data);
  	
  	//这个success内部的实现是外部定义的，调用的时候定义，类似于Java的匿名类
}


//调用含Block的函数
[Data dataWithSuccess:^(NSArray *array){
 			 //这里传进去的代码，就是函数内部调用 success() 时候的代码
  
}];
  
```



### Block 的特点

