# @property

```objective-c
@property <数据类型> <属性名>
```

- 编译器在编译这行代码的时候，会自动生成对应属性名的**setter**和**getter**的**声明**

```objc
@property NSString *name;
//等价于
//- (NSString *)name;
//- (void)setName:(NSString *)name;

@property int _no;
//等价于
//- (int)_no;
//- (void)set_no:(int)_no;
```

- 注意最原始 **@property** 就只是声明**setter**和**getter**方法，成员变量需要手动设置，**setter**和**getter**的实现也需要手写



# @synthesize

```objc
@synthesize <属性名> [= <成员变量名>]
```

- 编译器在编译这行代码的时候，会自动生成对应属性名的**setter**和**getter**的**标准实现**

```objc
@synthesize age;
//等价于
//- (void)setAge:(int)newAge {
//  	age = Age;
//}
```

- 注意下这里的 `age` 仅仅是**属性名** 和 **@property** 中定义的**对应**（函数的声明与实现应该对应）

- 默认情况下是**访问**与 **@property** **同名**的**成员变量**

- 后面经过一次更新， **@synthesize** 增强了，如果找不到该成员变量，则会**默认生成这个同名的(私有的)成员变量**

- 也就是说，理论上只要写了 **@property** 和 **@synthesize** 就够了，不用再去大括号里定义成员变量



### 但是

**Objective-C** 官方建议是成员变量是以下划线开头，目的是将**属性名**与**成员变量名**区分开

点语法调用的时候不含下划线，而实际上的成员变量名是由下划线的

 **@synthesize** 中的属性名肯定不能改，但是默认生成的是没有下划线的成员变量，如果类里面写了一个成员变量为_age, 又写了@synthesize age 

最终会有两个成员变量

- _age (定义的)
- age ( **@synthesize**  自动生成的)

最终使用还是age，_age属于无效定义



### 为了解决这个问题

 **@synthesize** 有另一种写法

```objc
@synthesize age = _age; //后面这个值代表了setter,getter将要访问谁,将要创建的成员变量是谁
//等价于
//- (void)setAge:(int)age {
//  	_age = age;
//}
```

这样写的好处在于，**属性名**（**setter**，**getter**的方法名）不变的同时，自动创建的成员变量是带有下划线的 (如果大括号中有声明就用大括号的，发现没有就自动创建)



# @property 增强版 ( Xcode >= 4.5 )

```objective-c
@property [(参数1,参数2,...)] <数据类型> <属性名>
```

**Xcode 4.5** 之后，Apple对 **@property** 进行了增强

现在只需要写一句 **@property** ，无需写 **@synthesize**  就可以实现所有的功能

同样也是属于编译器特性

#### **增强的**@property 做了以下几件事

- 生成**附加下划线的**对应属性名的成员变量

- 生成**setter**，**getter**的声明
- 生成**setter**，**getter**的实现

增强的**@property xxx; = @property xxx; + @synthesize xxx = _xxx;**

以后说**@property**，均指增强过后的**@property**



# @property 参数

**@property** 后面可以加参数，即使不写，编译器也会自动加上默认参数 **(atomic, assign,readwrite)**

**@property 的参数可以分为5种，每一种只能接受一个参数**

### 1 内存管理相关参数

用于：set方法内存管理

#### MRC

- **assign** (默认参数)

assign的字面意思是赋值，这代表这个属性的set使用直接复制的实现，不添加内存管理代码

适合非OC对象，基本数据类型

- **retain**

retain 参数会在set方法的实现添加符合内存管理代码（release旧值，retain新值），适合OC对象

- **copy**

copy 参数同retain一样，也会生成符合内存管理的代码（release旧值，copy新值），适用于**NSString**、**NSArray**等不可变对象。不过和retain不同，持有对象的时候调用的是copy方法，会拷贝一份新的值，而不是原对象的指针，使用copy生成了一个不可变的副本，是为了防止不知道的情况下属性值被修改。



### 2 读写特性

用于：是否要生成set方法

- **readwrite** (默认参数) : 生成set和get的声明与实现，可读写
- **readonly** ：只生成get方法的声明与实现（**不生成set的方法的声明与实现**），只读



### 3 多线程特性

- **atomic**：原子性操作，会被加锁，在多线程环境下,就不会出现变量被修改等奇怪的问题（保证数据同步）。原子操作就是不可再分的操作
- **nonatomic**：非原子性操作，直接从内存中取数值（不考虑其是否被占用），在多线程环境下可提高性能，但无法保证数据同步。

一般开发OC应用程序用 **nonatomic** 就足够



### 4 方法名特性

用于：set、get方法重命名，常用于**BOOL**类型的成员变量的get方法,以**is开头**

![image](Images/Snipaste_2022-10-15_18-01-38.png)



![iamge](Images/Snipaste_2022-10-15_18-01-07.png)



### 5 类属性

**Xcode 8** 引入了新特性，现在可以为类添加属性了

> Objective-C now supports class properties, which interoperate with Swift type properties. They are declared as: @property (class) NSString *someStringProperty; They are never synthesized. 



- **class** ：说明这是一个类属性

当我们声明一个class属性的时候，编译器会发出警告，这也就是前面说的They are never synthesized

这两个属性永远不会synthesized，因此如果我们不显式的添加setter和getter方法，Xcode就会提示警告信息使用 **@dynamic** 或者是**提供setter和getter方法**

**注意在getter方法前面使用 + 让其成为一个类的方法**



# 注意事项

### 同时重写setter和getter方法时，@property不会生成成员变量

![image](Images/Snipaste_2022-10-14_12-56-45.png)

解决方法有两种，**任选其一即可**

- 使用@synthesize 声明

![image](Images/Snipaste_2022-10-14_13-01-01.png)

这里的 **@synthesize** 只起到关联成员变量的作用，不会自动改变setter，getter的实现



- 使用大括号声明

![image](Images/Snipaste_2022-10-14_13-02-02.png)



### 使用@synthesize必须使用@property进行声明

否则编译会报错

```C
Property implementation must have its declaration in interface 'XXX' or one of its extensions
```



### @synthesize的优先级

 **@synthesize** 的优先级大于 **@property** 

如果@property int age; 

后面又写了个@synthesize age;

虽然说 **@property** 会生成 _age 的成员变量，但是 **@synthesize** 的优先级更高，这样写只会生成age，不会生成 _age







