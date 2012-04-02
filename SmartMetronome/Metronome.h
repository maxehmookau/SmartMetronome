#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Metronome : NSObject
{
    NSTimer *tickTimer;
    int beatsPerMinute;
    AVAudioPlayer *audioPlayer;
}

-(id)initWithInitialBPM:(int)speed;
-(void)timerFireMethod:(NSTimer*)theTimer;
-(void)start;
-(void)stop;

@property (readwrite) int beatsPerMinute;
@end
