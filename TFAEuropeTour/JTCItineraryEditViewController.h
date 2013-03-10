//
//  JTCItinerayEditViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItineraryEvent.h"


@interface JTCItineraryEditViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) ItineraryEvent *itineraryEvent;
@property (nonatomic, strong) UIManagedDocument *tourDatabase;

@property (weak, nonatomic) IBOutlet UITextField *textBoxTitle;
@property (weak, nonatomic) IBOutlet UITextField *textBoxDate;
@property (weak, nonatomic) IBOutlet UITextField *textBoxTime;
@property (weak, nonatomic) IBOutlet UITextView *textDescription;

@end

