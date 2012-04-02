#import "Metronome.h"

@implementation Metronome
@synthesize beatsPerMinute;

-(id)initWithInitialBPM:(int)speed
{
    float bpm = speed;
    float timeInterval = 60.0/bpm;
    NSLog(@"%f", timeInterval);
    tickTimer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:tickTimer forMode:NSDefaultRunLoopMode];
    NSError *error = nil;
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"Pop-02"
                                              withExtension:@"wav"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    return self;
}

-(void)start
{
    if([tickTimer isValid])
    {
        [tickTimer fire];
    }else{
        [NSException raise:@"MMTimerNotValidException" format:@"You're trying to fire a non-valid timer!"];
    }
}

-(void)stop
{
    [tickTimer invalidate];
}

- (void)timerFireMethod:(NSTimer*)theTimer
{
    [audioPlayer play];
}


@end
