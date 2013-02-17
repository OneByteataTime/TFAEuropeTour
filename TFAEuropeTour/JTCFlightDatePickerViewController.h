//
//  JTCFlightDatePickerViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTCFlightViewModel.h"

@interface JTCFlightDatePickerViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) JTCFlightViewModel *flightViewModel;

@property (weak, nonatomic) IBOutlet UITextField *textBoxDepartureDate;
@property (weak, nonatomic) IBOutlet UITextField *textBoxArrivalDate;

- (IBAction)dateChanged:(id)sender;

@end
