//
//  CircleView.h
//  Circles
//
//  Created by Mon on 3/24/16.
//  Copyright © 2016 YYYeung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Circle.h"

@interface CircleView : UIView

@property (nonatomic, strong) Circle *circle;

+ (instancetype)drawACircleWithCicleData:(Circle *)circle;
+ (instancetype)drawRandomCircle;

@end
