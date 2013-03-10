//
//  Hotel.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/10/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Hotel : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * phone_number;

@end
