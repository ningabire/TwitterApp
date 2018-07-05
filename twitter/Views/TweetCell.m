//
//  TweetCell.m
//  twitter
//
//  Created by Norette Ingabire on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)didTapLike:(id)sender {
    
    //Update the local tweet model
    if (!self.tweet.favorited) {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        NSLog(@"Liked tweet");
        
       [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    
    else {
       //Do nothing
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        NSLog(@"Unliked tweet");
        
        [[APIManager shared] unFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
        
    }
    
    [self refreshData];
}

- (IBAction)didTapRetweet:(id)sender {
    
    if (!self.tweet.retweeted) {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    
    else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
    }
    
    [self refreshData];
}

-(void) configureTweetCell:(Tweet *)tweet{
    self.tweet = tweet;
    self.nameLabel.text = self.tweet.user.name;
    self.tweetLabel.text = self.tweet.text;
    self.dateLabel.text = self.tweet.createdAtString;
    NSString *likeCount= [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.replyCountLabel.text = likeCount;
    self.profileImage.image = nil;
    [self.profileImage setImageWithURL:self.tweet.user.profilePicture];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) refreshData {
    NSString *numberOfLikes = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.likeCountLabel.text = numberOfLikes;
    
    NSString *numberOfRetweets = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.retweetCountLabel.text = numberOfRetweets;
}

@end
