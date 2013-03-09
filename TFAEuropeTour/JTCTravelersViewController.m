//
//  JTCTravelersViewController.m
//  TFAEuropeTour
//
//  Created by Steve Jackson on 3/9/13.
//  Copyright (c) 2013 Steve Jackson. All rights reserved.
//

#import "JTCTravelersViewController.h"
#import "JTCPersonFetcher.h"
#import "Person+LiveSync.h"
#import "JTCManagedDocumentHandler.h"

@interface JTCTravelersViewController ()

-(void)showPersonInContacts:(NSString *)name;

@end

@implementation JTCTravelersViewController

@synthesize tourDatabase = _tourDatabase;

- (void)setupFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    NSSortDescriptor *sort1 = [NSSortDescriptor sortDescriptorWithKey:@"role" ascending:YES];
    NSSortDescriptor *sort2 = [NSSortDescriptor sortDescriptorWithKey:@"last_name" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObjects:sort1,sort2, nil];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.tourDatabase.managedObjectContext
                                                                          sectionNameKeyPath:@"role"
                                                                                   cacheName:nil];
}

- (void)fetchTravellerDataIntoDocument:(UIManagedDocument *)document
{
    dispatch_queue_t fetchQ = dispatch_queue_create("Live Sync", NULL);
    dispatch_async(fetchQ, ^{
        
        NSArray *persons = [JTCPersonFetcher defaultTravelers:@"TFAEurope"];
        
        [document.managedObjectContext performBlock:^{
    
            for (NSDictionary *personInfo in persons) {
                [Person personWithLiveInfo:personInfo inManagedObjectContext:document.managedObjectContext];
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
            [self fetchTravellerDataIntoDocument:document];
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PersonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Person *person = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", person.last_name, person.first_name];
    
    
    //NSString *imageName = event.belongsToCategory.imageName;
    //[[cell imageView] setImage:[UIImage imageNamed:imageName]];
    
    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *person = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSString *name = [NSString stringWithFormat:@"%@ %@", person.first_name, person.last_name];
    [self showPersonInContacts:name];
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = [[[self.fetchedResultsController sections] objectAtIndex:section] name];
    
    if ([sectionTitle isEqualToString:@"P"]) {
        sectionTitle = @"Parents";
    }
    else {
        sectionTitle = @"Players";
    }
    
    return sectionTitle;
}


- (void)showPersonInContacts:(NSString *)name
{
    // Fetch the address book
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    
    // Search for the person named "Appleseed" in the address book
    NSArray *people = (__bridge NSArray *)ABAddressBookCopyPeopleWithName(addressBook, (__bridge CFStringRef)(name));
    
    // Display "Appleseed" information if found in the address book
    if ((people != nil) && [people count])
    {
        ABRecordRef person = (__bridge ABRecordRef)[people objectAtIndex:0];
        ABPersonViewController *picker = [[ABPersonViewController alloc] init];
        
        picker.personViewDelegate = self;
        picker.displayedPerson = person;
        // Allow users to edit the person’s information
        picker.allowsEditing = YES;
        [self.navigationController pushViewController:picker animated:YES];
    }
    else
    {
        NSString *msg = [NSString stringWithFormat:@"Cound not find %@ in the Contacts application", name];
        // Show an alert if "Appleseed" is not in Contacts
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:msg
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    CFRelease(addressBook);
}

@end
