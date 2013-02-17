//
//  JTCAddFlightViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/15/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTCFlightViewModel;

@protocol AddFlightViewControllerDelegate;

@interface JTCAddFlightViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) JTCFlightViewModel *flightViewModel;

@property (weak, nonatomic) IBOutlet UITextField *textAirport;
@property (weak, nonatomic) IBOutlet UITextField *textAirportCode;
@property (weak, nonatomic) IBOutlet UITextField *textAirline;
@property (weak, nonatomic) IBOutlet UITextField *textFlightNumber;
@property (weak, nonatomic) IBOutlet UITextField *textSeatNumber;
@property (weak, nonatomic) IBOutlet UITextField *textDepartDate;
@property (weak, nonatomic) IBOutlet UITextField *textArriveDate;

- (void)loadViewModelFromInput;

@end
