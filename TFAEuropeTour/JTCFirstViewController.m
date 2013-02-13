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

#pragma mark - UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfFlightList];
}

@end
