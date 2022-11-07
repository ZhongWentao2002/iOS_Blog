//
//  main.m
//  MRC
//
//  Created by Clutch Powers on 2022/10/13.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Book.h"

void setBookForStu(Student *stu){
    Book *book = [[Book alloc] init];
    book.name = @"iOS";
    
    stu.book = book;
    [book release];
    
    stu.book = book;
}

void action(Student *stu){
    [stu readBook];
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        Student *stu = [[[Student alloc] init] autorelease];
        stu.name = @"Jack";
        
        setBookForStu(stu);
        action(stu);
    
//        [stu release];
    }
    
    NSLog(@"Done");
    
    return 0;
}
