//
//  PinchDemoViewController.m
//  PinchDemo
//
//  Created by Adam Loving on 1/5/14.
//  Copyright (c) 2014 Adam Loving. All rights reserved.
//

#import "PinchDemoViewController.h"

@interface PinchDemoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PinchDemoViewController


CGFloat _lastScale = 1.0;
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    if ([sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    CGFloat scale = 1.0 - (_lastScale - [sender scale]);
    _lastScale = [sender scale];
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    [self.imageView setTransform:newTransform];
    NSLog(@"center: %@", NSStringFromCGPoint(self.imageView.center));
}

@end
