import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanallartv_flutter/channels/models/channel_model.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player_hls/better_player_hls.dart';

class ChannelWatchScreen extends StatefulWidget {
  Channel channel;

  ChannelWatchScreen(this.channel);

  @override
  State<ChannelWatchScreen> createState() => _ChannelWatchScreenState();
}

class _ChannelWatchScreenState extends State<ChannelWatchScreen> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
          "http://fayllar1.ru/21/Seriallar/Vikinglar/Vikinglar%20f01q07-qism%20O'zbek%20tilida%20(asilmedia.net).mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
            fullScreenByDefault: true,
            autoPlay: true,
            deviceOrientationsAfterFullScreen: [
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeRight
            ],
            allowedScreenSleep: false,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
