//
//  User.m
//  twitter
//
//  Created by Norette Ingabire on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        NSString *pic = dictionary[@"profile_image_url_https"];
        NSURL *url = [NSURL URLWithString:pic];
        self.profilePicture = url;
    }
    return self;
}

@end
