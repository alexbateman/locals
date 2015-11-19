//
//  PhotoCell.m
//  Locals
//
//  Created by Alexander on 10/28/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "PhotoCell.h"
#import "QuartzCore/QuartzCore.h"

@implementation PhotoCell

- (void)awakeFromNib {
    // Initialization code
//    self.photoButton.frame = CGRectMake(0,0,100,100);
//    self.photoButton.clipsToBounds = YES;
//    self.photoButton.layer.cornerRadius = 100/2.0f;
//    self.photoButton.layer.borderColor=[UIColor blackColor].CGColor;
//    self.photoButton.layer.borderWidth=2.0f;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)PhotoButtonTapped:(id)sender {
    [self.delegate photoCellButtonTapped];
}


@end
