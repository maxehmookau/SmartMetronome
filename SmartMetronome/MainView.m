//
//  MainView.m
//  SmartMetronome
//
//  Created by Max Woolf on 01/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "Metronome.h"

@interface MainView ()

@end

@implementation MainView

#pragma mark - Alter Metronome
-(void)changeTempo:(id)sender
{
    [currentMetronome stop];
    currentMetronome = nil;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.roundingIncrement = [NSNumber numberWithDouble:1];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    currentMetronome = [[Metronome alloc] initWithInitialBPM:[slider value]];
    [currentMetronome start];
    [tempoButton setTitle:[formatter stringFromNumber:[NSNumber numberWithFloat:[slider value]]] forState: UIControlStateNormal];
}

-(void)recordSample:(id)sender
{
    [hud setLabelText:@"Recording"];
    [hud setDimBackground:YES];
    [hud show:YES];
    [self.view addSubview:hud];
    count = 0;
    NSError *error = nil;
    recorder = [[InputRecorder alloc] initWithURL:nil settings:nil error:&error];
    [recorder setDelegate:self];
    [recorder record];
    recordTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:recordTimer forMode:NSDefaultRunLoopMode];
    [recordTimer fire];
}


- (void)timerFireMethod:(NSTimer*)theTimer
{
    if(count >= 10)
    {
        [recorder stop];
        [hud setLabelText:@"Analysing"];
    }else{
        count++;
        NSLog(@"%i", count);
    }
}



#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [hud setMode:MBProgressHUDModeIndeterminate];
    ad.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait, nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - AVAudioRecorderDelegate 
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    NSLog(@"Successful: %@", [self->recorder getFilePath]);
}

-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    NSLog(@"Error");
}

@end
