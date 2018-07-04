//
//  TweetCell.m
//  twitter
//
//  Created by Norette Ingabire on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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

@end
