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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:NSTimeIntervalSince1970];
        item = [[BHTTimeLineItem alloc] initTextItemWith:@"Hello World"
                andText:@"This is a dummy text item. Look how beautiful it is being rendered." withShape:circle andConnection:true andDate:date andWeight:1];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef color = CGColorCreate(colorspace, components);
   
    CGContextSetStrokeColorWithColor(context, color);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}

@end
