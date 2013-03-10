//
//  JTCAddItineraryViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/27/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryAddViewController.h"
#import "JTCItineraryFetcher.h"
#import "JTCCategoryViewController.h"

@interface JTCItineraryAddViewController ()
@property (strong, nonatomic) NSString *categoryKey;

- (NSString *)getItineraryEventKey;

@end

@implementation JTCItineraryAddViewController
@synthesize itineraryEventInputs = _itineraryEventInputs;
@synthesize categoryKey = _categoryKey;

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
        
        NSString *key = [self getItineraryEventKey];
        
        self.itineraryEventInputs = [NSDictionary dictionaryWithObjectsAndKeys:
                               key, EVENT_KEY,
                               self.textDate.text, EVENT_DATE,
                               self.textTime.text, EVENT_TIME,
                               self.textTitle.text, EVENT_TITLE,
                               self.categoryKey, EVENT_CATEGORY,
                               self.textDescription.text, EVENT_SUMMARY, nil];
        
        NSLog(@"Dictionary count %i", [self.itineraryEventInputs count]);
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnCategory"]) {
        JTCCategoryViewController *categoryController = [segue sourceViewController];
        self.categoryKey = categoryController.selectedCategory;
    }
}


- (IBAction)dateChanged:(id)sender
{
    UIDatePicker *datePicker = (UIDatePicker *)sender;
    
    if (datePicker.datePickerMode == UIDatePickerModeDate) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        self.textDate.text = [dateFormatter stringFromDate:[datePicker date]];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        self.textTime.text = [dateFormatter stringFromDate:[datePicker date]];
    }
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1) {
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setWeekdayOrdinal:1]; // The first Monday in the month
        [components setMonth:1]; // May
        [components setYear:2013];
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *date = [gregorian dateFromComponents:components];
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.minimumDate = date;
        
        [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        textField.inputView = datePicker;
    } else if (textField.tag == 2) {
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setWeekdayOrdinal:1]; // The first Monday in the month
        [components setMonth:1]; // May
        [components setYear:2013];
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *date = [gregorian dateFromComponents:components];
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeTime;
        datePicker.minuteInterval = 5;
        datePicker.minimumDate = date;
        
        
        [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        textField.inputView = datePicker;
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

- (NSString *)getItineraryEventKey
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMdd-hh:mm:ss"];
    NSDate *now = [[NSDate alloc] init];
    return [dateFormatter stringFromDate:now];
}

@end
