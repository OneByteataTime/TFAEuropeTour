//
//  JTCCheckInViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/20/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ItineraryEvent.h"
#import "CheckIn.h"

@interface JTCCheckInViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) UIManagedDocument *tourDatabase;

@property (strong, nonatomic) ItineraryEvent *itineraryEvent;

@property (weak, nonatomic) IBOutlet MKMapView *mapCheckIn;
@property (weak, nonatomic) IBOutlet UITextView *textNote;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property (weak, nonatomic) IBOutlet UITextField *textBoxName;

- (IBAction)storeLocation:(id)sender;
- (IBAction)doneAddingNote;
- (IBAction)addNote:(id)sender;

@end
