/*
 Copyright (c) 2010, Stig Brautaset.
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:
 
   Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
  
   Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
   Neither the name of the the author nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <SenTestingKit/SenTestingKit.h>
#import "SBJsonStreamParserAdapter.h"
#import "StreamParserAdapterDelegate.h"

@interface StreamParserAdapterTest : SenTestCase {
	SBJsonStreamParserAdapter *adapter;
	StreamParserAdapterDelegate *delegate;
	NSMutableArray *expected;
}
@end

@implementation StreamParserAdapterTest

- (void)setUp {
	expected = [NSMutableArray new];
	adapter = [SBJsonStreamParserAdapter new];
	delegate = [StreamParserAdapterDelegate new];
	
	adapter.delegate = delegate;
}

- (void)tearDown {
	[expected release];
	[adapter release];
	[delegate release];
}

- (void)testEmptyArray {
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayEnd:nil];
	
	[expected addObject:[NSArray array]];
	STAssertEqualObjects(delegate.objects, expected, nil);	
}

- (void)testEmptyObject {
	[adapter parserFoundObjectStart:nil];
	[adapter parserFoundObjectEnd:nil];

	[expected addObject:[NSDictionary dictionary]];
	STAssertEqualObjects(delegate.objects, expected, nil);	
}

- (void)testScalar {
	[adapter parserFoundArrayStart:nil];
	[adapter parser:nil foundString:@"foo"];
	[adapter parser:nil foundNumber:[NSNumber numberWithInt:3]];
	[adapter parser:nil foundNumber:[NSNumber numberWithDouble:3.14]];
	[adapter parserFoundNull:nil];
	[adapter parser:nil foundBoolean:YES];
	[adapter parserFoundArrayEnd:nil];
	
	NSMutableArray *array = [NSMutableArray array];
	[array addObject:@"foo"];
	[array addObject:[NSNumber numberWithInt:3]];
	[array addObject:[NSNumber numberWithDouble:3.14]];
	[array addObject:[NSNull null]];
	[array addObject:[NSNumber numberWithBool:YES]];
	
	[expected addObject:array];
	STAssertEqualObjects(delegate.objects, expected, nil);	
}

- (void)testSimpleObject {
	[adapter parserFoundObjectStart:nil];
	[adapter parser:nil foundObjectKey:@"fut"];
	[adapter parser:nil foundString:@"futfut"];
	[adapter parserFoundObjectEnd:nil];
	
	[expected addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"futfut", @"fut", nil]];
	STAssertEqualObjects(delegate.objects, expected, nil);	
}

- (void)testNestedArray {
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayEnd:nil];
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayEnd:nil];
	[adapter parserFoundArrayEnd:nil];
	[adapter parserFoundArrayEnd:nil];
	
	NSArray *ary = [NSArray array];
	ary = [NSArray arrayWithObjects:ary, ary, nil];
	ary = [NSArray arrayWithObject:ary];
	
	[expected addObject:ary];
	STAssertEqualObjects(delegate.objects, expected, nil);	
}


- (void)testSkipOuterArray {
	adapter.skip = 1;
	
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayEnd:nil];
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayEnd:nil];
	[adapter parserFoundArrayStart:nil];
	[adapter parserFoundArrayEnd:nil];
	[adapter parserFoundArrayEnd:nil];

	[expected addObject:[NSArray array]];
	[expected addObject:[NSArray array]];
	[expected addObject:[NSArray array]];
	
	STAssertEqualObjects(delegate.objects, expected, nil);	
}

- (void)testNestedObject {
	[adapter parserFoundObjectStart:nil];
	[adapter parser:nil foundObjectKey:@"foo"];
	[adapter parserFoundObjectStart:nil];
	[adapter parser:nil foundObjectKey:@"bar"];
	[adapter parserFoundObjectStart:nil];
	[adapter parserFoundObjectEnd:nil];
	[adapter parser:nil foundObjectKey:@"quux"];
	[adapter parserFoundObjectStart:nil];
	[adapter parserFoundObjectEnd:nil];
	[adapter parserFoundObjectEnd:nil];
	[adapter parserFoundObjectEnd:nil];
	
	NSDictionary *dict = [NSDictionary dictionary];
	dict = [NSDictionary dictionaryWithObjectsAndKeys:dict, @"bar", dict, @"quux", nil];
	dict = [NSDictionary dictionaryWithObjectsAndKeys:dict, @"foo", nil];
	
	[expected addObject:dict];
	STAssertEqualObjects(delegate.objects, expected, nil);	
}

@end
