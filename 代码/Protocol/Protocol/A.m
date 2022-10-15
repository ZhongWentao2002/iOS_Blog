//
//  A.m
//  Category
//
//  Created by Clutch Powers on 2022/10/15.
//

#import "A.h"

@implementation A

- (void)exec{
    if ( [self.delegate respondsToSelector:@selector(a_Delegate_Method)] ) {
        [self.delegate a_Delegate_Method];
    }else {
        NSLog(@"ERROR : %@ 未实现 %@",[self.delegate class], NSStringFromSelector(_cmd));
    }
}

@end
