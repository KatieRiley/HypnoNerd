//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Katie Hoskins on 3/20/14.
//  Copyright (c) 2014 Katie Hoskins. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()

@property(nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end


@implementation BNRReminderViewController

-(IBAction)addReminder :(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize Me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //get the tab bar item
        UITabBarItem *tbi = self.tabBarItem;
        
        //give it a label
        tbi.title = @"Reminder";
        
        //give it an image
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
