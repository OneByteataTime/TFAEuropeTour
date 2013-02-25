//
//  JTCItineraryLocationViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/24/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "ItineraryEvent.h"

@interface JTCItineraryLocationViewController : CoreDataTableViewController

@property (nonatomic, strong) UIManagedDocument *tourDatabase;
@property (nonatomic, strong) ItineraryEvent *itineraryEvent;
@end
