//
//  ComposeViewController.m
//  twitter
//
//  Created by Norette Ingabire on 7/4/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "User.h"
#import "Tweet.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)tweetButton:(id)sender {
    
       [[APIManager shared] postStatusWithText:self.composeText.text completion:^(Tweet * tweet, NSError *error) {
           if (error) {
               NSLog(@"failed to post tweet : %@", error.localizedDescription);
           }
           
           else {
               NSLog(@"successfully posted tweet");
               [self.delegate didTweet:tweet];
               [self dismissViewControllerAnimated:true completion:nil];
           }
       }];
    }
@end
