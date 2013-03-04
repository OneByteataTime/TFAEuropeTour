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

@end

@implementation JTCCheckInViewController

@synthesize itineraryEvent = _itineraryEvent;
@synthesize tourDatabase = _tourDatabase;
@synthesize activeCheckIn = _activeCheckIn;
@synthesize selectedCheckIn = _selectedCheckIn;

- (void)dropPinAtCoord:(CLLocationCoordinate2D) coord {
    
    if ([[self.mapCheckIn annotations] count] > 1) {
        [self.mapCheckIn removeAnnotation:[[self.mapCheckIn annotations] objectAtIndex:1]];
    }
    
    JTCCheckInAnnotation *annotation = [[JTCCheckInAnnotation alloc] init];
    [annotation setCoordinate:coord];
    [self.mapCheckIn addAnnotation:annotation];
    
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
    
    // Give time for mapview to initialize and locate
    if (0.00001 > [mapView userLocation].location.coordinate.latitude) {
        [self performSelector:@selector(mapViewDidFinishLoadingMap:) withObject:mapView afterDelay:1.0];
        return;
    }

    NSLog(@"Did Finish Loading Map");
    
    MKUserLocation *userLocation = nil;
    CLLocationCoordinate2D selectedPos;
    
    if (self.selectedCheckIn)
    {
        self.activeCheckIn = self.selectedCheckIn;
        
        // create coordinate
        selectedPos = CLLocationCoordinate2DMake([self.selectedCheckIn.latitude floatValue], [self.selectedCheckIn.longitude floatValue]);
        userLocation = [[MKUserLocation alloc] init];
        userLocation.coordinate = selectedPos;
    }
    else
    {
        userLocation = [mapView userLocation];
    }
    
    MKCoordinateRegion region = [mapView region];
    region.center = userLocation.coordinate;
    region.span.latitudeDelta = 0.02;
    region.span.longitudeDelta = 0.02;
    [mapView setRegion:region animated:YES];
    
    if (self.selectedCheckIn) {
        [self dropPinAtCoord:selectedPos];
    }
    
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
    
    CheckIn *checkIn = [CheckIn checkInFromLocation:[self.mapCheckIn userLocation] itineraryEvent:self.itineraryEvent inManagedObjectContext:self.tourDatabase.managedObjectContext];
    
    self.textBoxName.text = checkIn.name;
    self.textNote.text = checkIn.note;
    
    self.activeCheckIn = checkIn;
}
@end
