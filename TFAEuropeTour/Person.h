//
//  Person.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * first_name;
@property (nonatomic, retain) NSString * last_name;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) NSString * role;

@end
