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

@interface MainView : UIViewController <ADBannerViewDelegate>
{
    IBOutlet ADBannerView *ad;
    IBOutlet UISlider *slider;
    IBOutlet UIButton *tempoButton;
    Metronome *currentMetronome;
}

-(IBAction)changeTempo:(id)sender;
@end
