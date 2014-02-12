//
//  AccountViewController.m
//  NewtonCircus
//
//  Created by Weitian Chan on 12/2/14.
//  Copyright (c) 2014 Weitian Chan. All rights reserved.
//

#import "AccountViewController.h"
#import <Parse/Parse.h>

@interface AccountViewController ()


@end

@implementation AccountViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
 
    PFUser *currentUser = [PFUser currentUser];
   // PFRelation *accountRelations = [currentUser relationforKey:@"accounts"];
    
   // PFRelation *locationsRelations = [currentUser relationForKey:@"fav_locations"];
    
 //   PFQuery *accountQuery = [accountRelations query];
//    PFQuery *locationQuery = [locationsRelations query];
    PFQuery *userQuery = [PFQuery queryWithClassName:@"User"];
    
    [userQuery whereKey:@"objectId" equalTo: currentUser.objectId];
    //[userQuery includeKey:@"accounts"];
    //[userQuery includeKey:@"fav_locations"];
    
    
//    PFQuery *query = [PFQuery orQueryWithSubqueries:@[userQuery,accountQuery,locationQuery]];
    
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved: %@", objects);
            
            PFObject *accountDetails = [objects objectAtIndex:0];
            
            self.mobileL.text = currentUser.username;
            self.firstNameL.text = [accountDetails valueForKey:@"first_name"];
            self.lastNameL.text = [accountDetails valueForKey:@"last_name"];
            
            self.accountTypeL.text = [accountDetails valueForKey:@"account_name"];
            self.accountIdL.text = [accountDetails valueForKey:@"account_id"];
            self.pendingPaymentL.text = [NSString stringWithFormat:@"%@",[accountDetails valueForKey:@"payment_pending"]];
            self.lifetimeEarningL.text = [NSString stringWithFormat:@"%@",[accountDetails valueForKey:@"earnings"]];

            
            [self.tableView reloadData];
            
            
        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
    }];

    

    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
