//
//  main.m
//  Category
//
//  Created by Clutch Powers on 2022/10/15.
//

#import <Foundation/Foundation.h>
#import "A.h"
#import "B.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        A *a = [[A alloc] init];
        B *b = [[B alloc] init];
        
        if ([b conformsToProtocol:@protocol(ADelegate)]) {
            a.delegate = b;
        } else {
            NSLog(@"ERROR is not conformsToProtocol");
            return -1;
        }

        [a exec];
    }
    return 0;
}
