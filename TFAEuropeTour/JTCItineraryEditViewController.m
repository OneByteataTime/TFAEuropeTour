//
//  JTCItinerayEditViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryEditViewController.h"

@interface JTCItineraryEditViewController ()

@end

@implementation JTCItineraryEditViewController

@synthesize itineraryEvent = _itineraryEvent;

- (void)loadItineraryEvent
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy"];
    
    [self.textBoxTitle setText:self.itineraryEvent.title];
    [self.textBoxDate setText:[dateFormatter stringFromDate:self.itineraryEvent.date]];
    [self.textBoxTime setText:self.itineraryEvent.time];
}

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

- (void)viewWillAppear:(BOOL)animated
{
    
   [self loadItineraryEvent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ((textField == self.textBoxTitle) || (textField == self.textBoxTime)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReturnEdit"]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMM dd yyyy"];
        
        NSDateFormatter *dateFormatterCoreData = [[NSDateFormatter alloc] init];
        [dateFormatterCoreData setDateFormat:@"MMM d, yyyy hh:mm a"];
        
        NSDate *eventDate = [dateFormatter dateFromString:self.textBoxDate.text];
        
        self.itineraryEvent.time = self.textBoxTime.text;
        self.itineraryEvent.title = self.textBoxTitle.text;
        self.itineraryEvent.date = eventDate;
    }
}

@end
