//
//  main.m
//  Copy
//
//  Created by Clutch Powers on 2022/10/16.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    
    Book *myBook = [[Book alloc] init];
    myBook.name = @"iOS";
    
    Student *stu = [[Student alloc] init];
    stu.book = myBook;
    
    myBook.name = @"Android";
    
    [stu readBook];
    
    return 0;
}
