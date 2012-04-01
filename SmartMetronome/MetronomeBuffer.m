//
//  MetronomeBuffer.m
//  SmartMetronome
//
//  Created by Max Woolf on 01/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MetronomeBuffer.h"
#define SAMPLE_RATE 44100

@implementation MetronomeBuffer
-(id)initWithTempo:(float)tempo
{
    float numberOfSeconds = 60.0 / tempo;
    float numberOfSamples = numberOfSeconds * SAMPLE_RATE;
    buffer = [[NSMutableArray alloc] initWithCapacity:numberOfSamples];

    //Set the first 100 samples to a sine wave
    for (int x = 0; x < 100; x++)
    {
        
        [buffer insertObject:[NSNumber numberWithFloat:[self getYforX:x]] atIndex:x];
    }
    
    
    return [self init];
}

-(float)getYforX:(float)theX
{
    return (2 * M_PI * 440 * theX) / SAMPLE_RATE; 
}
@end
