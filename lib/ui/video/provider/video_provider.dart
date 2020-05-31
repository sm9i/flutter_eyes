import 'package:flutter/material.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/net/api.dart';
import 'package:flutter_eyes/utils/net/net_util.dart';

///video播放页面的控制器
///[currentInfo] 当前播放的视频
///[videosInfo] 所有视频的列表
///[defaultIndex] 当前播放的index
class VideoProvider extends ChangeNotifier {
  VideoProvider(this._currentInfo, this._videosInfo, this._defaultIndex){
    print(" provider buidl");
  }

  final ContentInfo _currentInfo;
  final List<Content> _videosInfo;
  final int _defaultIndex;

  List<Content> _relatedVideo = [];

  //下一个视频
  void nextVideo() {}

  //上一个视频
  void previousVideo() {}

  ///获取相关video
  Future<void> getRelatedVideoInfo() async {
    _relatedVideo = List<Content>.of(
      BaseInfo.fromJson(await NetUtil.get<Map<String, dynamic>>(
              Api.relatedVideo,
              queryParameters: <String, dynamic>{'id': _currentInfo.id}))
          .itemList,
    );
    notifyListeners();
  }

  ContentInfo get currentInfo => _currentInfo;

  List<Content> get videosInfo => _videosInfo;

  int get defaultIndex => _defaultIndex;

  List<Content> get relatedVideo => _relatedVideo;
}
