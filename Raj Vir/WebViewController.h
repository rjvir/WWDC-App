//
//  WebViewController.h
//  Raj Vir
//
//  Created by Raj Vir on 4/14/14.
//  Copyright (c) 2014 Raj Vir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) NSString *pageTitle;
@property (strong, nonatomic) NSString *url;
@end
