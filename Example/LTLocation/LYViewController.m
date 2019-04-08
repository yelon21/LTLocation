//
//  LYViewController.m
//  LTLocation
//
//  Created by yelon21 on 09/12/2016.
//  Copyright (c) 2016 yelon21. All rights reserved.
//

#import "LYViewController.h"
#import "LTLocation.h"
@interface LYViewController ()<UIAlertViewDelegate>

@end

@implementation LYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [[LTLocation sharedLocation] setLocationDisableBlock:^(){
    
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请开启您的定位" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alert show];
    }];

}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{

    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"确定"]) {
        
        NSURL * url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
        
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"LTLocation=%@",[[LTLocation sharedLocation] debugDescription]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
