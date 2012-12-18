//
//  BHTSizes.m
//  ios-timeline
//
//  Created by Master-Student on 18.12.12.
//  Copyright (c) 2012 Beuth-Hochschule. All rights reserved.
//

#import "BHTSizes.h"

@implementation BHTSizes

static BHTSizes* INSTANCE;

- (id) init {
    if(self = [super init]) {
        _large.height = 75;
        _large.width = 75;
        _medium.height = 50;
        _medium.width = 50;
        _small.height = 25;
        _small.width = 25;
    }
    return self;
}

+ (BHTSizes*) getInstance {
    if(INSTANCE == NULL) {
        INSTANCE = [[BHTSizes alloc] init];
    }
    return INSTANCE;
}

@end
