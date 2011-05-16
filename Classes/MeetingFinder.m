//
//  MeetingFinder.m
//  IConMan
//
//  Created by George Moore on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MeetingFinder.h"



@implementation MeetingFinder

@synthesize delegate;

-(void)getMeetings
{
	meetings = [[NSMutableArray alloc] init];  //initialize meetings
	
	
	isMeeting = YES; //initialized ismeeting to ues
	
	currentMeeting = [[Meeting alloc]init];  // create a new meeting object
	meeting1 = [[Meeting alloc]init];
	meeting2 = [[Meeting alloc]init];
	
	meeting1.strdate = @"9:00 AM Monday May 4th";
	meeting1.title = @"IBM Watson Meeting";
	meeting1.subject = @"This is a meeting with the executives of IBM to decide if we want to move forward";
	meeting1.number = @"19192299002";
	
	[meetings addObject:meeting1];
	[meeting1 release];
		
	meeting2.strdate = @"10:00 AM Monday May 4th";
	meeting2.title = @"EMEA Strategy Meeting with Michael";
	meeting2.subject = @"This is a strategy meeting with Michael and his colleges";
	meeting2.number = @"19192299002";
	[meetings addObject:meeting2];
	[meeting2 release];

	[delegate meetingFinder:self didFindMeetings:[meetings autorelease]];
	
}
@end
