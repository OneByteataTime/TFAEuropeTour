//
//  JTCAddItineraryViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/27/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTCItineraryAddViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSDictionary *itineraryEventInputs;

@end