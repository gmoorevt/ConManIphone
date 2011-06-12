//
//  Meeting.h
//  IConMan
//
//  Created by George Moore on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Meeting : NSObject {
	NSString * subject; // Title of the meeitng
	NSString * location; //Location of the meeting
	NSString * body; //Subject of the meeting
	NSString * organizer; // Organizer of the meeting
	NSString * number; //Phone number of the meeting
	NSString * code; //Passcode for the meeting
	NSString * leadercode; //Leader Code of the meeting
	NSDate * date; //Date for the meeting
	NSString * strStartDate; // String of the date
	NSString * strEndDate; //String of the end time for the meeting
	NSString * Host; //String for the name of the meeting Host
	NSArray * particpants; //list of people inthe meeitng

}
@property (nonatomic, retain)NSString *subject;
@property (nonatomic, retain)NSString *location;
@property (nonatomic, retain)NSString *body;
@property (nonatomic, retain)NSString *organizer;
@property (nonatomic, retain)NSString *number;
@property (nonatomic, retain)NSString *code;
@property (nonatomic, retain)NSString *leadercode;
@property (nonatomic, retain)NSDate *date;
@property (nonatomic, retain)NSString *strStartDate;
@property (nonatomic, retain)NSString *strEndDate;
@property (nonatomic, retain)NSString *host;
@property (nonatomic, retain)NSArray *particpants;


@end
