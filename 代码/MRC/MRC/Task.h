//
//  Task.h
//  MRC
//
//  Created by Clutch Powers on 2022/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property (nonatomic,assign,getter=isComplete) BOOL complete;

@end

NS_ASSUME_NONNULL_END
