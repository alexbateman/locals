//
//  UserTableViewController.m
//  Locals
//
//  Created by Alex Bateman on 10/21/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "UserTableViewController.h"
#import "PhotoCell.h"
#import "NameCell.h"
#import "DescriptionCell.h"
#import "User.h"
#import "FirebaseController.h"
#import "UserProfileViewController.h"
#import "UserController.h"


@interface UserTableViewController ()<nameDelegate, descriptionDelegate, PhotoCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (assign, nonatomic) BOOL editble;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) NSData *photo;

@end

@implementation UserTableViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerForNotifications];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateWithUser:) name:currentProfileLoadedNotification object:nil];
}

- (IBAction)submitButton:(id)sender {
    User *user = [User new];
    user.firstName = self.firstName;
    user.city = self.city;
    user.bio = self.bio;
    [[UserController sharedInstance] createUser:user];
    
    [self performSegueWithIdentifier:@"navSegue" sender:sender];
    
}

-(void)textChanged:(NameCell *)cell {
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    if (path.row == 1) {
        self.firstName = cell.nameTextField.text;

    } else {
        self.city = cell.nameTextField.text;
    }
}
-(void)textViewChanged:(DescriptionCell *)cell {
    self.bio = cell.descriptionTextField.text;
}





#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
// #warning wrong reuse id
    if (indexPath.row == 0) {
       return [self cellForPhoto];
    } else if (indexPath.row ==1) {
       return [self cellForFirstName];
    } else if (indexPath.row ==2) {
        return [self cellForCity];
    } else {
        return [self cellForDescription];
    }
    
//    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PhotoCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    
//    
//    return cell;

}


-(UITableViewCell *)cellForPhoto {
    PhotoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PhotoCell"];
    cell.delegate = self;
    if (self.photo) {
        UIImage *image = [UIImage imageWithData:self.photo];
        [cell.photoButton setImage:image forState:UIControlStateNormal];
    }
    return cell;
}

-(UITableViewCell *)cellForFirstName {
    NameCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NameCell"];
    cell.delegate = self;
    
    return cell;
}
-(UITableViewCell *)cellForCity {
    NameCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NameCell"];
    cell.firstNameLabel.text = @"City";
    cell.delegate = self;
    
    return cell;
}

-(UITableViewCell *)cellForDescription {
    DescriptionCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DescriptionCell"];
    cell.delegate = self;
    return cell;
}

-(void)photoCellButtonTapped {
   
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    UIAlertController *photoActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraRollAction = [UIAlertAction actionWithTitle:@"From Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    [photoActionSheet addAction:cameraRollAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [photoActionSheet addAction:cancelAction];
    
    UIAlertAction *takePictureAction = [UIAlertAction actionWithTitle:@"Take Picture" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            imagePicker.allowsEditing = YES;
            
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera Not Available on Device" message:@"This device does not have a camera option. Please choose photo from library." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:dismissAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
    [photoActionSheet addAction:takePictureAction];
    
    [self presentViewController:photoActionSheet animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.photo = UIImageJPEGRepresentation(image, 0.8);
    
    [self.tableView reloadData];
    
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
