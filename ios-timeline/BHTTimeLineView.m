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

- (id) init {
    self = [super init];
    if (self) {
        [self initItems];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initItems];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initItems];
    }
    return self;
}

- (void) initItems {
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:NSTimeIntervalSince1970];
    item = [[BHTTimeLineItem alloc] initTextItemWithHeading:@"Hello World"
            andText:@"This is a dummy text item. Look how beautiful it is being rendered."
            withShape:circle andConnection:true andDate:date andWeight:1 andSize:medium];
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
    CGFloat red[] =   {1.0, 0.0, 0.0, 1.0};
    
    itemBackgroundColor = CGColorCreate(colorspace, red);
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
    CGContextSetFillColorWithColor(context, itemBackgroundColor);
    CGRect rect = CGRectMake(50, 50, 150, 150);
    CGContextFillRect(context, rect);
    CGContextAddRect(context, rect);
    CGContextStrokePath(context);
    
    CGPoint p;
    p.x = 50;
    p.y = 50;
    CGContextSetFillColorWithColor(context, itemTextColor);
    UIFont* font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    [item.heading drawAtPoint:p withFont:font];
    
    CGRect r = CGRectMake(50, 50 + 32, 150 - 32, 150);
    font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
    [item.text drawInRect:r withFont:font];
}

@end
