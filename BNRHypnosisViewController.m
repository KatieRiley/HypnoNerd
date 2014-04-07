//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Katie Hoskins on 3/20/14.
//  Copyright (c) 2014 Katie Hoskins. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

- (void)loadView
{
    //create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backroundView = [[BNRHypnosisView alloc]initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    //setting the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hyppnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    
    [backroundView addSubview:textField];
    
    //set it as *the* view of this view controller
    self.view = backroundView;
    
}

-(BOOL) textFieldShouldReturn:(UITextField *) textField
{
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //set the tav var items title
        self.tabBarItem.title = @"Hypnotize";
        //create a UIImage form a file
        
        //this will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //put that image on the tab bar item
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view");
}

-(void)drawHypnoticMessage: (NSString *) message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        //configue the labels collors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        //this method resizes the labe, which will be relative
        //to the text that it is displaying
        [messageLabel sizeToFit];
        
        //get a random x value that fits within the hypnosis views width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        //get a random y value that fits within the hypnosis view's height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        //update that labels frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        //add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

@end
