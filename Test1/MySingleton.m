//
//  MySingleton.m
//  Test1
//
//  Created by Ivan Vasilevich on 11/14/13.
//  Copyright (c) 2013 Ivan Vasilevich. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

static MySingleton * sharedMySingleton = NULL;

+(MySingleton *)sharedMySingleton
{
    if (!sharedMySingleton || sharedMySingleton == NULL) {
		sharedMySingleton = [MySingleton new];
    }
	return sharedMySingleton;
}

@end
