//
//  LoginViewController.m
//  NewtonCircus
//
//  Created by Weitian Chan on 11/2/14.
//  Copyright (c) 2014 Weitian Chan. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.NewLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.NewLabel.numberOfLines = 0;
    
    self.mobileTF.secureTextEntry=YES;
    
}

- (IBAction)loginPressed:(id)sender {
    [self performSegueWithIdentifier:@"LoginSuccessful" sender:self];
/*
    [PFUser logInWithUsernameInBackground:self.mobileTF.text password:self.passwordTF.text block:^(PFUser *user, NSError *error) {
        if (user){
            //If user login successfully,
            [self performSegueWithIdentifier:@"LoginSuccessful" sender:self];
        } else {
            //Error has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];*/
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
