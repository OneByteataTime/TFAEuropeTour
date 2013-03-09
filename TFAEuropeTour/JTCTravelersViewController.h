//
//  JTCTravelersViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>
#import "CoreDataTableViewController.h"

@interface JTCTravelersViewController : CoreDataTableViewController <ABPeoplePickerNavigationControllerDelegate,
                                                                    ABPersonViewControllerDelegate,
                                                                    ABNewPersonViewControllerDelegate>

@property (nonatomic, strong) UIManagedDocument *tourDatabase;


@end
