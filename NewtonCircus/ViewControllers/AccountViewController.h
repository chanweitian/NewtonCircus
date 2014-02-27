//
//  AccountViewController.h
//  NewtonCircus
//
//  Created by Weitian Chan on 12/2/14.
//  Copyright (c) 2014 Weitian Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *mobileL;
@property (strong, nonatomic) IBOutlet UILabel *firstNameL;
@property (strong, nonatomic) IBOutlet UILabel *lastNameL;


@property (strong, nonatomic) IBOutlet UILabel *accountTypeL;
@property (strong, nonatomic) IBOutlet UILabel *accountIdL;
@property (strong, nonatomic) IBOutlet UILabel *pendingPaymentL;
@property (strong, nonatomic) IBOutlet UILabel *lifetimeEarningL;

@property (strong, nonatomic) IBOutlet UILabel *homeL;
@property (strong, nonatomic) IBOutlet UILabel *workL;
@property (strong, nonatomic) IBOutlet UILabel *othersL;


@end
