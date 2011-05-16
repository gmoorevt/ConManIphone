//
//  RootViewController.h
//  IConMan
//
//  Created by George Moore on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ConManConnector.h"
#import "MeetingFinder.h"
#import "MeetingCell.h"


@interface RootViewController : UITableViewController 
	<MeetingFinderDelegate>
	{
		MeetingFinder *meetingFinder; //finds meetings
		NSArray *meetings;
		UIActivityIndicatorView *activityView;
	}
	

//declare meetins as a property
@property (nonatomic, retain) NSArray *meetings;

-(void)refreshMeetings;  //refreshes the list of meetings

@end  //end of root controler
