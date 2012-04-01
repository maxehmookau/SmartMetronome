#import "MetronomeBuffer.h"
#define SAMPLE_RATE 44100
#define FREQUENCY 1000

@implementation MetronomeBuffer
-(id)initWithTempo:(float)tempo
{
    float numberOfSeconds = 60.0 / tempo;
    float numberOfSamples = numberOfSeconds * SAMPLE_RATE;
    buffer = [[NSMutableArray alloc] initWithCapacity:numberOfSamples];

    //Set the first 100 samples to a sine wave
    for (int x = 0; x < numberOfSamples; x++)
    {
        if(x < 1000)
        {
            [buffer insertObject:[NSNumber numberWithFloat:[self getYforX:x]] atIndex:x];
        }else{
            [buffer insertObject:[NSNumber numberWithFloat:0.0f] atIndex:x];
        }
        
    }
    return [self init];
}

-(float)getYforX:(float)theX
{
    return sin((2 * M_PI * FREQUENCY * theX) / SAMPLE_RATE) ;
}
@end
