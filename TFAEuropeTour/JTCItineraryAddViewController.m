//
//  JTCAddItineraryViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/27/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryAddViewController.h"
#import "JTCItineraryFetcher.h"

@interface JTCItineraryAddViewController ()

@end

@implementation JTCItineraryAddViewController
@synthesize itineraryEventInputs = _itineraryEventInputs;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        
        self.itineraryEventInputs = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"0228-1", EVENT_KEY,
                               @"02/28/2013", EVENT_DATE,
                               @"7:25 PM", EVENT_TIME,
                               @"New Event", EVENT_TITLE,
                               @"cat1", EVENT_CATEGORY,
                               @"Still need to grab data from view", EVENT_SUMMARY, nil];
        
        NSLog(@"Dictionary count %i", [self.itineraryEventInputs count]);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //if ((textField == self.textAirportCode ||
    //     textField == self.textAirline ||
    //     textField == self.textSeatNumber ||
    //     textField == self.textFlightNumber ||
    //     textField == self.textAirport)) {
        
    //    [textField resignFirstResponder];
    //}
    return YES;
}


@end
