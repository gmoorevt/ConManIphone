//
//  MeetingCell.h
//  IConMan
//
//  Created by George Moore on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MeetingCell : UITableViewCell 
{
	UILabel *titleLabel;
	UILabel *subjectLabel;
	UILabel *timeLabel;
	NSString *number;

}

//delcare all the UILable instance variables as properties
@property(nonatomic, readonly)UILabel *titleLabel;
@property(nonatomic, readonly)UILabel *subjectLabel;
@property(nonatomic, readonly)UILabel *timeLabel;
@property(nonatomic, retain)NSString *number;

@end
