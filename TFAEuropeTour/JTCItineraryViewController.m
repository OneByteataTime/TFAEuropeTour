//
//  JTCItineraryViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 2/17/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCItineraryViewController.h"
#import "JTCItineraryDetailViewController.h"
#import "JTCManagedDocumentHandler.h"
#import "JTCItineraryFetcher.h"
#import "ItineraryEvent+LiveSync.h"
#import "JTCCategoryFetcher.h"
#import "Category+LiveSync.h"
#import "JTCItineraryAddViewController.h"


@interface JTCItineraryViewController ()

@end

@implementation JTCItineraryViewController

@synthesize tourDatabase = _tourDatabase;

- (void)setupFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ItineraryEvent"];

    NSSortDescriptor *sort1 = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    NSSortDescriptor *sort2 = [NSSortDescriptor sortDescriptorWithKey:@"timeInterval" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObjects:sort1, sort2, nil];
        
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.tourDatabase.managedObjectContext
                                                                          sectionNameKeyPath:@"date"
                                                                                   cacheName:nil];
}

- (void)fetchItinerayDataIntoDocument:(UIManagedDocument *)document
{
    dispatch_queue_t fetchQ = dispatch_queue_create("Live Sync", NULL);
    dispatch_async(fetchQ, ^{
        NSArray *categories = [JTCCategoryFetcher defaultCategories:@"TFAEurope"];
        NSArray *itineraryEvents = [JTCItineraryFetcher itineraryForTrip:@"TFAEurope"];
        
        [document.managedObjectContext performBlock:^{
            
            for (NSDictionary *categoryInfo in categories) {
                [Category categoryWithLiveSync:categoryInfo inManagedObjectContext:document.managedObjectContext];
            }
            
            for (NSDictionary *eventInfo in itineraryEvents) {
                [ItineraryEvent itineraryEventWithLiveInfo:eventInfo inManagedObjectContext:document.managedObjectContext];
            }
            // should probably saveToURL:forSaveOperation:(UIDocumentSaveForOverwriting)completionHandler: here!
            // we could decide to rely on UIManagedDocument's autosaving, but explicit saving would be better
            // because if we quit the app before autosave happens, then it'll come up blank next time we run
            // this is what it would look like (ADDED AFTER LECTURE) ...
            [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
            // note that we don't do anything in the completion handler this time
        }];
    });
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

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
            [self setupFetchedResultsController];
            [self fetchItinerayDataIntoDocument:document];
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ItineraryEvent *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = event.title;
    cell.detailTextLabel.text = event.time;
    
    NSString *imageName = event.belongsToCategory.imageName;
    [[cell imageView] setImage:[UIImage imageNamed:imageName]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss zzzz"];

        NSString *sectionTitle = [[[self.fetchedResultsController sections] objectAtIndex:section] name];
        NSDate *sectionDate = [dateFormatter dateFromString:sectionTitle];
    
        [dateFormatter setDateFormat:@"EEE MMM dd"];
        sectionTitle = [dateFormatter stringFromDate:sectionDate];
    
        return sectionTitle;
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


#pragma mark - Segue Section
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    ItineraryEvent *itineraryEvent = [self.fetchedResultsController objectAtIndexPath:indexPath];
    // be somewhat generic here (slightly advanced usage)
    // we'll segue to ANY view controller that has a photographer @property
    if ([segue.destinationViewController respondsToSelector:@selector(setItineraryEvent:)]) {
        // use performSelector:withObject: to send without compiler checking
        // (which is acceptable here because we used introspection to be sure this is okay)
        [segue.destinationViewController performSelector:@selector(setItineraryEvent:) withObject:itineraryEvent];
    }

}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        JTCItineraryAddViewController *addController = [segue sourceViewController];
        
        if (addController.itineraryEventInputs) {
            
            [self.tourDatabase.managedObjectContext performBlock:^{
                // perform in the NSMOC's safe thread (main thread)
                
                NSDictionary *itineraryInputs = addController.itineraryEventInputs;
                [ItineraryEvent itineraryEventWithLiveInfo:itineraryInputs inManagedObjectContext:self.tourDatabase.managedObjectContext];
                
                [self.tourDatabase saveToURL:self.tourDatabase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
                
            }];
        }
        
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}
- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

@end
