//
//  MySingleton.h
//  Test1
//
//  Created by Ivan Vasilevich on 11/14/13.
//  Copyright (c) 2013 Ivan Vasilevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic) int selectedIndex;

+ (MySingleton *)sharedMySingleton;

@end
