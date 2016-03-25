//
//  UIView+Frame.m
//  ViewUtil
//
//  Created by Mon on 1/11/16.
//  Copyright © 2016 Mon. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

@dynamic originX;
@dynamic originY;
@dynamic width;
@dynamic height;
@dynamic size;
@dynamic origin;
@dynamic centerY;
@dynamic centerX;

@dynamic top;
@dynamic bottom;
@dynamic left;
@dynamic right;

- (void)setOriginX:(CGFloat)originX{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (CGFloat)originX{
    return self.frame.origin.x;
}

- (void)setOriginY:(CGFloat)originY{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (CGFloat)originY{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)top{
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)bottom{
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom - CGRectGetHeight(self.frame);
    self.frame = frame;
}

- (CGFloat)left{
    return CGRectGetMinX(self.frame);
}

- (void)setLeft:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right{
    return CGRectGetMaxX(self.frame);
}

- (void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - CGRectGetWidth(self.frame);
    self.frame = frame;
}

@end
