import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useVideoPlayerController(
    {VideoPlayerController videoPlayerControllerCallback}) {
  return use(
    _VideoPlayerControllerHook(videoPlayerControllerCallback),
  );
}

class _VideoPlayerControllerHook extends Hook<VideoPlayerController> {
  final videoPlayerControllerEntity;

  _VideoPlayerControllerHook(this.videoPlayerControllerEntity);
  @override
  HookState<VideoPlayerController, Hook<VideoPlayerController>> createState() =>
      _VideoPlayerControllerHookState(videoPlayerControllerEntity);
}

class _VideoPlayerControllerHookState
    extends HookState<VideoPlayerController, _VideoPlayerControllerHook> {
  VideoPlayerController controller;
  final VideoPlayerController videoPlayerControllerEntity;

  _VideoPlayerControllerHookState(this.videoPlayerControllerEntity);
  @override
  void initHook() {
    controller = videoPlayerControllerEntity..initialize();
  }

  @override
  VideoPlayerController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();
}

class _ScrollControllerHook extends Hook<ScrollController> {
  const _ScrollControllerHook({
    this.initialScrollOffset,
    this.keepScrollOffset,
    this.debugLabel,
    List<Object> keys,
  }) : super(keys: keys);

  final double initialScrollOffset;
  final bool keepScrollOffset;
  final String debugLabel;

  @override
  HookState<ScrollController, Hook<ScrollController>> createState() =>
      _ScrollControllerHookState();
}

class _ScrollControllerHookState
    extends HookState<ScrollController, _ScrollControllerHook> {
  ScrollController controller;

  @override
  void initHook() {
    controller = ScrollController(
      initialScrollOffset: hook.initialScrollOffset,
      keepScrollOffset: hook.keepScrollOffset,
      debugLabel: hook.debugLabel,
    );
  }

  @override
  ScrollController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();
}
