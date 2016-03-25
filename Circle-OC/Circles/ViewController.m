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

static NSInteger maximum = 10;
static NSInteger minimum = 6;

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnteredBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self startTimer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"count"]) {
        NSInteger count = [[change valueForKey:@"new"] integerValue];
        if (count >= maximum) {
            if (self.timer.isValid) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self stopTimer];
                });
            }
        } else if (count <= minimum) {
            if (!self.timer.isValid) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self startTimer];
                });
            }
        }
    }
}

- (void)appDidEnterForeground:(NSNotification *)notif{
    [self startTimer];
//    NSLog(@"%s",__func__);
}

- (void)appDidEnteredBackground:(NSNotification *)notif{
    [self.timer invalidate];
    self.timer = nil;
    
//    NSLog(@"%s",__func__);
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
    
    [self stopTimer];
    [self startTimer];
}

- (void)startTimer{
    
    NSTimeInterval timeInterval = drand48() / 5 - 0.5;
    
    self.timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(circleAnimation) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (KVCMutableArrayProxy *)circles{
    if (!_circles) {
        _circles = [[KVCMutableArrayProxy alloc] init];
        [_circles addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    
    return _circles;
}

@end
