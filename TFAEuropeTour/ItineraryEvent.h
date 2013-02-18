//
//  ItineraryEvent.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ItineraryEvent : NSManagedObject

@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSString * notes;

@end
