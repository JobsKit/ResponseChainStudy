//
//  SSView.m
//  A
//
//  Created by Jobs on 2021/4/30.
//

#import "SSView.h"

@implementation SSView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(100, 100, 100, 100);
        self.backgroundColor = UIColor.redColor;
    }return self;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if (CGRectContainsPoint(self.bounds, point)) {
//        return self;
//    }else{
//        return nil;
//    }
//}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"");
//}
////
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    if (CGRectContainsPoint(self.bounds, point)) {
//        return YES;
//    }else{
//        return NO;
//    }
//}

@end
