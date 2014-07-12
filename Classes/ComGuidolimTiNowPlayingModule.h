/**
 * Copyright (c) 2014 Bruno Guidolim
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"

@interface ComGuidolimTiNowPlayingModule : TiModule 

@property (nonatomic,readonly) NSNumber *PLAY;
@property (nonatomic,readonly) NSNumber *PAUSE;
@property (nonatomic,readonly) NSNumber *STOP;
@property (nonatomic,readonly) NSNumber *PLAY_PAUSE;
@property (nonatomic,readonly) NSNumber *NEXT;
@property (nonatomic,readonly) NSNumber *PREV;
@property (nonatomic,readonly) NSNumber *START_SEEK_BACK;
@property (nonatomic,readonly) NSNumber *END_SEEK_BACK;
@property (nonatomic,readonly) NSNumber *START_SEEK_FORWARD;
@property (nonatomic,readonly) NSNumber *END_SEEK_FORWARD;

@end
