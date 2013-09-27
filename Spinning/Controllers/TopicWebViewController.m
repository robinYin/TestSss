//
//  TopicWebViewController.m
//  Spinning
//
//  Created by Robin on 9/17/13.
//  Copyright (c) 2013 Robin. All rights reserved.
//

#import "TopicWebViewController.h"
#import "CommentViewController.h"
#import "UIAlertView+MKBlockAdditions.h"
#import "LoginViewController.h"
@interface TopicWebViewController ()

@end

@implementation TopicWebViewController

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
    [self configureOtherView];
	// Do any additional setup after loading the view.
}

- (void)configureOtherView
{
    
    [self.headerImageView setImage:[UIImage imageNamed:@"title_bght"]];
    [self.subleftBtn setBackgroundImage:[UIImage imageNamed:@"title_btn_comment_nomal.png"] forState:UIControlStateNormal];
    [self.subleftBtn setBackgroundImage:[UIImage imageNamed:@"title_btn_comment_pressed.png"] forState:UIControlStateHighlighted];
    [self.subleftBtn setBackgroundImage:[UIImage imageNamed:@"title_btn_comment_pressed.png"] forState:UIControlStateSelected];
}

- (void)onSubLeftBtn:(id)sender
{
    if (![RbUser sharedInstance].userid) {
        
        [UIAlertView alertViewWithTitle:@"您还没有登录!"
                                message:@"请先登录后，才能进行评论操作。"
                      cancelButtonTitle:@"取消"
                      otherButtonTitles:[NSArray arrayWithObjects:@"登录", nil]
                              onDismiss:^(int buttonIndex)
         {
             LoginViewController *viewController = [[LoginViewController new]autorelease];
             [self.navigationController pushViewController:viewController animated:YES];
         }
                               onCancel:^()
         {
         }
         ];
        return;
    }
    CommentViewController *viewController = [[CommentViewController new]autorelease];
    viewController.mid = self.mid;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
