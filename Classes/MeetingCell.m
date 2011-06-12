//
//  MeetingCell.m
//  IConMan
//
//  Created by George Moore on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MeetingCell.h"


@implementation MeetingCell


@synthesize subjectLabel;
@synthesize timeLabel;
@synthesize number;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //create labels
		
		timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(97,7,206,21)];
		subjectLabel = [[UILabel alloc] initWithFrame:CGRectMake(95,27,206,36)];
		
		//create the font for the for the labels
		UIFont *timeFont = [UIFont fontWithName:@"Helvetica-Bold" size:14];
		timeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0.8 alpha:1];
		
		
		
		UIFont *subjectFont = [UIFont fontWithName:@"Helvetica" size:10];
		
		UIColor *subjectColor = [UIColor lightTextColor];
		subjectLabel.numberOfLines = 3;
		
		timeLabel.font = timeFont;
		
		subjectLabel.font = subjectFont;
	
		
		//create an image view for the image
		UIImage *callimage = [UIImage imageNamed:@"Phone.png"];
		
		callView = [[UIImageView alloc]initWithImage:callimage];
		callView.frame = CGRectMake(12, 3, 60, 60);
		
		[self.contentView addSubview:timeLabel];
		[self.contentView addSubview:subjectLabel];
		[self.contentView addSubview:callView];
		
		/*
				
		
		
		// set priceLabel's text color
		priceLabel.textColor =
		[UIColor colorWithRed:0 green:0.95 blue:0 alpha:1];
		
		// create tweetLabel
		tweetLabel =
		[[UILabel alloc] initWithFrame:CGRectMake(20, 55, 280, 61)];
		tweetLabel.font = [UIFont systemFontOfSize:14]; // set label's font
		tweetLabel.numberOfLines = 3; // set the number of lines in label
		
		// create the plane image
		UIImage *plane = [UIImage imageNamed:@"plane.png"];
		
		// create an image view for the image
		planeView = [[UIImageView alloc] initWithImage:plane];
		planeView.frame = CGRectMake(102, 20, 51, 34); // set the frame
		
		// add the views to the contentView
		[self.contentView addSubview:originLabel];
		[self.contentView addSubview:destinationLabel];
		[self.contentView addSubview:priceLabel];
		[self.contentView addSubview:tweetLabel];
		[self.co
		*/
		
		
		
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
