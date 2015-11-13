//
//  NameCell.m
//  Locals
//
//  Created by Alexander on 10/28/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "NameCell.h"



@implementation NameCell

- (void)awakeFromNib {
    // Initialization code
    
    self.nameTextField.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.nameTextField resignFirstResponder];
    
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
