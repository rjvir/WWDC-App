//
//  ViewController.m
//  Raj Vir
//
//  Created by Raj Vir on 4/14/14.
//  Copyright (c) 2014 Raj Vir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self initContent];
    [self.view setBackgroundColor:BACKGROUND_COLOR_IMAGE];
    
    self.profile = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 130, 160)];
    [self.profile setImage:[UIImage imageNamed:@"profile.png"]];
    [self.profile setContentMode:UIViewContentModeScaleAspectFill];
    [self.profile setAlpha:0.0];
    [self.view addSubview:self.profile];
    
    self.header = [[UILabel alloc] initWithFrame:CGRectMake(140, 20, 320-140, 44)];
    [self.header setText:@"Hey, I'm Raj Vir"];
    [self.header setFont:[UIFont fontWithName:PRIMARY_FONT size:24]];
    [self.header setTextColor:[UIColor whiteColor]];
    [self.header setAlpha:0.0];
    [self.view addSubview:self.header];
    
    self.intro = [[UILabel alloc] initWithFrame:CGRectMake(140, 20+44+10, 320-140, 130)];
    [self.intro setText:@"I’m a developer, designer, and student at the University of Michigan. \n \nTap icons to explore some things I’ve done"];
    [self.intro setFont:[UIFont fontWithName:PRIMARY_FONT size:15]];
    [self.intro setTextColor:[UIColor whiteColor]];
    [self.intro setNumberOfLines:0];
    [self.intro sizeToFit];
    [self.intro setAlpha:0.0];
    [self.view addSubview:self.intro];
    
    self.buttons = [[NSMutableArray alloc] init];
    
    int i = 0;
    int width, height, margin;
    if(kHeight > 480){
        width = 90;
        height = 90;
        margin = 30;
    } else {
        width = 85;
        height = 85;
        margin = 8;
    }
    int top = kHeight - height*3 - margin*3 - 10;
    for(NSDictionary *obj in self.data){
        ;
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((320/2 - width)/2 + 160*(i%2), (i/2)*(margin+height)+top, width, height)];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((320.0f-2*width)/3 + (width+(320.0f-2*width)/3)*(i%2), (i/2)*(margin+height)+top, width, height)];
        [button setBackgroundImage:[UIImage imageNamed:obj[@"icon"]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(showPopover:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i];
        [button setTitle:obj[@"title"] forState:UIControlStateNormal];
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        [button.titleLabel setFont:[UIFont fontWithName:PRIMARY_FONT size:12]];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 0.0f, -8.0f, 0.0f)];
        [button setAlpha:0.0];
        [self.buttons addObject:button];
        [self.view addSubview:button];
        i++;
    }
    
    self.popoverView = [[UIView alloc] initWithFrame:CGRectMake(30, -500, 320-30*2, kHeight-110*2)];
    [self.popoverView setBackgroundColor:[UIColor whiteColor]];
    self.popoverView.layer.cornerRadius = 8;
    [self.popoverView setClipsToBounds:YES];

    self.popoverTitle = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 320-30*4, 30)];
    [self.popoverTitle setTextAlignment:NSTextAlignmentCenter];
    [self.popoverTitle setFont:[UIFont fontWithName:PRIMARY_FONT size:24]];
    [self.popoverView addSubview:self.popoverTitle];
    
    self.popoverDescription = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 320-30*2-20*2, 200)];
    [self.popoverDescription setFont:[UIFont fontWithName:PRIMARY_FONT size:14]];
    [self.popoverView addSubview:self.popoverDescription];
    //
    self.popoverButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 568-110*2-60, 320-30*2, 60)];
    [self.popoverButton.titleLabel setFont:[UIFont fontWithName:PRIMARY_FONT size:18]];
    [self.popoverButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.popoverButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.popoverButton setBackgroundColor:BACKGROUND_COLOR_IMAGE];
    [self.popoverView addSubview:self.popoverButton];
    
    [self.view addSubview:self.popoverView];
    
    self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, kHeight)];
    [self.backgroundView setBackgroundColor:[UIColor blackColor]];
    [self.backgroundView setAlpha:0.0];
    UITapGestureRecognizer *backgroundTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closePopover)];
    [self.backgroundView addGestureRecognizer:backgroundTap];
    [self.view addSubview:self.backgroundView];
    
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(260-30, 10, 20, 20)];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"cross.png"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closePopover) forControlEvents:UIControlEventTouchUpInside];
    [self.popoverView addSubview:closeButton];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    NSMutableArray *fadeInObjects = [[NSMutableArray alloc] initWithArray:@[self.profile, self.header, self.intro]];
    for(UIButton *button in self.buttons){
        [fadeInObjects addObject:button];
    }
    
    int i = 0;
    for(UIView *view in fadeInObjects){
        [view setTransform:CGAffineTransformMakeScale(1.5, 1.5)];
        [UIView animateWithDuration:0.3 delay:.15*i options:0 animations:^{
            [view setAlpha:1.0];
            [view setTransform:CGAffineTransformIdentity];
        } completion:^(BOOL finished) {
            //
        }];
        i++;
    }
    
}

- (void)showPopover:(UIButton *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.backgroundView setAlpha:0.7];
    }];
    
    int index = [sender tag];
    [self.popoverTitle setText:self.data[index][@"title"]];
    [self.popoverDescription setText:self.data[index][@"description"]];
    [self.popoverDescription setNumberOfLines:0];
    [self.popoverDescription setFrame:CGRectMake(20, 80, 320-30*2-20*2, 200)];
    [self.popoverDescription sizeToFit];
    
    [self.popoverButton setTitle:[NSString stringWithFormat:@"%@", self.data[index][@"link-text"] ] forState:UIControlStateNormal];
    [self.popoverButton setTag:index];
    
    [self.animator removeAllBehaviors];
    [self.view bringSubviewToFront:self.popoverView];
    [self.popoverView setFrame:CGRectMake(30, -500, 320-30*2, 568-110*2)];
    [self.popoverView setAlpha:1.0];
    CGPoint point1 = CGPointMake(160.0, kHeight/2);
    UISnapBehavior *snap;
    snap = [[UISnapBehavior alloc] initWithItem:self.popoverView snapToPoint:point1];
    [snap setDamping:1.0];
    [self.animator addBehavior:snap];
}

- (void) closePopover {
    [self.animator removeAllBehaviors];
    CGPoint point1 = CGPointMake(160.0, 560/2*4);
    UISnapBehavior *snap;
    snap = [[UISnapBehavior alloc] initWithItem:self.popoverView snapToPoint:point1];
    [snap setDamping:1.0];
    [self.animator addBehavior:snap];

    [UIView animateWithDuration:0.75 animations:^{
        [self.backgroundView setAlpha:0.0];
    }];

//    [UIView animateWithDuration:0.5 animations:^{
//        [self.popoverView setAlpha:0.0];
//    } completion:^(BOOL finished) {
//    }];

}

- (void)buttonPressed:(UIButton *)sender {
    int index = [sender tag];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.data[index][@"link"]]];
}
    
- (void) initContent {
    self.data = @[
                  @{@"title": @"MHacks App",
                    @"description": @"I built the app for MHacks, the largest hackathon in the world. \n\nThe MHacks app allows participants to view announcements, contact mentors, and chat with other hackers. \n\nThe app's design and functionality has since been copied by many other collegiate hackathons.",
                    @"icon": @"mhacks.png",
                    @"link": @"https://itunes.apple.com/us/app/mhacks/id790082591",
                    @"link-text": @"View on App Store"},
                  
                  @{@"title": @"Snapchat Hack",
                    @"description": @"By playing around with the original Snapchat app, I figured out how to take a screenshot without being detected. \n\nThis method has been written about on Techrunch, the Huffington Post, and countless other publications.",
                    @"icon": @"snapchat.png",
                    @"link": @"http://techcrunch.com/2013/01/22/not-so-ephemeral-messaging-new-snapchat-hack-lets-users-save-photos-forever/",
                    @"link-text": @"Read Techcrunch Feature"},

                  @{@"title": @"Nowcation",
                    @"description": @"I made Nowcation - a website that finds the best upcoming flight deals from your location so you can take a vacation, NOW! \n\nIt receieved over 100k users in it's first month and was featured on Lifehacker, Gizmodo, and Forbes.",
                    @"icon": @"nowcation.png",
                    @"link": @"http://lifehacker.com/5981405/nowcation-shows-you-cheap-flights-departing-within-a-month",
                    @"link-text": @"Read Lifehacker Feature"},
                  
                  @{@"title": @"DiggInTheFuture",
                    @"description": @"I created an algorithm to predict future popular stories on the once popular news aggregator, Digg. \n\nThe algorithm behind DiggInTheFuture was significantly accurate and was written about in GigaOm.",
                    @"icon": @"digginthefuture.png",
                    @"link": @"http://gigaom.com/2010/08/24/hey-digg-this-17-year-old-knows-what-you-are-thinking/",
                    @"link-text": @"Read Article"},

                  @{@"title": @"HackNY Fellow",
                    @"description": @"The HackNY fellowship selects a small number of students to live in New York over a Summer and work at a startup. \n\nI was selected as a fellow and worked at Plated as a Software Engineering Intern.",
                    @"icon": @"hackny.png",
                    @"link": @"http://www.plated.com/",
                    @"link-text": @"Visit Plated.com"},

                  @{@"title": @"UCLA Research",
                    @"description": @"While in high school, I worked at Prof. John Villasenor's Image Communication Lab at UCLA. \n\nThe focus of the research was LTE, and I built an LTE Simulator using Matlab and C++.",
                    @"icon": @"ucla.png",
                    @"link": @"http://johnvillasenor.com/",
                    @"link-text": @"Visit Website"}
                  ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
