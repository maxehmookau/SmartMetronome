#import "InputRecorder.h"


#pragma mark - Initialisation
@implementation InputRecorder
-(id)initWithURL:(NSURL *)url settings:(NSDictionary *)settings error:(NSError *__autoreleasing *)outError
{
    //Initialise object with forced settings.
    self = [super initWithURL:[self getFilePath] settings:[self getSettingsDictionary] error:outError];
    return self;
}


#pragma mark - Get Settings
-(NSDictionary *)getSettingsDictionary
{
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] init];
    [settings setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    [settings setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [settings setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    [settings setValue:[NSNumber numberWithInt:32] forKey:AVLinearPCMBitDepthKey];
    return settings;
}

-(NSURL *)getFilePath
{
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);    
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:@"sound.wav"];
    NSURL *newURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    return newURL;
}
@end
