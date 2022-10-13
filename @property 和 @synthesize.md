# @property

```objective-c
@property [(参数1,参数2,...)] <属性名>
```

- 编译器在编译这行代码的时候，会自动生成对应属性名的**setter**和**getter**的**声明**

```objc
@property (nonatomic,copy) NSString *name;
//等价于
//- (NSString *)name;
//- (void)setName:(NSString *)name;

@property (nonatomic,assign) int _no;
//等价于
//- (int)_no;
//- (void)set_no:(int)_no;
```

- 注意最原始@property就只是声明**setter**和**getter**方法，成员变量需要手动设置，**setter**和**getter**的实现也需要手写



# @synthesize

```objc
@synthesize <属性名> [= <成员变量名>]
```

- 编译器在编译这行代码的时候，会自动生成对应属性名的**setter**和**getter**的**实现**

```objc
@synthesize age;
//等价于
//- (void)setAge:(int)newAge {
//  	age = Age;
//}
```

- 注意下这里的 `age` 仅仅是**属性名** 和@property中定义的**对应**（函数的声明与实现应该对应）

- 默认情况下是**访问**与@property**同名**的**成员变量**

- 后面经过一次更新，@synthesize增强了，如果找不到该成员变量，则会**默认生成这个同名的(私有的)成员变量**

- 也就是说，理论上只要写了@property和@synthesize就够了，不用再去大括号里定义成员变量



### 但是

**Objective-C** 官方建议是成员变量是以下划线开头，目的是将**属性名**与**成员变量名**区分开

点语法调用的时候不含下划线，而实际上的成员变量名是由下划线的

@synthesize中的属性名肯定不能改，但是默认生成的是没有下划线的成员变量，如果类里面写了一个成员变量为_age, 又写了@synthesize age 

最终会有两个成员变量

- _age (定义的)
- age (@synthesize 自动生成的)

最终使用还是age，_age属于无效定义



### 为了解决这个问题

@synthesize有另一种写法

```objc
@synthesize age = _age; //后面这个值代表了setter,getter将要访问谁,将要创建的成员变量是谁
//等价于
//- (void)setAge:(int)age {
//  	_age = age;
//}
```

这样写的好处在于，**属性名**（**setter**，**getter**的方法名）不变的同时，自动创建的成员变量是带有下划线的



# @property 增强版 ( Xcode >= 4.5 )

Xcode 4.5 之后，Apple对@property进行了一波增强

现在只需要写一句@property，无需写@synthesize 就可以实现所有的功能

同样也是属于编译器特性

#### 增强的@property 做了以下几件事

- 生成**附加下划线的**对应属性名的成员变量

- 生成**setter**，**getter**的声明
- 生成**setter**，**getter**的实现

增强的@property xxx; = @property xxx; + @synthesize xxx = _xxx;

> **TIPS**：
>
> Xcode 13 测试的结果，MRC下 @property 自动生成的实现是完全符合内存管理规则的，只是需要重写dealloc，将成员变量释放掉
