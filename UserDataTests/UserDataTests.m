//
//  UserDataTests.m
//  UserDataTests
//
//  Created by Администратор on 7/15/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import "UserDataTests.h"

@implementation UserDataTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testOutlets
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    FirstViewController *viewController=[storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    STAssertNotNil([viewController view],nil);
    NSLog(@"@@@@@@@@@@@@@@ : %@",viewController.firstName.text);
    STAssertNotNil(viewController.firstName.text, @"First name is void!!!");
    STAssertNotNil(viewController.lastName.text, @"Last name is void!!!");
    STAssertNotNil(viewController.surName.text, @"Sur name is void!!!");
    STAssertNotNil(viewController.dateOfBirth.text, @"Date of birth is void!!!");
    STAssertNotNil(viewController.bio.text, @"Biografy is void!!!");
    STAssertNotNil(viewController.contacts.text, @"Contacts is void!!!");
    STAssertNotNil(viewController.myImage.image, @"Image is empty!!!");
    
    STAssertEqualObjects(viewController.firstName.text, @"Andrey", @"First name is nor equal : Andrey");
}

@end
