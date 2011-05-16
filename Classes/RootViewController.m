//
//  RootViewController.m
//  IConMan
//
//  Created by George Moore on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


static const int rowHeight = 68;  //the height of each row in the table


@implementation RootViewController

@synthesize meetings;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.rowHeight = rowHeight; //set the row height
	
	//create the activity View
	activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
	
	meetingFinder = [[MeetingFinder alloc] init];//create a meeting finder
	meetingFinder.delegate = self; //set meetingfinder's delegate
	[self refreshMeetings]; //refresh the list of meetings
	
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)refreshMeetings{
	//create a button to display the activity indicator
	UIBarButtonItem *activityButton = 
	[[UIBarButtonItem alloc] initWithCustomView:activityView];
	
	//creat a button on the left side of teh bar 
	self.navigationItem.leftBarButtonItem = activityButton;
	[activityButton release];//release the activitybutton UIBarButtionItem
	[activityView startAnimating];//show the activity view spinning
	[meetingFinder getMeetings];//get the list of meetings
} //end refresh meetings

//delegate method of MeetingFinder, called when it finds meetings
-(void)meetingFinder:(MeetingFinder *)finder
	 didFindMeetings:(NSArray *)meetinglist
{
	self.meetings = meetinglist; //update meetings with the new meetings returned.
	[activityView stopAnimating];//stop the spinning 
	
	//create a new botton to replace the activity view
	
	
	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self
		action:@selector(refreshMeetings)];
	
	 
	//place the new button in place of the activity view
	self.navigationItem.leftBarButtonItem = refreshButton;
	[refreshButton release];
	[self.tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"MeetingCell";
	
	//get a Meeting cell by resusing an old one
	MeetingCell *cell = (MeetingCell *)
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	//fi there weren't any cells available for reuse
	if(cell ==nil)
		//create a new cell
		cell = [[[MeetingCell alloc] initWithStyle:
				 UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]
				autorelease];
				
	
	//get the meeting object for the cell at the given index
	Meeting *meeting = [meetings objectAtIndex:indexPath.row];
	
	//set all the labels on the cell to correspond with the Meeting
	cell.timeLabel.text = meeting.strdate;
	cell.subjectLabel.text = meeting.subject;
	cell.titleLabel.text = meeting.title;
	
	cell.number = meeting.number;
	
	return cell; //return the configured cell.
}

//calle dwhen the user touches a cell


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
	(NSIndexPath *)indexPath
{	
	
	//get the meeting object for the cell at the given index
	Meeting *meeting = [meetings objectAtIndex:indexPath.row];
	NSString *dialUrl = @"tel:";
	
	NSString *dialNumber = [dialUrl stringByAppendingString:meeting.number];
	
	UIDevice *device = [UIDevice currentDevice];
	if ([[device model] isEqualToString:@"iPhone"] ) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:dialNumber]];
	} else {
		UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[Notpermitted show];
		[Notpermitted release];
	}
}


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return meetings.count;  //create a row for each meeting
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[meetingFinder release];
	[meetings release];
	[activityView release];
    [super dealloc];
}


@end

