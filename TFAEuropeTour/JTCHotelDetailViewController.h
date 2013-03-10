//
//  JTCHotelDetailViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/10/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Hotel;

@interface JTCHotelDetailViewController : UITableViewController

@property (strong, nonatomic) Hotel *hotel;

@property (weak, nonatomic) IBOutlet UITableViewCell *cellName;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellUrl;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellPhone;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellCountry;

@end
