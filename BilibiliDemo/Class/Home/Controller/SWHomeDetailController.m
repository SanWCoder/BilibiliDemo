//
//  SWHomeDetailController.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWHomeDetailController.h"
#import "Header.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "SWPlayController.h"
#import "SWHomeHeaderView.h"
#import "SWHomeViewModel.h"
@interface SWHomeDetailController ()

@property (nonatomic,retain)id <IJKMediaPlayback> player;
/**
 *  控制层视图
 */
@property (nonatomic,weak) SWPlayController *controllView;
/**
 *  播放视频视图
 */
@property (nonatomic,weak) SWHomeHeaderView *disPlayView;

@property (nonatomic,strong) NSURL *url;
@end

@implementation SWHomeDetailController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
    if (![_player isPlaying]) {
        [_player prepareToPlay];
    }
}
- (void)viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    kWeakSelf(weakSelf);
    
    weakSelf.navigationController.navigationBarHidden = YES;
    weakSelf.view.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
    
    weakSelf.url = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    
    SWHomeHeaderView *disPlayView = [[SWHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
    weakSelf.disPlayView = disPlayView;
    [weakSelf.view addSubview:disPlayView];
    
    _player = [[IJKFFMoviePlayerController alloc]initWithContentURL:self.url withOptions:nil];
    UIView *player = [_player view];
    player.frame = self.disPlayView.frame;
    
    SWPlayController *controllView = [[SWPlayController alloc]initWithFrame:disPlayView.frame];
    weakSelf.controllView = controllView;
    controllView.hidden = YES;
    
    controllView.backBlock = ^{
        [self.player shutdown];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    controllView.playOrPauseBlock = ^(UIButton *playOrPauseBtn){
        if (playOrPauseBtn.selected) {
            [weakSelf.player pause];
        }
        else
        {
            [weakSelf.player play];
        }
    };
    controllView.hideBlock = ^(UIView *controllView){
        
        controllView.hidden = !controllView.hidden;
    };
    
    
    [player insertSubview:_controllView atIndex:1];
    
    [weakSelf.disPlayView insertSubview:player atIndex:1];
    
    [_player setScalingMode:IJKMPMovieScalingModeAspectFill];
    
    [self addPlayerNotification];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.controllView.hidden = !self.controllView.hidden;
}

- (void)addPlayerNotification
{
    [kNotificationCenter addObserver:self
                            selector:@selector(loadStateDidChange:)
                                name:IJKMPMoviePlayerLoadStateDidChangeNotification
                              object:_player];
    [kNotificationCenter addObserver:self
                            selector:@selector(moviePlayBackFinish:)
                                name:IJKMPMoviePlayerPlaybackDidFinishNotification
                              object:_player];
    
    [kNotificationCenter addObserver:self
                            selector:@selector(mediaIsPreparedToPlayDidChange:)
                                name:IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification
                              object:_player];
    
    [kNotificationCenter addObserver:self
                            selector:@selector(moviePlayBackStateDidChange:)
                                name:IJKMPMoviePlayerPlaybackStateDidChangeNotification
                              object:_player];
}
- (void)loadStateDidChange:(NSNotification *)notification{
    NSLog(@"loadStateDidChange");
    //    self.player = (IJKFFMoviePlayerController *)_player;
    NSLog(@"loadState = %d",_player.loadState);
    if (_player.loadState == 3) {
        
        self.disPlayView.backgroundColor = [UIColor clearColor];
        self.disPlayView.messageLabel.hidden = YES;
        self.disPlayView.backBtn.hidden = YES;
        self.disPlayView.fillScreenBtn.hidden = YES;
        self.disPlayView.loadingImge.hidden = YES;
        self.controllView.hidden = NO;
    }
}
- (void)moviePlayBackFinish:(NSNotification *)notification{
    NSLog(@"moviePlayBackFinish");
}
- (void)mediaIsPreparedToPlayDidChange:(NSNotification *)notification{
    NSLog(@"playbackState = %d",_player.playbackState);
    NSLog(@"mediaIsPreparedToPlayDidChange");
    
}
- (void)moviePlayBackStateDidChange:(NSNotification *)notification{
    NSLog(@"moviePlayBackStateDidChange");
}

@end
