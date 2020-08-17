import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quick_learn/bloc/auth/auth_bloc.dart';
import 'package:quick_learn/hooks/video_player_controller/video_player_controller.dart';
import 'package:quick_learn/router.dart';
import 'package:quick_learn/utils/firebase_helper.dart';
import 'package:quick_learn/utils/padding_helper.dart';
import 'package:quick_learn/utils/storage_helper.dart';
import 'package:quick_learn/widgets/upload_course.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final videoPath = ['video1.mp4', 'chiho.mp4'];

class HomeScreen extends HookWidget {
  final scrollController;

  final thumbnails = <Uint8List>[];
  final links = <VideoPlayerController>[];
  bool isPlaying = false;

  HomeScreen({this.scrollController});
  @override
  Widget build(BuildContext context) {
    videoPath.forEach((element) async {
      links.clear();
      final url = await StorageHelper().firebaseStorageGetUrl('/$element');
      print(url);

      final vid = VideoPlayerController.network(
        url,
      );
      vid.initialize();
      print(vid.value.aspectRatio);
      print(vid.value.size);
      links.add(vid);
    });
    final thumbnailState = useState(thumbnails);
    final videoState = useState(links);
    final _isPlaying = useState(isPlaying);
    return SafeArea(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Text('1'),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
            UploadCourse(),
            MaterialButton(
              child: Text('new course'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Log Out'),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
              },
            ),
            ListView.builder(
//              controller: scrollController,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: videoState.value.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    if (!videoState.value[i].value.isPlaying) {
                      videoState.value[i].play();
                    } else {
                      videoState.value[i].pause();
                    }
                  },
                  child: Container(
                    height: 510,
                    padding: PaddingHelper.defaultPadding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AspectRatio(
                            aspectRatio: videoState.value[i].value.aspectRatio,
                            child: VideoPlayer(videoState.value[i])),
                        Text(videoState.value[i].dataSource),
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
            Container(
              height: 200,
              child: Text('>>>>'),
            ),
          ],
        ),
      ),
    );
  }
}
