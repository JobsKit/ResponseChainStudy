//
//  CollectionViewCell.m
//  A
//
//  Created by Jobs on 2021/4/30.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.magentaColor;
        
        UIButton *btn = UIButton.new;
        [btn setTitle:@"哈" forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        btn.frame = CGRectMake(0, 20, 50, 20);
        [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
        
    }return self;
}
//
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if (CGRectContainsPoint(self.bounds, point)) {
//        return self;
//    }else{
//        return nil;
//    }
//}
////
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"");
//}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if (CGRectContainsPoint(self.bounds, point)) {
        return YES;
    }else{
        return NO;
    }
}

-(void)test{
    NSLog(@"");
}

@end
