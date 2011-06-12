//
//  MeetingFinder.h
//  IConMan
//
//  Created by George Moore on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meeting.h"
#import <RestKit/RestKit.h>
#import <JSON/JSON.h>


@protocol MeetingFinderDelegate, RKRequestDelegate;

@interface MeetingFinder : NSObject {
	id<MeetingFinderDelegate> delegate;
	Meeting *meeting;
	NSMutableArray *meetings;
	NSMutableString *currentString;
	BOOL isMeeting;
	NSDictionary *params;
	SBJsonParser *parser;
} //end instance variable declarations

@property (nonatomic,assign) id<MeetingFinderDelegate> delegate;

-(void)getMeetings; //begins the process of finding the meetings
@end //end interface Meeting Finder


@protocol MeetingFinderDelegate  //begin Meeting FinderDelegate declaration
//called when the Meeting Finder finishes finding meetings
-(void)meetingFinder:(MeetingFinder *)finder
	 didFindMeetings:(NSArray *)meetings;
@end  // end protocol MeetingFinderDelegate

@protocol RKRequestDelegate
-(void)request:(RKRequest *)request didFailLoadWithError:(NSError *)error;
-(void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response;
-(void)requestDidTimeout:(RKRequest *)request;
@end