//
//  TableViewCell.m
//  A
//
//  Created by Jobs on 2021/4/30.
//

#import "TableViewCell.h"

@implementation TableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:@"TableViewCell"];
        cell.backgroundColor = UIColor.cyanColor;
//        [UIView cornerCutToCircleWithView:cell andCornerRadius:6];
    }return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        
        UIButton *btn = UIButton.new;
        [btn setTitle:@"哈" forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        btn.frame = CGRectMake(30, 20, 50, 20);
        [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
        
    }return self;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if (CGRectContainsPoint(self.bounds, point)) {
//        return self;
//    }else{
//        return nil;
//    }
//}
//
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
