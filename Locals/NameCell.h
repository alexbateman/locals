//
//  NameCell.h
//  Locals
//
//  Created by Alexander on 10/28/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol nameDelegate;

@interface NameCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) id <nameDelegate> delegate;

@end

@protocol nameDelegate

-(void)textChanged: (NameCell *)cell;

@end