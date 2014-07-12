/**
 * Copyright (c) 2014 Bruno Guidolim
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComGuidolimTiNowPlayingModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>

@implementation ComGuidolimTiNowPlayingModule

MAKE_SYSTEM_PROP(PLAY,UIEventSubtypeRemoteControlPlay);
MAKE_SYSTEM_PROP(PAUSE,UIEventSubtypeRemoteControlPause);
MAKE_SYSTEM_PROP(STOP,UIEventSubtypeRemoteControlStop);
MAKE_SYSTEM_PROP(PLAY_PAUSE,UIEventSubtypeRemoteControlTogglePlayPause);
MAKE_SYSTEM_PROP(NEXT,UIEventSubtypeRemoteControlNextTrack);
MAKE_SYSTEM_PROP(PREV,UIEventSubtypeRemoteControlPreviousTrack);
MAKE_SYSTEM_PROP(START_SEEK_BACK,UIEventSubtypeRemoteControlBeginSeekingBackward);
MAKE_SYSTEM_PROP(END_SEEK_BACK,UIEventSubtypeRemoteControlEndSeekingBackward);
MAKE_SYSTEM_PROP(START_SEEK_FORWARD,UIEventSubtypeRemoteControlBeginSeekingForward);
MAKE_SYSTEM_PROP(END_SEEK_FORWARD,UIEventSubtypeRemoteControlEndSeekingForward);

#pragma Public APIs
-(void)setInfo:(id)obj
{
    ENSURE_SINGLE_ARG(obj,NSDictionary);
    NSMutableDictionary *nowPlayingInfo = [NSMutableDictionary new];
    
    if ([obj objectForKey:@"albumTitle"] != nil) {
        [nowPlayingInfo setObject:[obj objectForKey:@"albumTitle"] forKey:MPMediaItemPropertyAlbumTitle];
    }
    
    if ([obj objectForKey:@"artistName"] != nil) {
        [nowPlayingInfo setObject:[obj objectForKey:@"artistName"] forKey:MPMediaItemPropertyArtist];
    }
    
    if ([obj objectForKey:@"songTitle"] != nil) {
        [nowPlayingInfo setObject:[obj objectForKey:@"songTitle"] forKey:MPMediaItemPropertyTitle];
    }
    
    if ([obj objectForKey:@"albumCover"] != nil) {
        NSString *imagePath = [self getPathToApplicationAsset:[obj objectForKey:@"albumCover"]];
        UIImage *albumImage = [UIImage imageWithContentsOfFile:imagePath];
        MPMediaItemArtwork *albumCover = [[MPMediaItemArtwork alloc] initWithImage:albumImage];
        
        [nowPlayingInfo setObject:albumCover forKey:MPMediaItemPropertyArtwork];
    }
    
    if (nowPlayingInfo.count > 0) {
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nowPlayingInfo];
    }
}

-(void)clear:(id)args
{
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nil];
}

#pragma mark - Custom Methods
-(NSString*)getPathToApplicationAsset:(NSString *)fileName
{
	NSString *result = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    
	return result;
}

-(void)remoteControlEvents:(NSNotification *)notification
{
    UIEvent *event = [[notification userInfo] objectForKey:@"event"];
    NSDictionary *e = [NSDictionary dictionaryWithObject:NUMINT(event.subtype) forKey:@"action"];
    
    [self fireEvent:@"RemoteControl" withObject:e];
}

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"0c647c2e-1db3-4fe0-8f3e-dae9a5ebbd1f";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.guidolim.TiNowPlaying";
}

#pragma mark Lifecycle
-(void)startup
{
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(remoteControlEvents:) name:kTiRemoteControlNotification object:nil];
}

-(void)shutdown:(id)sender
{
	[super shutdown:sender];
}

#pragma mark Cleanup
-(void)dealloc
{
	[super dealloc];
}

#pragma mark Internal Memory Management
-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	[super didReceiveMemoryWarning:notification];
}

@end
