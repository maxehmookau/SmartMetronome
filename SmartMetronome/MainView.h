//
//  MainView.h
//  SmartMetronome
//
//  Created by Max Woolf on 01/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAD/iAD.h>

@interface MainView : UIViewController <ADBannerViewDelegate>
{
    IBOutlet ADBannerView *ad;
}
@end
