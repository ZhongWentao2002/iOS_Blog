//
//  Book.h
//  Copy
//
//  Created by Clutch Powers on 2022/10/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject <NSCopying>

@property (nonatomic,copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
