//
//  ViewController.m
//  DevelopmentDemoTest
//
//  Created by 段亚辉 on 15-5-13.
//  Copyright (c) 2015年 亚辉. All rights reserved.
//

#import "ViewController.h"
#import "DYWebViewController.h"
#import "DYTableViewController.h"
#import "CustomNavController.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray * uikitNameArray;
@property (nonatomic,strong) NSArray * headerArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Learning UIKit Demo";
    
    // Do any additional setup after loading the view, typically from a nib.
    // 视图 视图控制器 手势
    _headerArray=@[@"View",@"ViewController",@"Recognizer"];
    _uikitNameArray=@[
                      @[@"UIViewController",
                        @"UINavigationController",
                        @"UITableViewController",
                        @"UITabbarController",
                        @"UIPageViewController",
                        @"UICollectionViewController",
                        @"GLKViewController",
                        @"AVPlayerViewController"],
                       @[@"UILabel",
                        @"UIButton",
                        @"UISegmentedControl",
                        @"UITextField",
                        @"UISlider",
                        @"UISwitch",
                        @"UIActivityIndicatorView",
                        @"UIProgressView",
                        @"UIPageControl",
                        @"UIStepper",
                        @"UITabeleView",
                        @"UITabeleViewCell",
                        @"UIImageView",
                        @"UITextView",
                        @"UIScrollView",
                        @"UIDatePicker",
                        @"UIPickerView",
                        @"UIWebView",
                        @"MKMapView",
                        @"GLKView",
                        @"ADBannerView",
                        @"SCNView"
                        ],
                      @[@"UITapGestureRecognizer",
                        @"UIPinchGestureRecognizer",
                        @"UIRotationGestureRecognizer",
                        @"UISwipeGestureRecognizer",
                        @"UIPanGestureRecognizer",
                        @"UIScreenEdgePanGestureRecognizer",
                        @"UILongPressGestureRecognizer"
                        ]
                      ];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return _uikitNameArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_uikitNameArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseIdentifierString=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentifierString];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifierString];
    }
    NSArray * titleArray=_uikitNameArray[indexPath.section];
    cell.textLabel.text=titleArray[indexPath.row];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _headerArray[section];
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * titleArray=_uikitNameArray[indexPath.section];
    NSString * title=titleArray[indexPath.row];
    
    if ([title isEqualToString:@"UIWebView"]) {
        DYWebViewController *webView=[[DYWebViewController alloc] initWithNibName:@"DYWebViewController" bundle:nil];
        webView.title=title;
        [self.navigationController pushViewController:webView animated:YES];
    }
    if ([title isEqualToString:@"UITabeleView"]) {
        DYTableViewController *webView=[[DYTableViewController alloc] initWithNibName:@"DYTableViewController" bundle:nil];
        webView.title=title;
        [self.navigationController pushViewController:webView animated:YES];
    }
    if ([title isEqualToString:@"UINavigationController"]||[title isEqualToString:@"UIViewController"]) {
        CustomNavController *webView=[[CustomNavController alloc] init];
        webView.title=title;
        [self.navigationController pushViewController:webView animated:YES];
    }
}

@end
