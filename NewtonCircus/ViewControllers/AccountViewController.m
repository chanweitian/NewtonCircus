//
//  AccountViewController.m
//  NewtonCircus
//
//  Created by Weitian Chan on 12/2/14.
//  Copyright (c) 2014 Weitian Chan. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

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
    PFRelation *accountRelations = [currentUser relationforKey:@"accounts"];
    
    PFRelation *locationsRelations = [currentUser relationForKey:@"fav_locations"];
    
    PFQuery *accountQuery = [accountRelations query];
    PFQuery *locationQuery = [locationsRelations query];
    
    
    [accountQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved: %@", objects);
            
            PFObject *accountDetails = [objects objectAtIndex:0];
            
            self.mobileL.text = currentUser.username;
            self.firstNameL.text = [currentUser valueForKey:@"first_name"];
            self.lastNameL.text = [currentUser valueForKey:@"last_name"];
            
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

    
    
    [locationQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved: %@", objects);
            
            for(PFObject *object in objects){
                
                //need to perform reverse geocoding using google
                
                /*https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&sensor=true_or_false&key=API_KEY */
                
                
                NSString *geocodeURLString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?latlng=%@&sensor=true",[locationQuery valueForKey:@"geopoint"] ];
            
//                NSString *geocodeURLString = @"https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&sensor=true";
                NSURL *geocodeURL = [NSURL URLWithString:geocodeURLString];
                

                NSData* data = [NSData dataWithContentsOfURL:
                                    geocodeURL];
                
                NSError *geocodeError;
                
                NSDictionary *geocodeJson = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&geocodeError];
                
                NSString *location = @"None";
                
                if([geocodeJson objectForKey:@"formatted_address"]){
                    location = [geocodeJson objectForKey:@"formatted_address"];
                };
                
                NSLog(@"Location: %@",location);
                
            
                if([[object valueForKey:@"type"] isEqualToString:@"home"]){
                    self.homeL.text = location;
                    
                } else if([[object valueForKey:@"type"] isEqualToString:@"work"]){
                    self.workL.text = location;
                    
                } else if([[object valueForKey:@"type"] isEqualToString:@"other"]){
                
                    self.othersL.text = location;
                }
                
                
            }
            
            
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
