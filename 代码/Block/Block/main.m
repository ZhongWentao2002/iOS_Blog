//
//  main.m
//  Block
//
//  Created by Clutch Powers on 2022/10/16.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int a = 10;
        
        void (^MyBlock)(int) = ^(int b){
            a += b;
            NSLog(@"%d",a);
        };
        
        MyBlock(5);
    }
    return 0;
}
