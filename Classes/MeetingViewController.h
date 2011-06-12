//
//  MeetingViewController.h
//  TwitterDiscountAirfares
//
//  Created by George Moore on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meeting.h"


@interface MeetingViewController : UIViewController 
		<UITableViewDataSource>


{
	Meeting *meeting; // Meeting object 

}

@property(nonatomic, retain)Meeting* meeting;
-(void)updateTitle; // updates the title of the form

 @end
 
@end
