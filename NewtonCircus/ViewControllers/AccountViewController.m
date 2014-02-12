//
//  AccountViewController.m
//  NewtonCircus
//
//  Created by Weitian Chan on 12/2/14.
//  Copyright (c) 2014 Weitian Chan. All rights reserved.
//

#import "AccountViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];

    //UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];
   
    /*
    
    self.accountInfo = [[NSMutableArray alloc] initWithCapacity:3];

    NSDictionary *accountDetails = @{
                                     @"Mobile Number": [NSNumber numberWithInt:92387434],
                                     @"First name": @"null",
                                     @"Sceond name":@"null"
                                     };
    NSDictionary *yourEarnings = @{@"Account Type": @"ez-link",
                                   @"Account ID":@"2334203495809385",
                                   @"Pending Payment": [NSNumber numberWithDouble:0.00],
                                   @"Lifetime Earning": [NSNumber numberWithDouble:0.00]
                                   };
    
    
    NSDictionary *favouriteLocation = @{@"Home": @"Amber Garden",
                                        @"Work": @"Orchard",
                                        @"Others": @"null"
                                        };
    
    
    
    
    [self.accountInfo addObject:accountDetails];
    [self.accountInfo addObject:yourEarnings];
    [self.accountInfo addObject:favouriteLocation];
     
     */
    
    
    self.navigationController.navigationBar.translucent = NO;


    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
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
