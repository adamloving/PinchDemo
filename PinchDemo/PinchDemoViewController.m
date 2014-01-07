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
    CATransform3D newTransform = CATransform3DScale(self.imageView.layer.transform, scale, scale, 1);
    self.imageView.layer.transform = newTransform;
    NSLog(@"center: %@", NSStringFromCGPoint(self.imageView.center));
}

@end
