//
//  JTCItineraryDetailViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/19/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItineraryEvent.h"

@interface JTCItineraryDetailViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewSummary;

@property (strong, nonatomic) ItineraryEvent *itineraryEvent;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelSummary;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelNotes;

@end
