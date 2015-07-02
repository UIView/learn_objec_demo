//
//  CustomNavController.m
//  DevelopmentDemoTest
//
//  Created by Yahui Duan on 15/6/29.
//  Copyright (c) 2015年 亚辉. All rights reserved.
//

#import "CustomNavController.h"
#import "config.h"

@implementation CustomNavController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl * segControl = [[UISegmentedControl alloc] initWithItems:@[@"CustomNavLeft",@"CustomNavTitle",@"CustomNavRight"]];
    segControl.frame = CGRectMake(20, 80, self.view.frame.size.width-40, 40);
    [segControl addTarget:self action:@selector(segmentedControlItemAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segControl];
    
    UISegmentedControl * viewSegmented = [[UISegmentedControl alloc] initWithItems:@[@"viewTransformationStart",@"viewTransformationEnd"]];
    viewSegmented.frame = CGRectMake(20, segControl.frame.origin.y+segControl.frame.size.height+20, self.view.frame.size.width-40, 40);
    [viewSegmented addTarget:self action:@selector(viewSegmentedItemAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:viewSegmented];
}
#pragma mark CustomNavigationBar
-(void)CustomNavigationItemLeftBarButtonItem{
    UIButton  *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 5, 45, 30);
    leftButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    leftButton.layer.borderWidth = 1.0;
    
    [leftButton setImage:[UIImage imageNamed:@"Right_lateralSlip_down"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"Right_lateralSlip"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(clickTopBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    if (IOS7) {
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        flexibleItem.width=-10;
        [self.navigationItem setLeftBarButtonItems:@[flexibleItem,leftItem]];
    }else{
        [self.navigationItem setLeftBarButtonItems:@[leftItem]];
    }
}
-(void)CustomNavigationItemRightBarButtonItem{
    UIButton  *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 5, 45, 30);
    rightButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    rightButton.layer.borderWidth = 1.0;
    
    [rightButton setImage:[UIImage imageNamed:@"Right_lateralSlip_down"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Right_lateralSlip"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(clickTopBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    if (IOS7) {
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        flexibleItem.width=-10;
        [self.navigationItem setRightBarButtonItems:@[flexibleItem,rightItem]];
    }else{
        [self.navigationItem setRightBarButtonItems:@[rightItem]];
    }
    
}
-(void)CustomNavigationTitleView{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, self.view.frame.size.width-120, 30)];
    titleLabel.text = @"Test CustomNavigationTitle ";
    self.navigationItem.titleView = titleLabel;
}

- (void)clickTopBtnAction:(id)sender{
    NSLog(@" button = %@",sender);
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark SegmentedControlAction
-(void)segmentedControlItemAction:(UISegmentedControl *)sender{
    NSInteger Index = sender.selectedSegmentIndex;
    NSLog(@"selectedSegmentIndex = %@",@(Index));
    
    switch (Index) {
        case 0:
            [self CustomNavigationItemLeftBarButtonItem];
            break;
        case 1:
            [self CustomNavigationTitleView];
            break;
        case 2:
            [self CustomNavigationItemRightBarButtonItem];
            break;
            
        default:
            break;
    }
}

-(void)viewSegmentedItemAction:(UISegmentedControl *)sender{
    NSInteger Index = sender.selectedSegmentIndex;
    NSLog(@"selectedSegmentIndex = %@",@(Index));
    
    switch (Index) {
        case 0:
            [self viewTransformationsAnimationrt];
            break;
        case 1:
            [self viewTransformationsEndAnimation];
            break;
        case 2:
//            [self CustomNavigationItemRightBarButtonItem];
            break;
            
        default:
            break;
    }
}
#pragma mark UIView Test

- (void)viewTransformationsAnimationrt{
//    NSArray * images = @[[UIImage imageNamed:@"view_yuanIcon"],[UIImage imageNamed:@"view_yuanRightIcon"],[UIImage imageNamed:@"view_yuanDownIcon"],[UIImage imageNamed:@"view_yuanLeftIcon"]];
    NSArray * images = @[[UIImage imageNamed:@"view_yuanIcon"],[UIImage imageNamed:@"view_yuanLeftIcon"]];
    UIImageView *viewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 100, 100)];
    viewIcon.tag = 1000;
    [self.view addSubview:viewIcon];
    viewIcon.animationImages = images;
    viewIcon.animationDuration =0.3;
    viewIcon.animationRepeatCount = 0;
    [viewIcon startAnimating];
    CGFloat label_x = (viewIcon.frame.size.width-50)/2 + viewIcon.frame.origin.x+5;
    CGFloat label_y = (viewIcon.frame.size.height-20)/2 + viewIcon.frame.origin.y;

    UILabel * textLabel =[[UILabel alloc] initWithFrame:CGRectMake(label_x, label_y, 50, 20)];
    textLabel.text = @"易问医";
    textLabel.font = [UIFont systemFontOfSize:14.0];
    textLabel.tag = 1001;
    [self.view addSubview: textLabel];
    
}
- (void)viewTransformationsEndAnimation{
    UIImageView *viewIcon = (UIImageView *)[self.view viewWithTag:1000];
    [viewIcon stopAnimating];
    [[self.view viewWithTag:1001] removeFromSuperview];
    [viewIcon removeFromSuperview];
//    NSLog(@"EndAnimation subviews = %@",self.view.subviews);
}
@end
