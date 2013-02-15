//
//  JTCFirstViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/12/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTCFlightsDataController;

@interface JTCFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewFlights;
@property (strong, nonatomic) JTCFlightsDataController *dataController;



@end
