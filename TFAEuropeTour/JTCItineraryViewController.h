//
//  JTCItineraryViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"

@interface JTCItineraryViewController : CoreDataTableViewController

@property (nonatomic, strong) UIManagedDocument *tourDatabase;  // Model is a Core Data database of photos

@end
