//
//  DYWebViewController.m
//  DevelopmentDemoTest
//
//  Created by 段亚辉 on 15-5-13.
//  Copyright (c) 2015年 亚辉. All rights reserved.
//

#import "DYWebViewController.h"

@interface DYWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURLRequest *WebRequest=[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://article.askdr.cn/a/3655?token="]];
    [_webView loadRequest:WebRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setuser
{
    
}
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"1 shouldStartLoadWithRequest =%@",[request.URL absoluteString]);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"2 webViewDidStartLoad ");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"3 webViewDidFinishLoad");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"error =%@",error);
}

@end
