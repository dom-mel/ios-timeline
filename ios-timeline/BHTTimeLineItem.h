//
//  BHTTimeLineItem.h
//  ios-timeline
//
//  Created by Master-Student on 18.12.12.
//  Copyright (c) 2012 Beuth-Hochschule. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHTTimeLineItem : NSObject

enum Shape {
    circle,
    rect
};

@property(readonly) NSString* heading;
@property(readonly) NSString* text;
@property(readonly) NSString* image;
@property(readonly) enum Shape shape;
@property(readonly) bool showConnection;
@property(readonly) NSDate* date;
@property(readonly) int weight;

- (id) initTextItemWith:(NSString*) heading
        andText:(NSString*) text
        withShape:(enum Shape) shape
        andConnection:(bool) showConnection
        andDate:(NSDate*) date
        andWeight:(int) weight;

- (id) initImageItemWith:(NSString*) heading
        andImage:(NSString*) image
        withShape:(enum Shape) shape
        andConnection:(bool) showConnection
        andDate:(NSDate*) date
        andWeight:(int) weight;

@end
