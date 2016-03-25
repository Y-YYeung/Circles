//
//  Circle.h
//  Circles
//
//  Created by Mon on 3/24/16.
//  Copyright © 2016 YYYeung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Circle : NSObject

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, strong) UIColor *backgroundColor;

- (instancetype)initWithRadius:(CGFloat)radius center:(CGPoint)center backgroundColor:(UIColor *)backgroundColor;
+ (instancetype)randomCircle;

@end
