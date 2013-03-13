//
//  JTCHotelDetailViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/10/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCHotelDetailViewController.h"
#import "Hotel.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface JTCHotelDetailViewController ()

- (void)showHotelInMaps;

@end

@implementation JTCHotelDetailViewController

@synthesize hotel = _hotel;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)configureView
{
    if (self.hotel) {
        self.cellName.detailTextLabel.text = self.hotel.name;
        self.cellUrl.detailTextLabel.text = self.hotel.url;
        self.cellPhone.detailTextLabel.text = self.hotel.phone_number;
        self.cellCountry.detailTextLabel.text = self.hotel.country;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.tag == 1) {
        NSURL *url = [NSURL URLWithString:self.hotel.url];
        [[UIApplication sharedApplication] openURL:url];
    }
    else if (cell.tag == 2) {
        [self showHotelInMaps];
    }
    else if (cell.tag == 3) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://2162251769"]];
    }
    
}

- (void)showHotelInMaps
{
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        // Create an MKMapItem to pass to the Maps app
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([self.hotel.latitude floatValue], [self.hotel.longitude floatValue]);
        //CLLocationCoordinate2DMake(16.775, -3.009);
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                       addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:self.hotel.name];
        // Pass the map item to the Maps app
        [mapItem openInMapsWithLaunchOptions:nil];
    }
}
@end
