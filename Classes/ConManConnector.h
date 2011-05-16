//
//  ConManConnector.h
//  IConMan
//
//  Created by George Moore on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConManConnectorDelegate;


@interface ConManConnector : NSObject {
	id<ConManConnectorDelegate> delegate;  //this class's delegate
	NSMutableData *recievedData;

}

//delcare delegate as a property
@property (nonatomic, assign) id <ConManConnectorDelegate> delegate;
-(void)perfomSearch:(NSString *)search;  
@end
@protocol ConManConnectorDelegate

-(void)conManConnector:(ConManConnector *)connection
didRecieveData:(NSData *)data;

@end



