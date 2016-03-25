//
//  KVCMutableArrayProxy.m
//  Circles
//
//  Created by Mon on 3/25/16.
//  Copyright © 2016 YYYeung. All rights reserved.
//

#import "KVCMutableArrayProxy.h"

@interface KVCMutableArrayProxy ()

@property (nonatomic, strong) NSMutableArray *mutableArray;

@end

@implementation KVCMutableArrayProxy

- (instancetype)init{
    self = [super init];
    
    if (self) {
        _mutableArray = [NSMutableArray array];
    }
    
    return self;
}

- (NSUInteger)count{
    return self.mutableArray.count;
}

- (void)addObject:(id)anObject{
    [self willChangeValueForKey:@"count"];
    [self.mutableArray addObject:anObject];
    [self didChangeValueForKey:@"count"];
}

- (void)removeObject:(id)anObject{
    [self willChangeValueForKey:@"count"];
    [self.mutableArray removeObject:anObject];
    [self didChangeValueForKey:@"count"];
}

@end
