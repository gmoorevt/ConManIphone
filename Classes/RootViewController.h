//
//  RootViewController.h
//  IConMan
//
//  Created by George Moore on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import ConManConnector


@interface RootViewController : UITableViewController {
	ConManConnector *conmanCon; //finds new meetings
	NSArray *meetings;//collection of meeting objects
	UIActivityIndicatorView *activityView // shows hourglass during download
}

//declare meetins as a property
@property (nonatomic, retain) NSArray *meetings;

-(void)refreshMeetings;  //refreshes the list of meetings

@end  //end of root controler
