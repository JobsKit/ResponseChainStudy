//
//  ViewController.m
//  A
//
//  Created by Jobs on 2021/4/19.
//

#import "ViewController.h"

#import "SSView.h"
#import "DDView.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property(nonatomic,strong)SSView *sView;
@property(nonatomic,strong)DDView *dView;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sView = SSView.new;
    [self.view addSubview:self.sView];
    
    self.dView = DDView.new;
    [self.view addSubview:self.dView];
    
    self.tableView.alpha = 1;
    self.collectionView.alpha = 1;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if (CGRectContainsPoint(self.view.bounds, point)) {
//        return self.view;
//    }else{
//        return nil;
//    }
//}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"");
//}
//
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if (CGRectContainsPoint(self.view.bounds, point)) {
        return YES;
    }else{
        return NO;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"");
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell"
                                                                         forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = UIColor.brownColor;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = UIView.new;
        _tableView.frame = CGRectMake(0, 250, 300, 100);
        [self.view addSubview:_tableView];
    }return _tableView;
}

-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:self.layout];
        _collectionView.backgroundColor = UIColor.yellowColor;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:CollectionViewCell.class forCellWithReuseIdentifier:@"CollectionViewCell"];
//        [_collectionView RegisterClass];
        [self.view addSubview:_collectionView];
        _collectionView.frame = CGRectMake(0, 370, 300, 100);
    }return _collectionView;
}


@end
