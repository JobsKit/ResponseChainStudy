#  响应链相关研究

【测试前置】
VC上加盖view1、view1上加盖view2；或者VC上加盖view1 和 view2，但是view2表现盖在view1。不影响响应链
【相关名词解释】：
最顶层View：手机屏幕上的view，距离用户最近的那个view；

【相关继承链顺序】：
UIViewController : UIResponder ：NSObject
UIView : UIResponder：NSObject
UIButton : UIControl : UIView : UIResponder：NSObject

【初步结论】
UIResponder 是 iOS中用于处理用户事件的API，可以处理触摸事件、按压事件(3D touch)、远程控制事件、硬件运动事件
UIViewController 和 UIView 同质
UIButton是特殊化的UIView，关注UIControl相关子类

/// 返回point和event对应的视图；简称hitTest方法【过程值】
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;

/// pointInside方法返回point和event是否在自己当前视图上；简称pointInside方法【过程值】
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;

/// 简称touchesBegan方法【结论值】
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

* 以上两个方法，UIView都提供了默认实现；
* 在UIView具体的子类重写这两个方法，意味着截断系统默认配置，优先实现自定义配置；

1、子类只覆写hitTest，最外层的VC只有touchesBegan接受响应；
2、点击手机屏幕，无论在不在目标测试区内部，均先响应【最顶层View】内部方法，在依次的响应父级View；
3、hitTest方法执行的优先级 ＞ pointInside方法执行的优先级。
言下之意就是hitTest方法 与 pointInside方法不能共存，一旦共存优先执行hitTest方法，pointInside方法不执行

    3.1、pointInside方法返回NO -> 与touchesBegan方法不能共存
    3.2、pointInside方法返回YES -> 先pointInside方法再touchesBegan，因为touchesBegan方法是结论性的
4、touchesBegan方法是hitTest的结论化的具体体现。所以此方法能再无其他干扰项的情况下，精准定位具体响应的View；
5、在VC里面覆写pointInside方法无响应；
6、遍历视图的时候，有以下特征的将会被忽略不作处理：

    视图的hidden等于YES；
    视图的alpha小于等于0.01；
    视图的userInteractionEnabled为NO；
    但是视图的背景颜色是clearColor，并不在忽略范围内
7、-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath，简称didSelectRowAtIndexPath协议方法
    
    7.1、在UITableViewCell及其子类里面：
    如果覆写hitTest方法 和 touchesBegan方法 ，那么外界不响应didSelectRowAtIndexPath协议方法
    如果覆写pointInside方法，外界可以响应didSelectRowAtIndexPath协议方法
    
    7.2、在UITableViewCell及其子类里面：
    加一个Button，并实现触发方法，点击Button
    7.2.1、只覆写hitTest方法，则不响应Button触发方法，但是外界响应didSelectRowAtIndexPath方法
    7.2.2、覆写hitTest方法 和 touchesBegan方法，则对内不响应touchesBegan方法，对外不响应didSelectRowAtIndexPath方法

8、- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath ，简称didSelectItemAtIndexPath协议方法

    8.1、在UICollectionViewCell及其子类里面：
    如果覆写hitTest方法 和 touchesBegan方法 ，那么外界不响应didSelectItemAtIndexPath协议方法
    如果覆写pointInside方法，外界可以响应didSelectItemAtIndexPath协议方法

    8.2、在UICollectionViewCell及其子类里面：
    加一个Button，并实现触发方法，点击Button
    8.2.1、只覆写hitTest方法，则不响应Button触发方法，但是外界响应didSelectItemAtIndexPath方法
    8.2.2、覆写hitTest方法 和 touchesBegan方法，则对内不响应touchesBegan方法，对外不响应didSelectItemAtIndexPath方法
    8.2.3、只覆写pointInside方法，对内则只响应Button触发方法，对外不响应didSelectItemAtIndexPath方法

【阶段结论】UITableViewCell 和 UICollectionViewCell的响应处理一致

以上没有考虑手势的作用
