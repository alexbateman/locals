//
//  PhotoCell.h
//  Locals
//
//  Created by Alexander on 10/28/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoCellDelegate;

@interface PhotoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *photoButton;

@property (weak, nonatomic) id<PhotoCellDelegate> delegate;

@end

@protocol PhotoCellDelegate
- (void)photoCellButtonTapped;

@end