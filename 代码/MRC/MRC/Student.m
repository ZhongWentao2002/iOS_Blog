//
//  Student.m
//  MRC
//
//  Created by Clutch Powers on 2022/10/13.
//

#import "Student.h"

#import "Book.h"
@implementation Student

- (void)readBook{
    NSLog(@"Student %@ read %@ book",_name,_book.name);
}

//- (void)setBook:(Book *)book{
//    if (_book != book) {
//        [_book release];
//        _book = [book retain];
//    }
//}
//
//- (Book *)book{
//    return _book;
//}


- (void)dealloc{

    [_book dealloc];

    NSLog(@"Student -- dealloc");

    [super dealloc];
}

@end
