import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_learn/hooks/video_player_controller/video_player_controller.dart';
import 'package:quick_learn/models/hive/user/user.dart';
import 'package:quick_learn/widgets/bottom_nav_bar_primary.dart';
import 'package:quick_learn/widgets/upload_course.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

main() async {
//  Hive
  await Hive.initFlutter();
  Hive.registerAdapter<UserProfile>(UserProfileAdapter());
  await Hive.openBox<UserProfile>('userProfile');
  runApp(QuickLearnApp());
}

class QuickLearnApp extends HookWidget {
  Future<String> _generateThumbnail(int videoHeight) async {
    final uint8list = await VideoThumbnail.thumbnailFile(
      video:
          "https://firebasestorage.googleapis.com/v0/b/quicklearn-01.appspot.com/o/video1.mp4?alt=media&token=2288f7ab-e920-473d-959d-2b97968eff9c",
      thumbnailPath: (await getTemporaryDirectory()).path,
      timeMs: 84000,
      imageFormat: ImageFormat.WEBP,
      maxHeight:
          videoHeight, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    return uint8list;
  }

  @override
  Widget build(BuildContext context) {
    final videoPlayerController = useVideoPlayerController(
        videoPlayerControllerCallback: VideoPlayerController.network(
            'https://firebasestorage.googleapis.com/v0/b/quicklearn-01.appspot.com/o/video1.mp4?alt=media&token=2288f7ab-e920-473d-959d-2b97968eff9c'));
//    videoPlayerController.play();
//    final videoHeight = videoPlayerController.value.size.height;
    final ValueNotifier<dynamic> newState = useState(null);
    _generateThumbnail(500).then((v) {
      newState.value = v;
      final newFile = File(v);
    }).catchError((onError) {
      print('thumbnail error');
      print(onError);
    });

    print(newState);
    final singleChildScrollController = useScrollController();
    final showFloating = useState(true);
    singleChildScrollController.addListener(() {
      if (singleChildScrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showFloating.value = false;
        print('kebawah');
      } else {
        showFloating.value = true;

        print('keatas');
      }
    });
    final tickerProvider = useSingleTickerProvider();
    final tabController =
        useTabController(initialLength: 3, vsync: tickerProvider);
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        drawer: Drawer(
          child: Container(
            width: 200,
            child: Column(
              children: [
                DrawerHeader(
                  child: FlutterLogo(),
                ),
                Text('Hi'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBarPrimary(
          tabCtrl: tabController,
        ),
        floatingActionButton: Opacity(
          opacity: showFloating.value ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            SingleChildScrollView(
              controller: singleChildScrollController,
              child: Container(
                width: 300,
                color: Colors.blue,
                child: Column(
                  children: [
                    Text('1'),
                    showFloating.value
                        ? Text('ditampilkan')
                        : Text('disembunyikan'),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      child: StandardVideoPlayer(
                        videoPlayerController: videoPlayerController,
                        newState: newState,
                      ),
                    ),
                    UploadCourse(),
                    Text(newState.value ?? 'no data'),
                    Image.file(
                      File(newState.value ?? ''),
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
                    Container(
                      height: 200,
                      child: Text('>>>>'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              color: Colors.green,
              child: Text('2'),
            ),
            Container(
              width: 300,
              color: Colors.amber,
              child: Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}

class StandardVideoPlayer extends StatefulWidget {
  const StandardVideoPlayer({
    Key key,
    @required this.videoPlayerController,
    @required this.newState,
    this.isAutoPlay = false,
  }) : super(key: key);

  final VideoPlayerController videoPlayerController;
  final ValueNotifier newState;
  final bool isAutoPlay;

  @override
  _StandardVideoPlayerState createState() => _StandardVideoPlayerState();
}

class _StandardVideoPlayerState extends State<StandardVideoPlayer> {
  bool isPlayed = false;
  bool displayControl = false;
  FlickManager flickManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPlayed = widget.isAutoPlay ? true : false;
    flickManager = FlickManager(
      videoPlayerController: widget.videoPlayerController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
    );
//    return Stack(
//      children: [
//        GestureDetector(
//          onTap: () {
////                        videoPlayerController.
//            setState(() {
//              displayControl = !displayControl;
//            });
//          },
//          child: AspectRatio(
//            aspectRatio: widget.videoPlayerController.value.aspectRatio,
//            child: VideoPlayer(widget.videoPlayerController),
//          ),
//        ),
//        if (displayControl) ...[
//          Positioned.fill(
//              child: Positioned.fill(
//            child: Center(
//              child: ClipOval(
//                child: widget.videoPlayerController.value.isPlaying
//                    ? InkWell(
//                        onTap: () {
//                          print('tapped');
//                          widget.videoPlayerController.pause();
//                          setState(() {
//                            isPlayed = true;
//                          });
//                        },
//                        child: Container(
//                          color: Colors.white,
//                          width: 40,
//                          height: 40,
//                          child: Icon(Icons.pause),
//                        ),
//                      )
//                    : InkWell(
//                        onTap: () {
//                          print('tapped');
//                          widget.videoPlayerController.play();
//                          setState(() {
//                            isPlayed = true;
//                          });
//                        },
//                        child: Container(
//                          color: Colors.white,
//                          width: 40,
//                          height: 40,
//                          child: Icon(Icons.play_arrow),
//                        ),
//                      ),
//              ),
//            ),
//          ))
//        ],
//        if (!isPlayed) ...[
//          Positioned.fill(
//            child: Image.file(
//              File(widget.newState.value ?? ''),
//              fit: BoxFit.cover,
//            ),
//          ),
//          Positioned.fill(
//            child: Center(
//              child: ClipOval(
//                child: InkWell(
//                  onTap: () {
//                    print('tapped');
//                    widget.videoPlayerController.play();
//                    setState(() {
//                      isPlayed = true;
//                    });
//                  },
//                  child: Container(
//                    color: Colors.white,
//                    width: 40,
//                    height: 40,
//                    child: Icon(Icons.play_arrow),
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ]
//      ],
//    );
  }
}
