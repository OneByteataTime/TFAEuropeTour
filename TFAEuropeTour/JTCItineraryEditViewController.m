//
//  JTCItinerayEditViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/23/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryEditViewController.h"
#import "JTCCheckInViewController.h"
#import "JTCCategoryViewController.h"
#import "Category+LiveSync.h"
#import "JTCManagedDocumentHandler.h"

@interface JTCItineraryEditViewController ()

@property (strong, nonatomic) NSString *categoryKey;

@end

@implementation JTCItineraryEditViewController

@synthesize categoryKey = _categoryKey;
@synthesize itineraryEvent = _itineraryEvent;
@synthesize tourDatabase = _tourDatabase;

- (void)loadItineraryEvent
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy"];
    
    [self.textBoxTitle setText:self.itineraryEvent.title];
    [self.textBoxDate setText:[dateFormatter stringFromDate:self.itineraryEvent.date]];
    [self.textBoxTime setText:self.itineraryEvent.time];
    [self.textDescription setText:self.itineraryEvent.summary];
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
    if (!self.tourDatabase) {
        [[JTCManagedDocumentHandler sharedDocumentHandler] performWithDocument:^(UIManagedDocument *document) {
            self.tourDatabase = document;
        }];
    }
 
   [self loadItineraryEvent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnCategory"]) {
        JTCCategoryViewController *categoryController = [segue sourceViewController];
        self.categoryKey = categoryController.selectedCategory;
        Category *category = [Category categoryFromKey:self.categoryKey inManagedObjectContext:self.tourDatabase.managedObjectContext];
        self.itineraryEvent.belongsToCategory = category;
    }
}

- (IBAction)dateChanged:(id)sender
{
    UIDatePicker *datePicker = (UIDatePicker *)sender;
    
    if (datePicker.datePickerMode == UIDatePickerModeDate) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        self.textBoxDate.text = [dateFormatter stringFromDate:[datePicker date]];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"h:mm a"];
        self.textBoxTime.text = [dateFormatter stringFromDate:[datePicker date]];
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
        datePicker.date = self.itineraryEvent.date;
        
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
        datePicker.date = self.itineraryEvent.date;
        
        [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        textField.inputView = datePicker;
    }
    
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
        
        NSString *eventDateTime = [NSString stringWithFormat:@"%@ %@", self.textBoxDate.text, self.textBoxTime.text];
        NSDate *eventDate = [dateFormatter dateFromString:eventDateTime];
        
        self.itineraryEvent.time = self.textBoxTime.text;
        self.itineraryEvent.title = self.textBoxTitle.text;
        self.itineraryEvent.date = eventDate;
        self.itineraryEvent.section = self.textBoxDate.text;
        
        self.itineraryEvent.summary = self.textDescription.text;
        [self setTimeIntervalFromItineraryEvent];
    }
}

- (void)setTimeIntervalFromItineraryEvent
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *itineraryEventDate = [dateFormatter stringFromDate:self.itineraryEvent.date];
    NSString *eventTimeStamp = [NSString stringWithFormat:@"%@ %@", itineraryEventDate, self.itineraryEvent.time];
    [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
    
    NSDate *referenceDate = [dateFormatter dateFromString:@"01/01/2013 12:01 AM"];
    NSDate *eventDate = [dateFormatter dateFromString:eventTimeStamp];
    
    NSTimeInterval eventTimeInterval = [eventDate timeIntervalSinceDate:referenceDate];
    self.itineraryEvent.timeInterval = [NSNumber numberWithDouble:eventTimeInterval];
    self.itineraryEvent.date = eventDate;
}
@end
