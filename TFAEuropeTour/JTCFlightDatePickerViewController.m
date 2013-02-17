//
//  JTCFlightDatePickerViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/16/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCFlightDatePickerViewController.h"

@interface JTCFlightDatePickerViewController ()

@property UITextField *activeTextField;

@end

@implementation JTCFlightDatePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateHasFocus:(id)sender {
    self.activeTextField = sender;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    textField.inputView = datePicker;
}
@end
