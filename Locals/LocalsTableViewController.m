//
//  LocalsTableViewController.m
//  Locals
//
//  Created by Alexander on 11/4/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "LocalsTableViewController.h"
#import "User.h"
#import "UserTableViewController.h"
#import "UserController.h"
#import "UserProfileViewController.h"

@interface LocalsTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) User *user;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LocalsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.user = [User new];
    self.user.firstName = @"Alex";
    self.user.city = @"New York City";
    self.user.bio = @"Hey Im Alex, and I love all that my NYC has to offer! I am all about going out at night, grabbing some pizza, hitting up a concert, and browsing local shops.";
    self.user.email = @"alex@localsapp.com";
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    // This hides the navigation controller
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toUserProfile"]) {
        UserProfileViewController *userProfile = segue.destinationViewController;
      //  NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        userProfile.user = self.user;
        
    }
        
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [UserController sharedInstance].locals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.user.firstName;
    cell.detailTextLabel.text = self.user.city;
    cell.imageView.image = [UIImage imageNamed:@"placeholder-square"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
