import 'package:flutter/material.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/ui/video/provider/video_provider.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/widget/video_widget.dart';
import 'package:provider/provider.dart';

///视频播放页面
///[videoInfo]
///[videosInfo]
///[defaultIndex]
class VideoPage extends StatefulWidget {
  VideoPage({
    Key key,
    @required this.currentInfo,
    @required this.videosInfo,
    @required this.defaultIndex,
  })  : assert(currentInfo != null && videosInfo != null),
        super(key: key);

  final ContentInfo currentInfo;
  final List<Content> videosInfo;
  final int defaultIndex;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoProvider _videoProvider;

  @override
  void initState() {
    _videoProvider = VideoProvider(
        widget.currentInfo, widget.videosInfo, widget.defaultIndex);
    _videoProvider.getRelatedVideoInfo();
    super.initState();
  }

  @override
  void dispose() {
    _videoProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //实现不了
    // decoration: BoxDecoration(
    //                image: DecorationImage(image: Image.network('http://icon.qiantucdn.com/static/images/show2_1/show-business.png').image),
    //                gradient: const LinearGradient(
    //                  colors: <Color>[
    //                    Colors.black12,
    //                    Colors.transparent,
    //                  ],
    //                  begin: Alignment.topCenter,
    //                  end: Alignment.bottomCenter,
    //                ),
    //              ),
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ChangeNotifierProvider<VideoProvider>.value(
          value: _videoProvider,
          child: Selector<VideoProvider, ContentInfo>(
            builder: (_, ContentInfo value, __) => Column(
              children: <Widget>[
                VideoWidget(contentInfo: value),
                //视频详情
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Glide.loadImage(value.cover.blurred,
                            fit: BoxFit.fitHeight),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.black26,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: ListView(
                          children: <Widget>[
                            VideoDetailWidget(content: value),
                            //视频作者
                            VideoAuthorWidget(authorInfo: value.author),
                            Selector<VideoProvider, List<Content>>(
                              selector: (_, VideoProvider provider) =>
                                  provider.relatedVideo,
                              builder: (_, List<Content> value, __) =>
                                  VideoRelatedListWidget(
                                relatedVideo: value,
                                onRelatedTap: _videoProvider.onRelatedTap,
                              ),
                            ),
                            VideoEndWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            selector: (_, VideoProvider provider) => provider.currentInfo,
          ),
        ),
      ),
    );
  }
}
