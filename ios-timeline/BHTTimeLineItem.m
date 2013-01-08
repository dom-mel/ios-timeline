//
//  BHTTimeLineItem.m
//  ios-timeline
//
//  Created by Master-Student on 18.12.12.
//  Copyright (c) 2012 Beuth-Hochschule. All rights reserved.
//

#import "BHTTimeLineItem.h"

@implementation BHTTimeLineItem

- (id) initTextItemWithHeading:(NSString*) heading
        andText:(NSString*) text
        withShape:(enum Shape) shape
        andConnection:(bool) showConnection
        andDate:(NSDate*) date
        andWeight:(int) weight
        andSize:(enum Size)size {

    self = [super init];
    
    _heading = heading;
    _text = text;
    _shape = shape;
    _showConnection = showConnection;
    _date = date;
    _weight = weight;
    
    return self;
}

- (id) initImageItemWithHeading:(NSString*) heading
        andImage:(NSString*) image
        withShape:(enum Shape) shape
        andConnection:(bool) showConnection
        andDate:(NSDate*) date
        andWeight:(int) weight
        andSize:(enum Size)size {
    
    self = [super init];
    
    _heading = heading;
    _image = image;
    _shape = shape;
    _showConnection = showConnection;
    _date = date;
    _weight = weight;
    
    return self;
}

@end
