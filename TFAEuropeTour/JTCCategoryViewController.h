//
//  JTCCategoryViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/27/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"

@class Category;

@interface JTCCategoryViewController : CoreDataTableViewController

@property (nonatomic, strong) UIManagedDocument *tourDatabase;
@property (nonatomic, strong) NSString *selectedCategory;

@end
