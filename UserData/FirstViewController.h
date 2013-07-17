//
//  FirstViewController.h
//  UserData
//
//  Created by Администратор on 7/15/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *surName;
@property (weak, nonatomic) IBOutlet UILabel *dateOfBirth;
@property (weak, nonatomic) IBOutlet UILabel *bio;
@property (weak, nonatomic) IBOutlet UILabel *contacts;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;


-(void)positionViews;
@end
