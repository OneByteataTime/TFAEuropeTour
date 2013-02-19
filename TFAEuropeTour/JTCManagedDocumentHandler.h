//
//  JTCManagedDocumentHandler.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/18/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OnDocumentReady) (UIManagedDocument *document);

@interface JTCManagedDocumentHandler : NSObject

@property (strong, nonatomic) UIManagedDocument *document;

+ (JTCManagedDocumentHandler *)sharedDocumentHandler;
- (void)performWithDocument:(OnDocumentReady)onDocumentReady;

@end
