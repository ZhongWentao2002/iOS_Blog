//
//  A.h
//  Category
//
//  Created by Clutch Powers on 2022/10/15.
//

#import <Foundation/Foundation.h>

@protocol ADelegate <NSObject>

- (void)a_Delegate_Method;

@end


@interface A : NSObject

@property (nonatomic,weak) id<ADelegate> delegate;

- (void)exec;

@end

