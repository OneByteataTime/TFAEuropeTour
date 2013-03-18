//
//  JTCCurrencyViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/18/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCCurrencyViewController.h"

@interface JTCCurrencyViewController ()

@end

@implementation JTCCurrencyViewController


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


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


- (IBAction)buttonConvert:(id)sender {
    if ([self.switchEuroToDollar isOn]) {
        float amount = [self.textboxAmount.text floatValue];
        float value = amount * (1.29);
        self.labelConvertedAmount.text = [NSString stringWithFormat:@"$%1.2f", value];
    };
    if ([self.switchPoundToDollar isOn]) {
        float amount = [self.textboxAmount.text floatValue];
        float value = amount * (1.51);
        self.labelConvertedAmount.text = [NSString stringWithFormat:@"$%1.2f", value];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textboxAmount) {
        [textField resignFirstResponder];
    }
    return NO;
}
@end
