//
//  JTCFirstViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCFirstViewController.h"
#import "JTCFlight.h"
#import "JTCFlightsDataController.h"

@interface JTCFirstViewController ()

@end

@implementation JTCFirstViewController

@synthesize dataController = _dataController;
@synthesize tableViewFlights = _tableViewFlights;

- (void)awakeFromNib
{
    self.dataController = [[JTCFlightsDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfFlightList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FlightCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    JTCFlight *flight = [self.dataController objectInFlightListAtIndex:indexPath.row];
    
    cell.textLabel.text = flight.airline;
    cell.detailTextLabel.text = flight.number;
    
    return cell;
}

@end
