//
//  KJDLoginViewController.h
//  Vegas
//
//  Created by DANNY WU on 11/21/14.
//  Copyright (c) 2014 Jan Roures Mintenig. All rights reserved.
//

#import "KJDLoginViewController.h"
#import "KJDChatRoomViewController.h"

@interface KJDLoginViewController ()

@property (strong, nonatomic) UILabel *enterLabel;
@property (strong, nonatomic) UITextField *chatCodeField;
@property (strong, nonatomic) UIButton *enterButton;
@property (strong, nonatomic) KJDChatRoomViewController *chatroom;

@end

@implementation KJDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewsAndConstraints];
    self.navigationController.navigationBarHidden = YES;
}

- (void)setupViewsAndConstraints{
    [self setupLabel];
    [self setupChatCodeField];
    [self setupEnterButton];
}

- (void)setupLabel{
    self.enterLabel = [[UILabel alloc] init];
    self.enterLabel.text = @"Enter Chat ID:";
//    self.enterLabel.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.enterLabel];
    self.enterLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *enterLabelX = [NSLayoutConstraint constraintWithItem:self.enterLabel
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0.0];
    
    NSLayoutConstraint *enterLabelTop = [NSLayoutConstraint constraintWithItem:self.enterLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:250.0];
    
    NSLayoutConstraint *enterLabelWidth = [NSLayoutConstraint constraintWithItem:self.enterLabel
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:0.33
                                                                        constant:0.0];
    
    NSLayoutConstraint *enterLabelHeight = [NSLayoutConstraint constraintWithItem:self.enterLabel
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:0.1
                                                                         constant:0.0];
    
    [self.view addConstraints:@[enterLabelX, enterLabelTop, enterLabelHeight, enterLabelWidth]];
}

- (void)setupChatCodeField
{
    self.chatCodeField = [[UITextField alloc] init];
    [self.view addSubview:self.chatCodeField];
    self.chatCodeField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.chatCodeField setBorderStyle:UITextBorderStyleLine];
    
    NSLayoutConstraint *chatCodeFieldX = [NSLayoutConstraint constraintWithItem:self.chatCodeField
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.enterLabel
                                                                      attribute:NSLayoutAttributeCenterX
                                                                     multiplier:1.0
                                                                       constant:0.0];
    
    NSLayoutConstraint *chatCodeFieldTop = [NSLayoutConstraint constraintWithItem:self.chatCodeField
                                                                        attribute:NSLayoutAttributeTop
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.enterLabel
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:10.0];
    
    NSLayoutConstraint *chatCodeFieldWidth = [NSLayoutConstraint constraintWithItem:self.chatCodeField
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.enterLabel
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:1.0
                                                                           constant:0.0];
    
    NSLayoutConstraint *chatCodeFieldHeight = [NSLayoutConstraint constraintWithItem:self.chatCodeField
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.enterLabel
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1.0
                                                                            constant:0.0];
    
    [self.view addConstraints:@[chatCodeFieldX, chatCodeFieldTop, chatCodeFieldWidth, chatCodeFieldHeight]];
}

- (void)setupEnterButton
{
    self.enterButton = [[UIButton alloc] init];
    [self.view addSubview:self.enterButton];
    [self.enterButton setTitle:@"Enter Chat" forState:UIControlStateNormal];
    self.enterButton.backgroundColor = [UIColor blackColor];
    [self.enterButton addTarget:self action:@selector(enterButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    self.enterButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *enterButtonX = [NSLayoutConstraint constraintWithItem:self.enterButton
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.chatCodeField
                                                                      attribute:NSLayoutAttributeCenterX
                                                                     multiplier:1.0
                                                                       constant:0.0];
    
    NSLayoutConstraint *enterButtonTop = [NSLayoutConstraint constraintWithItem:self.enterButton
                                                                        attribute:NSLayoutAttributeTop
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.chatCodeField
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:10.0];
    
    NSLayoutConstraint *enterButtonWidth = [NSLayoutConstraint constraintWithItem:self.enterButton
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.chatCodeField
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:1.0
                                                                           constant:0.0];
    
    NSLayoutConstraint *enterButtonHeight = [NSLayoutConstraint constraintWithItem:self.enterButton
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.chatCodeField
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1.0
                                                                            constant:0.0];
    
    [self.view addConstraints:@[enterButtonX, enterButtonTop, enterButtonWidth, enterButtonHeight]];
}

- (void)enterButtonTapped
{
    KJDChatRoomViewController *destinationViewController = [[KJDChatRoomViewController alloc] init];
    destinationViewController.firebaseURL = self.chatCodeField.text;
    [self.navigationController pushViewController:destinationViewController animated:YES];
}

@end