//
//  DYTableViewCell.m
//  DevelopmentDemoTest
//
//  Created by i-HygeiaiMac on 15/5/22.
//  Copyright (c) 2015年 亚辉. All rights reserved.
//

#import "DYTableViewCell.h"

@implementation DYTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor=[UIColor clearColor];
    self.backgroundColor=[UIColor clearColor];
   
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>8.0) {
        // This only happens on iOS 8.3,
        self.contentView.preservesSuperviewLayoutMargins=NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.iconTextLabel.layer.cornerRadius=self.iconTextLabel.frame.size.height/2;
    self.iconTextLabel.layer.masksToBounds=YES;
//    NSLog(@"cell layoutSubviews = %@",[self.contentView constraints]);
}
@end
