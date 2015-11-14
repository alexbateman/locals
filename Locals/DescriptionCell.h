//
//  DescriptionCell.h
//  Locals
//
//  Created by Alexander on 10/28/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol descriptionDelegate;

@interface DescriptionCell : UITableViewCell <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (weak, nonatomic) id <descriptionDelegate> delegate;

@end

@protocol descriptionDelegate

-(void)textChanged: (DescriptionCell *)cell;


@end
