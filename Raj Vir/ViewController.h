//
//  ViewController.h
//  Raj Vir
//
//  Created by Raj Vir on 4/14/14.
//  Copyright (c) 2014 Raj Vir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPopoverControllerDelegate>

@property (strong, nonatomic) UIImageView *profile;

@property (strong, nonatomic) UILabel *header;
@property (strong, nonatomic) UILabel *intro;

@property (strong, nonatomic) NSMutableArray *buttons;

@property (strong, nonatomic) NSArray *data;

@property (strong, nonatomic) UIView *popoverView;
@property (strong, nonatomic) UILabel *popoverTitle;
@property (strong, nonatomic) UILabel *popoverDescription;
@property (strong, nonatomic) UIButton *popoverButton;
@property (strong, nonatomic) UIView *backgroundView;

@property (strong, nonatomic) UIDynamicAnimator *animator;

@end
