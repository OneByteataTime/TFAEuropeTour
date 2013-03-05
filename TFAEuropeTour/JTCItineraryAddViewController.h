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

@property (weak, nonatomic) IBOutlet UITextField *textDate;
@property (weak, nonatomic) IBOutlet UITextField *textTime;
@property (weak, nonatomic) IBOutlet UITextField *textTitle;
@property (weak, nonatomic) IBOutlet UITextView *textDescription;

@end
