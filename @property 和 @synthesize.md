# @property

```objective-c
@property [(参数1,参数2...)] <属性名>
```

- 编译器在编译这行代码的时候，会自动生成对应属性名的**setter**和**getter**的声明

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

- 注意最原始**@property**就只是声明**setter**和**getter**方法，成员变量需要手动设置，**setter**和**getter**的实现也需要手动设置



# @synthesize

```

```



