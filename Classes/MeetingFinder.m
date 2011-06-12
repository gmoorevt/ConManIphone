//
//  MeetingFinder.m
//  IConMan
//
//  Created by George Moore on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MeetingFinder.h"
#import <JSON/JSON.h>




@implementation MeetingFinder

@synthesize delegate;

-(void)getMeetings
{
	 meetings = [[NSMutableArray alloc] init];  //initialize meetings
	 	 
	 
	 RKClient* client = [RKClient clientWithBaseURL:
						 @"http://smooth-sword-960.heroku.com" username:@"gmoore" password:@"welcome"];
	 
	 NSLog(@"I am your client : %@", [RKClient sharedClient]);
	 //params = [NSDictionary dictionaryWithObjectsAndKeys:@"login",@"gmoore",@"format",@"xml",nil]
	// [[RKClient sharedClient]get:@"/test_rest_endpoints?login=gmoore;format=json"  delegate:self];
	[[RKClient sharedClient]get:@"/users/3/conference_calls?q=all;format=json"  delegate:self];

	 
	 NSLog(@"Get message Sent to Client, waiting for respose delegate to respond");
	// Test Connection 
	
	/*
	NSString *filePath = [[NSBundle mainBundle]pathForResource:@"conference_calls" ofType:@"json"];
	NSString *fileContent =[[NSString alloc]initWithContentsOfFile:filePath];	
	
	// Parse the resutls string using json-framework 
	parser = [SBJsonParser new];
	NSArray *results = [parser objectWithString:fileContent];
	
	//Go throught all of the meeitngs results and create meeting objects
	
	for (NSDictionary*call in results) 
	{
		
		NSDictionary *calldetails = [call objectForKey:@"conference_call"];
		NSDictionary *orginizer = [calldetails objectForKey:@"organizer"];
		NSDictionary *dial = [calldetails objectForKey:@"dialing_pattern"];	
		
		meeting =[[Meeting alloc]init];  //create new meeting object
		meeting.location = [calldetails objectForKey:@"location"];
		meeting.subject = [calldetails objectForKey:@"summary"];
		meeting.body = [calldetails objectForKey:@"description"];
		meeting.strStartDate = [calldetails objectForKey:@"start_dttm"];
		meeting.strEndDate = [calldetails objectForKey:@"end_dttm"];
		meeting.number = [dial objectForKey:@"phone_number"],[dial objectForKey:@"general_passcode"];
		meeting.organizer = [orginizer objectForKey: @"first_name"];
		
		[meetings addObject:meeting];
		[meeting release];
	}
	 */
	//[delegate meetingFinder:self didFindMeetings:[meetings autorelease]];
	
}
-(void)TestParse:(NSString *)response
{
	@try {
		//NSString *filePath = [[NSBundle mainBundle]pathForResource:@"conference_calls" ofType:@"json"];
		//NSString *fileContent =[[NSString alloc]initWithContentsOfFile:filePath];
		NSLog(@"Body Here you go>>>>>>>>>>>> %",response);
		parser = [SBJsonParser new];
		NSArray *results = [parser objectWithString:response];
		
		for (NSDictionary* call in results) {
			NSLog(@"*****************************o******************");
			NSDictionary *calldetails = [call objectForKey:@"conference_call"];
			NSDictionary *orginizer = [calldetails objectForKey:@"organizer"];
			NSDictionary *dial = [calldetails objectForKey:@"dialing_pattern"];
			
			NSLog(@"*************** Call Details ******************");
			NSLog(@"Location: %@ ",[calldetails objectForKey:@"location"]);
			NSLog(@"Created at: %@ ",[calldetails objectForKey:@"created_at"]);
			NSLog(@"Dialing Pattern: %i ",[calldetails objectForKey:@"dialing_pattern_id"]);
			NSLog(@"Email Body: %@",[calldetails objectForKey:@"email_body"]);
			NSLog(@"Start Time %@:",[calldetails objectForKey:@"start_dttm"]);
			NSLog(@"End Time %@:", [calldetails objectForKey:@"end_dttm"]);
			
			NSLog(@"*************** Orginizer *********************");
			NSLog(@"First Name %@ ",[orginizer objectForKey: @"first_name"]);
			NSLog(@"Last Name %@ ",[orginizer objectForKey: @"last_name"]);
			NSLog(@"Email: %@", [orginizer objectForKey: @"email"]);
			
			NSLog(@"*************** Dialing Details ***************");
			NSLog(@"Number to Dial: %@,,,%@" , [dial objectForKey:@"phone_number"],[dial objectForKey:@"general_passcode"]);
			
			
		}
	}
	@catch (NSException * e) {
		NSLog(@"@%,@%", [e name]);
	}
	@finally {
		
	}
	
	
}
-(void)requestDidTimeout:(RKRequest *)request{
}
-(void)request:(RKRequest *)request didFailLoadWithError:(NSError *)error;
{
}

-(void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response 
{
	
	
	// Parse the resutls string using json-framework 
	parser = [SBJsonParser new];
	NSArray *results = [parser objectWithString:[response bodyAsString]];
	
	[self TestParse:[response bodyAsString]];
	
	//Go throught all of the meeitngs results and create meeting objects
	
	for (NSDictionary*call in results) 
	{
		
		NSDictionary *calldetails = [call objectForKey:@"conference_call"];
		NSDictionary *orginizer = [calldetails objectForKey:@"organizer"];
		NSDictionary *dial = [calldetails objectForKey:@"dialing_pattern"];	
		
		meeting =[[Meeting alloc]init];  //create new meeting object
		meeting.location = [calldetails objectForKey:@"location"];
		meeting.subject = [calldetails objectForKey:@"summary"];
		meeting.body = [calldetails objectForKey:@"description"];
		meeting.strStartDate = [calldetails objectForKey:@"start_dttm"];
		meeting.strEndDate = [calldetails objectForKey:@"end_dttm"];
		meeting.number = [dial objectForKey:@"phone_number"],[dial objectForKey:@"general_passcode"];
		meeting.organizer = [orginizer objectForKey: @"first_name"];
		
		[meetings addObject:meeting];
		[meeting release];
	}
	
	[delegate meetingFinder:self didFindMeetings:[meetings autorelease]];
	

	
	
}
@end
