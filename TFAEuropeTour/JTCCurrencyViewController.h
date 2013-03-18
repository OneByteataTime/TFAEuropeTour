//
//  JTCCurrencyViewController.h
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/18/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTCCurrencyViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textboxAmount;
@property (weak, nonatomic) IBOutlet UISwitch *switchEuroToDollar;
@property (weak, nonatomic) IBOutlet UISwitch *switchPoundToDollar;
@property (weak, nonatomic) IBOutlet UILabel *labelConvertedAmount;

- (IBAction)buttonConvert:(id)sender;

@end
