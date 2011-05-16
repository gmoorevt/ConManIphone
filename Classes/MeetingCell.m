//
//  MeetingCell.m
//  IConMan
//
//  Created by George Moore on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MeetingCell.h"


@implementation MeetingCell

@synthesize titleLabel;
@synthesize subjectLabel;
@synthesize timeLabel;
@synthesize number;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //create labels
		
		timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,24,65,21)];
		titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(95, 5, 211, 21)];
		subjectLabel = [[UILabel alloc] initWithFrame:CGRectMake(94,34,211,34)];
		
		//create the font for the for the labels
		UIFont *timeFont = [UIFont fontWithName:@"Helvetica-Bold" size:14];
		UIFont *titleFont = [UIFont fontWithName:@"Helvetica-Bold" size:12];
		UIFont *subjectFont = [UIFont fontWithName:@"Helvetica" size:10];
		
		UIColor *subjectColor = [UIColor lightTextColor];
		subjectLabel.numberOfLines = 3;
		
		timeLabel.font = timeFont;
		titleLabel.font = titleFont;
		subjectLabel.font = subjectFont;
		//subjectLabel.textColor = subjectColor;
		
		[self.contentView addSubview:titleLabel];
		[self.contentView addSubview:subjectLabel];
		[self.contentView addSubview:timeLabel];
		
		/*
		// create the origin and destination labels
		originLabel =
		[[UILabel alloc] initWithFrame:CGRectMake(20, 5, 70, 64)];
		destinationLabel =
		[[UILabel alloc] initWithFrame:CGRectMake(171, 5, 70, 64)];
		
		// create the font for the origin and destination labels
		UIFont *locationFont =
		[UIFont fontWithName:@"CourierNewPS-BoldMT" size:33];
		originLabel.font = locationFont; // apply font to originLabel
		destinationLabel.font = locationFont; // apply font to destination
		
		// set the text color of originLabel to dark blue
		originLabel.textColor =
		[UIColor colorWithRed:0 green:0 blue:0.8 alpha:1];
		
		// set the text color of destinationLabel to dark blue
		destinationLabel.textColor =
		[UIColor colorWithRed:0 green:0 blue:0.8 alpha:1];
		
		// create the price label
		priceLabel =
		[[UILabel alloc] initWithFrame:CGRectMake(250, 2, 83, 64)];
		
		priceLabel.font = [UIFont systemFontOfSize:30]; // set label's font
		
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
