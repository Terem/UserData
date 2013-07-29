//
//  LoginViewController.m
//  UserData
//
//  Created by Администратор on 7/22/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "FMDatabase.h"

@interface LoginViewController () <FBLoginViewDelegate>

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
    
    FBLoginView *loginView=[[FBLoginView alloc]init];
    loginView.delegate=self;
    loginView.frame=CGRectOffset(loginView.frame, 20, 50);
    [self.view addSubview:loginView];
    
        
}

-(void) loginViewShowingLoggedOutUser:(FBLoginView *)loginView { 
    self.uiLabel.text=@"Hi, login to get started.";
    self.goButton.hidden=TRUE;
}

-(void) loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    
}

-(void) loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    self.uiLabel.text=[NSString stringWithFormat:@"Hi, %@", [user first_name]];
    self.goButton.hidden=FALSE;
    NSString *fbuid=[user id];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture",fbuid]];
    NSData *im=[NSData dataWithContentsOfURL:url options:NSDataReadingMapped error:nil];
    UIImage *image = [UIImage imageWithData:im];
    
    NSString *path=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"my_db1.sqlite"];
    FMDatabase *database;
    database=[FMDatabase databaseWithPath:path];
    database.traceExecution=true;
    [database open];
    
    [database executeUpdate:@"UPDATE personal_data SET lastname = (?), firstname = (?), surname = (?), dateofbirth = (?), contacts = (?), foto = (?) where id = (?)",
     [NSString stringWithString:[user last_name]],
     [NSString stringWithFormat:@"%@",[user first_name]],
     [NSString stringWithFormat:@"%@",[user middle_name]],
     [NSString stringWithFormat:@"%@",[user birthday]],
     [NSString stringWithFormat:@"%@",[user objectForKey:@"email"]],
     [NSData dataWithContentsOfURL:url],
     [NSNumber numberWithInt:1]];
   
    [database close];
       
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBasicShare:(id)sender {
   
    [FBDialogs presentOSIntegratedShareDialogModallyFrom:self initialText:@"Next Test" image:nil url:nil handler:^(FBOSIntegratedShareDialogResult result, NSError *error){}];
    
}

@end
