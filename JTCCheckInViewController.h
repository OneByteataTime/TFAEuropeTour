//
//  JTCCheckInViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/20/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface JTCCheckInViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapCheckIn;

- (IBAction)storeLocation:(id)sender;

@end
