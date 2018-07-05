//
//  ComposeViewController.h
//  twitter
//
//  Created by Norette Ingabire on 7/4/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@protocol composeViewControllerDelegate
- (void) didTweet:(Tweet *) tweet;
@end

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *composeText;
@property (nonatomic, weak) id<composeViewControllerDelegate> delegate;

- (IBAction)closeButton:(id)sender;
- (IBAction)tweetButton:(id)sender;

@end

