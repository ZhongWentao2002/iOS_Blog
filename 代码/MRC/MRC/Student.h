//
//  Student.h
//  MRC
//
//  Created by Clutch Powers on 2022/10/13.
//

#import <Foundation/Foundation.h>

@class Book;

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,retain) Book *book;

- (void)readBook;

@end

NS_ASSUME_NONNULL_END
