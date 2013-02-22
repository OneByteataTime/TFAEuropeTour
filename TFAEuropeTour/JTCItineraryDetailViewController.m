//
//  JTCItineraryDetailViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/19/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryDetailViewController.h"

@interface JTCItineraryDetailViewController ()

@end

@implementation JTCItineraryDetailViewController

- (void)loadDetails
{
    self.labelSummary.text = self.itineraryEvent.summary;
    [self.labelSummary sizeToFit];
    [self.scrollViewSummary sizeToFit];
    
    self.navigationItem.title = self.itineraryEvent.title;
    //self.labelTitle.text = self.itineraryEvent.title;
    
    self.labelTime.text = self.itineraryEvent.time;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDetails];
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


@end
