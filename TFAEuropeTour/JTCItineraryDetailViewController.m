//
//  JTCItineraryDetailViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/19/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryDetailViewController.h"
#import "JTCItineraryEditViewController.h"
#import "JTCManagedDocumentHandler.h"
#import "Category.h"

@interface JTCItineraryDetailViewController ()

@property (nonatomic, strong) UIManagedDocument *tourDatabase; 

@end

@implementation JTCItineraryDetailViewController

@synthesize tourDatabase = _tourDatabase;

- (void)loadDetails
{
    self.labelSummary.text = self.itineraryEvent.summary;
    [self.labelSummary sizeToFit];
    [self.scrollViewSummary sizeToFit];
    
    NSString *imageName = self.itineraryEvent.belongsToCategory.imageName;
    [self.imageCategory setImage:[UIImage imageNamed:imageName]];
    
    self.navigationItem.title = self.itineraryEvent.title;
    self.labelNotes.text = self.itineraryEvent.notes;
    self.labelTime.text = self.itineraryEvent.time;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDetails];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editItinerary"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        JTCItineraryEditViewController *detailViewController = [navigationController.viewControllers objectAtIndex:0];
        detailViewController.itineraryEvent = self.itineraryEvent;
    }
    
    if ([[segue identifier] isEqualToString:@"showLocations"]) {
        [segue.destinationViewController performSelector:@selector(setItineraryEvent:) withObject:self.itineraryEvent];
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnEdit"]) {
        JTCItineraryEditViewController *editController = [segue sourceViewController];
        
        if (editController.itineraryEvent) {
            [self.tourDatabase.managedObjectContext performBlock:^{
                NSError *error;
                [self.tourDatabase.managedObjectContext save:&error];
            }];
        }
        
        [self loadDetails];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelEdit"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
