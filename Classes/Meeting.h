//
//  Meeting.h
//  IConMan
//
//  Created by George Moore on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Meeting : NSObject {
	NSString * title; // Title of the meeitng
	NSString * subject; //Subject of the meeting
	NSString * number; //Phone number of the meeting
	NSString * code; //Passcode for the meeting
	NSString * leadercode; //Leader Code of the meeting
	NSDate * date; //Date for the meeting
	NSString * strdate; // String of the date
	NSString * Host; //String for the name of the meeting Host

}
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *subject;
@property (nonatomic, retain)NSString *number;
@property (nonatomic, retain)NSString *code;
@property (nonatomic, retain)NSString *leadercode;
@property (nonatomic, retain)NSDate *date;
@property (nonatomic, retain)NSString *strdate;
@property (nonatomic, retain)NSString *host;


@end
