//
//  JTCAddFlightViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/15/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCAddFlightViewController.h"
#import "JTCFlightViewModel.h"

@interface JTCAddFlightViewController ()

@property UITextField *activeDateField;

@end

@implementation JTCAddFlightViewController

@synthesize flightViewModel = _flightViewModel;
@synthesize activeDateField = _activeDateField;

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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)loadViewModelFromInput
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM d, yyyy hh:mm a"];
    
    self.flightViewModel = [[JTCFlightViewModel alloc] init];
    
    self.flightViewModel.airportName = self.textAirport.text;
    self.flightViewModel.airlineName = self.textAirline.text;
    self.flightViewModel.flightNumber = self.textFlightNumber.text;
    self.flightViewModel.seatNumber = self.textSeatNumber.text;
    self.flightViewModel.airportCode = self.textAirportCode.text;
    self.flightViewModel.departureDate = [dateFormatter dateFromString:self.textDepartDate.text];
    self.flightViewModel.arrivalDate = [dateFormatter dateFromString:self.textArriveDate.text];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        // Should validate text
        [self loadViewModelFromInput];
    }
}

- (IBAction)dateChanged:(id)sender
{
    UIDatePicker *datePicker = (UIDatePicker *)sender;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM d, yyyy hh:mm a"];
    self.activeDateField.text = [dateFormatter stringFromDate:[datePicker date]];
}

#pragma mark - UI Text field delegate
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
        datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        datePicker.minimumDate = date;
        datePicker.minuteInterval = 5;
        
        [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        textField.inputView = datePicker;
        
        self.activeDateField = textField;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ((textField == self.textAirportCode ||
         textField == self.textAirline ||
         textField == self.textSeatNumber ||
         textField == self.textFlightNumber ||
         textField == self.textAirport)) {
        
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Table view delegate

@end
