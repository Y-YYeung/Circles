//
//  Circle.m
//  Circles
//
//  Created by Mon on 3/24/16.
//  Copyright © 2016 YYYeung. All rights reserved.
//

#import "Circle.h"

static CGFloat maxiRadius = 100.f;

@implementation Circle

- (instancetype)initWithRadius:(CGFloat)radius center:(CGPoint)center backgroundColor:(UIColor *)backgroundColor{
    self = [super init];
    if (self) {
        self.radius = radius;
        self.center = center;
        self.backgroundColor = backgroundColor;
    }
    
    return self;
}

+ (instancetype)randomCircle{
    CGPoint center = [self randomCenter];
    CGFloat radius = [self radiusWithCenter:center];
    
    return [[self alloc] initWithRadius:radius center:center backgroundColor:[self randomBackgroundColor]];
}

+ (CGPoint)randomCenter{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    NSUInteger x = arc4random_uniform(screenWidth-10) + 10;
    
    return CGPointMake(x, screenHeight);
}

+ (CGFloat)radiusWithCenter:(CGPoint)center{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat maxRadius = center.x <= screenWidth - center.x ? center.x : screenWidth - center.x;
    maxRadius = maxRadius >= maxiRadius ? maxiRadius : maxRadius;
    CGFloat radius = arc4random_uniform(maxRadius) + 1;
    
    return radius;
}

+ (UIColor *)randomBackgroundColor{
    NSArray *colors = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor purpleColor], [UIColor cyanColor], [UIColor magentaColor]];
    
    UIColor *backgroundColor = colors[arc4random_uniform((int)colors.count)];
    return backgroundColor;
}

@end
