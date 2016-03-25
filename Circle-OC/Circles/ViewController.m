//
//  ViewController.m
//  Circles
//
//  Created by Mon on 3/24/16.
//  Copyright © 2016 YYYeung. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import "UIView+Frame.h"
#import "KVCMutableArrayProxy.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) KVCMutableArrayProxy *circles;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Generate the random seed
    srand48(time(0));
    
    self.circles = [[KVCMutableArrayProxy alloc] init];
    [self.circles addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self startTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"count"]) {
        NSInteger count = [[change valueForKey:@"new"] integerValue];
        if (count >= 8) {
            if (self.timer.isValid) {
                [self stopTimer];
            }
        } else if (count <= 3) {
            [self startTimer];
        }
    }
}

- (void)circleAnimation{
    CircleView *c = [CircleView drawRandomCircle];
    [self.circles addObject:c];
    
    c.top = ScreenHeight;
    NSTimeInterval timeInterval = drand48() * 3 + 0.5;
    [UIView animateWithDuration:timeInterval delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        c.bottom = 0;
    } completion:^(BOOL finished) {
        [c removeFromSuperview];
        [self.circles removeObject:c];
    }];
    
    [self.view addSubview:c];
    
}

- (void)startTimer{
    
    NSTimeInterval timeInterval = drand48() * 3 + 0.5;
    
    self.timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(circleAnimation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}

@end
