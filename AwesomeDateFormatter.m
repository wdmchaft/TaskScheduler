//
//  AwesomeDateFormatter.m
//  TaskScheduler
//
//  Created by Bernhard Bauer on 20.12.09.
//  Copyright 2009 Black Sheep Software. All rights reserved.
//

#import "AwesomeDateFormatter.h"


@implementation AwesomeDateFormatter

- (id)init {
	if (self = [super init]) {
		inputFormatter = [[NSDateFormatter alloc] initWithDateFormat:@"x" allowNaturalLanguage:YES];
		[inputFormatter setLenient:YES];
    if ([inputFormatter respondsToSelector:@selector(setDoesRelativeDateFormatting:)]) {
      [inputFormatter setDoesRelativeDateFormatting:YES];
    }
		
		outputFormatter = [[NSDateFormatter alloc] init];
		[outputFormatter setDateStyle:NSDateFormatterMediumStyle];
		[outputFormatter setTimeStyle:NSDateFormatterShortStyle];
	}
	return self;
}

- (void)dealloc {
	[inputFormatter release];
	inputFormatter = nil;
	[outputFormatter release];
	outputFormatter = nil;
	[super dealloc];
}

- (NSString*)stringForObjectValue:(id)obj {
	return [outputFormatter stringForObjectValue:obj];;
}

- (BOOL)getObjectValue:(id *)anObject forString:(NSString *)string errorDescription:(NSString **)error {
	return [outputFormatter getObjectValue:anObject forString:string errorDescription:error] || 
	[inputFormatter getObjectValue:anObject forString:string errorDescription:error];
}

@end
