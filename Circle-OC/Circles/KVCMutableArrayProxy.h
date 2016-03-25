//
//  KVCMutableArrayProxy.h
//  Circles
//
//  Created by Mon on 3/25/16.
//  Copyright © 2016 YYYeung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCMutableArrayProxy : NSObject

- (NSUInteger)count;

- (void)addObject:(id)anObject;
- (void)removeObject:(id)anObject;
- (void)removeAllObjects;

@end
