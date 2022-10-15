//
//  Book.m
//  MRC
//
//  Created by Clutch Powers on 2022/10/13.
//

#import "Book.h"

@implementation Book

- (void)dealloc{
    
    NSLog(@"Book（%@） -- dealloc",_name);
    
    [super dealloc];
}

@end
