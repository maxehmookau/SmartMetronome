//
//  MainView.h
//  SmartMetronome
//
//  Created by Max Woolf on 01/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAD/iAD.h>
#import "Metronome.h"
#import <AVFoundation/AVFoundation.h>
#import "InputRecorder.h"
#import "MBProgressHUD.h"

@interface MainView : UIViewController <ADBannerViewDelegate, AVAudioRecorderDelegate>
{
    IBOutlet ADBannerView *ad;
    IBOutlet UISlider *slider;
    IBOutlet UIButton *tempoButton;
    Metronome *currentMetronome;
    InputRecorder *recorder;
    NSTimer *recordTimer;
    MBProgressHUD *hud;
    int count;
}

-(IBAction)changeTempo:(id)sender;
-(IBAction)recordSample:(id)sender;
-(void)timerFireMethod:(NSTimer*)theTimer;
@end
