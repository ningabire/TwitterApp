//
//  TimelineViewController.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineViewController : UIViewController <UIScrollViewDelegate>

@property(nonatomic, strong) NSMutableArray *tweets;
//@property(strong, nonatomic) NSMutableArray *tweetsArray;

- (IBAction)logoutButton:(id)sender;
- (IBAction)editButton:(id)sender;

- (void) scrollViewDidScroll:(UIScrollView *)scrollView;
- (void) loadMoreData;

@end
