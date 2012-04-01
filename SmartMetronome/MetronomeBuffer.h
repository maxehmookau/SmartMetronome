//
//  MetronomeBuffer.h
//  SmartMetronome
//
//  Created by Max Woolf on 01/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MetronomeBuffer : NSObject
{
    NSMutableArray *buffer;
}

-(id)initWithTempo:(float)tempo;
-(float)getYforX:(float)theX;
@end
