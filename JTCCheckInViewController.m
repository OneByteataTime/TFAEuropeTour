//
//  JTCCheckInViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/20/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCCheckInViewController.h"
#import "JTCCheckInAnnotation.h"
#import "CheckIn+Create.h"
#import "JTCManagedDocumentHandler.h"
#import <CoreLocation/CoreLocation.h>

@interface JTCCheckInViewController ()

@property (nonatomic, strong) CheckIn *activeCheckIn;
@property (nonatomic, strong) MKUserLocation *activeUserLocation;

@end

@implementation JTCCheckInViewController

@synthesize itineraryEvent = _itineraryEvent;
@synthesize tourDatabase = _tourDatabase;
@synthesize activeCheckIn = _activeCheckIn;
@synthesize selectedCheckIn = _selectedCheckIn;
@synthesize activeUserLocation = _activeUserLocation;

- (void)dropPinAtCoord:(CLLocationCoordinate2D) coord {
    
    if ([[self.mapCheckIn annotations] count] > 1) {
        [self.mapCheckIn removeAnnotation:[[self.mapCheckIn annotations] objectAtIndex:1]];
    }
    
    JTCCheckInAnnotation *annotation = [[JTCCheckInAnnotation alloc] init];
    [annotation setCoordinate:coord];
    [self.mapCheckIn addAnnotation:annotation];
    [self doRevGeocodeUsingLatitude:coord.latitude andLongitude:coord.longitude];
}

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
    NSLog(@"ViewDidLoad fired");
    
    if (!self.activeUserLocation) {
        self.activeUserLocation = [[MKUserLocation alloc] init];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    if (!self.tourDatabase) {
        [[JTCManagedDocumentHandler sharedDocumentHandler] performWithDocument:^(UIManagedDocument *document) {
            self.tourDatabase = document;
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Map Kit View delegate
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    // Do we have a location to show?
    if (!self.selectedCheckIn) {
        mapView.showsUserLocation = YES;
        // Give time for mapview to initialize and locate
        if (0.00001 > [mapView userLocation].location.coordinate.latitude) {
            [self performSelector:@selector(mapViewDidFinishLoadingMap:) withObject:mapView afterDelay:2.0];
            return;
        }
        self.activeUserLocation = [mapView userLocation];
    }
    else {
        self.activeCheckIn = self.selectedCheckIn;
        
        // create coordinate
        CLLocationCoordinate2D selectedPos = CLLocationCoordinate2DMake([self.selectedCheckIn.latitude floatValue], [self.selectedCheckIn.longitude floatValue]);
        self.activeUserLocation.coordinate = selectedPos;
        
        [self dropPinAtCoord:selectedPos];
        mapView.showsUserLocation = NO;
    }
    
    //NSLog(@"Did Finish Loading Map");    
    
    MKCoordinateRegion region = [mapView region];
    region.center = self.activeUserLocation.coordinate;
    region.span.latitudeDelta = 0.02;
    region.span.longitudeDelta = 0.02;
    [mapView setRegion:region animated:YES];
}

- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView
{
    NSLog(@"Did stop locating user");
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
        [av setCanShowCallout:YES];
        
        mapView.showsUserLocation = NO;
    }
    
    return av;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.textBoxName) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)storeLocation:(id)sender {
    
    [CheckIn checkInFromLocation:[self.mapCheckIn userLocation] itineraryEvent:self.itineraryEvent inManagedObjectContext:self.tourDatabase.managedObjectContext];
    
    JTCCheckInAnnotation *annotation = [[JTCCheckInAnnotation alloc] init];
    [annotation setCoordinate:[self.mapCheckIn userLocation].location.coordinate];
    [self.mapCheckIn addAnnotation:annotation];
    
    CLLocationCoordinate2D coord = [self.mapCheckIn userLocation].location.coordinate;
    [self doRevGeocodeUsingLatitude:coord.latitude andLongitude:coord.longitude];
}

- (void)doRevGeocodeUsingLatitude:(float)latitude andLongitude:(float)longitude
{
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    CLGeocoder *reverseGeoCoder = [[CLGeocoder alloc] init];
    
    [reverseGeoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (!error && [placemarks count] > 0) {
            NSDictionary *dict = [[placemarks objectAtIndex:0] addressDictionary];
            NSLog(@"street address: %@", [dict objectForKey:@"Street"]);
            
            for (JTCCheckInAnnotation *annotation in [self.mapCheckIn annotations]) {
                if ([annotation isKindOfClass:[JTCCheckInAnnotation class]]) {
                    [annotation setTitle:[dict objectForKey:@"Street"]];
                }
            }
        }
        else {
            NSLog(@"ERROR/No Results: %@", error);
        }
     }];
}

- (IBAction)doneAddingNote {
    self.textNote.hidden = YES;
    self.buttonDone.hidden = YES;
    self.textBoxName.hidden = YES;
    
    self.activeCheckIn.note = self.textNote.text;
    self.activeCheckIn.name = self.textBoxName.text;
    
    [self.view endEditing:YES];
}

- (IBAction)addNote:(id)sender {
    
    self.textNote.hidden = NO;
    self.buttonDone.hidden = NO;
    self.textBoxName.hidden = NO;
    
    CheckIn *checkIn = [CheckIn checkInFromLocation:self.activeUserLocation itineraryEvent:self.itineraryEvent inManagedObjectContext:self.tourDatabase.managedObjectContext];
    
    self.textBoxName.text = checkIn.name;
    self.textNote.text = checkIn.note;
    
    self.activeCheckIn = checkIn;
}
@end
