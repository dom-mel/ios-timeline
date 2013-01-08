//
//  BHTTimeLineView.m
//  ios-timeline
//
//  Created by Master-Student on 18.12.12.
//  Copyright (c) 2012 Beuth-Hochschule. All rights reserved.
//

#import "BHTTimeLineView.h"

@implementation BHTTimeLineView

BHTTimeLineItem* item;

CGColorRef itemBackgroundColor;
CGColorRef itemTextColor;
CGColorRef windowBackgroundColor;
CGColorRef itemBorderColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:NSTimeIntervalSince1970];
        item = [[BHTTimeLineItem alloc] initTextItemWithHeading:@"Hello World"
                andText:@"This is a dummy text item. Look how beautiful it is being rendered."
                withShape:circle andConnection:true andDate:date andWeight:1 andSize:medium];
    }
    return self;
}


- (void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);

    CGColorSpaceRef colorspace = [self setupColors];
    [self drawItem:item withContext:context];
    [self releaseColors:colorspace];
}

- (CGColorSpaceRef) setupColors
{
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat white[] = {1.0, 1.0, 1.0, 1.0};
    CGFloat black[] = {0.0, 0.0, 0.0, 1.0};
    
    itemBackgroundColor = CGColorCreate(colorspace, white);
    windowBackgroundColor = CGColorCreate(colorspace, white);
    itemTextColor = CGColorCreate(colorspace, black);
    itemBorderColor = CGColorCreate(colorspace, black);
    
    return colorspace;
}

- (void) releaseColors : (CGColorSpaceRef) colorspace
{
    CGColorRelease(itemBackgroundColor);
    CGColorRelease(itemTextColor);
    CGColorRelease(itemBorderColor);
    CGColorRelease(windowBackgroundColor);
    CGColorSpaceRelease(colorspace);
}

- (void) drawItem : (BHTTimeLineItem*) item withContext : (CGContextRef) context
{
    CGContextSetStrokeColorWithColor(context, itemBorderColor);
    CGContextSetLineWidth(context, 1.0);
    CGRect rect = CGRectMake(50, 50, 150, 150);
    CGContextAddRect(context, rect);
    CGContextStrokePath(context);
}

@end
