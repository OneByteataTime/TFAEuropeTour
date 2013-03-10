//
//  Hotel+LiveSync.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/10/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "Hotel.h"

@interface Hotel (LiveSync)

+ (Hotel *)hotelWithLiveInfo:(NSDictionary *)hotelInfo
        inManagedObjectContext:(NSManagedObjectContext *)context;

@end
