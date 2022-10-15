//
//  Student.h
//  Copy
//
//  Created by Clutch Powers on 2022/10/16.
//

#import <Foundation/Foundation.h>

@class Book;

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, copy) Book *book;

- (void)readBook;

@end

NS_ASSUME_NONNULL_END
