//
//  MeetingFinder.h
//  IConMan
//
//  Created by George Moore on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meeting.h"

@protocol MeetingFinderDelegate;

@interface MeetingFinder : NSObject {
	id<MeetingFinderDelegate> delegate;
	Meeting *meeting1;
	Meeting *meeting2;
	Meeting *currentMeeting;
	NSMutableArray *meetings;
	NSMutableString *currentString;
	BOOL isMeeting;
} //end instance variable declarations

@property (nonatomic,assign) id<MeetingFinderDelegate> delegate;

-(void)getMeetings; //begins the process of finding the meetings
@end //end interface Meeting Finder


@protocol MeetingFinderDelegate  //begin Meeting FinderDelegate declaration
//called when the Meeting Finder finishes finding meetings
-(void)meetingFinder:(MeetingFinder *)finder
	 didFindMeetings:(NSArray *)meetings;
@end  // end protocol MeetingFinderDelegate

