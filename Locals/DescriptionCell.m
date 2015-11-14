//
//  DescriptionCell.m
//  Locals
//
//  Created by Alexander on 10/28/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "DescriptionCell.h"

@implementation DescriptionCell

- (void)awakeFromNib {
    // Initialization code
    
    self.descriptionTextField.delegate = self;
}

-(void)textViewDidChange:(UITextView *)textView {
    [self.delegate textViewChanged:self];
}

-(BOOL)textViewShouldReturn:(UITextField *)textField {
    [self.descriptionTextField resignFirstResponder];
    
    return YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
