//
//  WebViewController.m
//  Raj Vir
//
//  Created by Raj Vir on 4/14/14.
//  Copyright (c) 2014 Raj Vir. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *navbar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [navbar setBackgroundColor:BACKGROUND_COLOR_IMAGE];
    UIButton *close = [[UIButton alloc] initWithFrame:CGRectMake(6, 6, 40, 50)];
    [close setTitle:@"Close" forState:UIControlStateNormal];
    [close.titleLabel setFont:[UIFont fontWithName:PRIMARY_FONT size:16]];
    [close.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [close addTarget:self action:@selector(closeWebView) forControlEvents:UIControlEventTouchUpInside];
    [navbar addSubview:close];
    //    navbar.navigationItem.backBarButtonItem = ;
    //do something like background color, title, etc you self
    [self.view addSubview:navbar];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.frame = CGRectMake(320/2 - 30/2, kHeight/2 - 30/2, 30, 30);
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    
    NSString *urlAddress = self.url;
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
    self.webView.delegate = self;
    [self.webView setBackgroundColor:[UIColor clearColor]];
    [self.webView setOpaque:NO];
    
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(50.0f, 0, 0, 0);

	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view.
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
}

- (void)closeWebView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
