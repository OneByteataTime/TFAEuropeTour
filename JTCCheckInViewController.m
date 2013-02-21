//
//  JTCCheckInViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/20/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCCheckInViewController.h"
#import "JTCCheckInAnnotation.h"

@interface JTCCheckInViewController ()

@end

@implementation JTCCheckInViewController

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

#pragma mark Map Kit View delegate
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    if (0.00001 > [mapView userLocation].location.coordinate.latitude) {
        [self performSelector:@selector(mapViewDidFinishLoadingMap:) withObject:mapView afterDelay:1.0];
        return;
    }
    
    MKCoordinateRegion region = [mapView region];
    region.center = [mapView userLocation].location.coordinate;
    region.span.latitudeDelta = 0.02;
    region.span.longitudeDelta = 0.02;
    [mapView setRegion:region animated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (![annotation isKindOfClass:[JTCCheckInAnnotation class]]){
        return nil;
    }
    
    NSString *dqref = @"CheckinAnnontation";
    id av = [mapView dequeueReusableAnnotationViewWithIdentifier:dqref];
    if (nil == av) {
        av = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:dqref];
        [av setPinColor:MKPinAnnotationColorGreen];
        [av setAnimatesDrop:YES];
    }
    
    return av;
}

- (IBAction)storeLocation:(id)sender {
    JTCCheckInAnnotation *annotation = [[JTCCheckInAnnotation alloc] init];
    [annotation setCoordinate:[self.mapCheckIn userLocation].location.coordinate];
    [self.mapCheckIn addAnnotation:annotation];
}
@end
