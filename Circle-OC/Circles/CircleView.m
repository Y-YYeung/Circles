//
//  CircleView.m
//  Circles
//
//  Created by Mon on 3/24/16.
//  Copyright © 2016 YYYeung. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

+ (instancetype)drawACircleWithCicleData:(Circle *)circle{
    CircleView *circleV = [[self alloc] initWithCircle:circle];
    [circleV becomeCircle];
    return circleV;
}

+ (instancetype)drawRandomCircle{
    CircleView *circleV = [[self alloc] initWithCircle:[Circle randomCircle]];
    [circleV becomeCircle];
    return circleV;
}

- (instancetype)initWithCircle:(Circle *)circle{
    self = [self initWithFrame:CGRectMake(0, 0, circle.radius * 2, circle.radius * 2)];
    
    if (self) {
        self.circle = circle;
    }
    
    return self;
}

- (void)becomeCircle{
    self.backgroundColor = self.circle.backgroundColor;
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.circle.radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    shape.path = path.CGPath;
    self.layer.mask = shape;
    
    // we should set self.center after we have draw the cirle.
    self.center = self.circle.center;
    self.alpha = 0.6f;
}

@end
