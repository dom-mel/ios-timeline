//
//  BHTSizes.h
//  ios-timeline
//
//  Created by Master-Student on 18.12.12.
//  Copyright (c) 2012 Beuth-Hochschule. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHTSizes : NSObject

    @property(readonly) CGSize large;
    @property(readonly) CGSize small;
    @property(readonly) CGSize medium;

- (id) init;
+ (BHTSizes*)getInstance;

@end
