//
//  Book.m
//  MRC
//
//  Created by Clutch Powers on 2022/10/13.
//

#import "Book.h"

@implementation Book

- (id)copyWithZone:(struct _NSZone *)zone {
    
    Book *copyObject = [[[self class] allocWithZone:zone] init];
    copyObject.name = self.name;
    
    return copyObject;
}

- (void)dealloc{
    
    NSLog(@"Book（%@） -- dealloc",_name);
    
    [super dealloc];
}


@end
