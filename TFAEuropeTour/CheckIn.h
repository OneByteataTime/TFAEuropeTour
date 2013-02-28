//
//  CheckIn.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/27/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ItineraryEvent;

@interface CheckIn : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) ItineraryEvent *locationForEvent;

@end
