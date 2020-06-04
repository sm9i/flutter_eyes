import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/font_type.dart';
import 'package:flutter_eyes/model/model.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/utils/theme_util.dart';
import 'package:flutter_eyes/utils/utils.dart';
import 'package:flutter_eyes/widget/button/throttle_btn.dart';

///video页面的widget
///-[VideoWidget] 视频播放widget
///-[VideoDetailWidget] 视频详情
///-[VideoAuthorWidget]视频作者
///-[VideoRelatedListWidget]相关视频

///
class VideoWidget extends StatelessWidget {
  const VideoWidget({Key key, this.contentInfo}) : super(key: key);
  final ContentInfo contentInfo;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Container(
        color: Colors.red,
        child: Center(child: Text(contentInfo?.playUrl ?? '')),
      ),
    );
  }
}

///视频详情
class VideoDetailWidget extends StatelessWidget {
  const VideoDetailWidget({Key key, this.content}) : super(key: key);
  final ContentInfo content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            content?.title ?? '',
            style: TextStyle(
              fontSize: setSp(28),
              fontFamily: FontType.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: setHeight(10)),
            child: Text(
              '#${content?.category ?? ''}   /   ${getElapseTimeForShow(content.duration)}',
              style: TextStyle(color: Colors.white, fontSize: setSp(26)),
            ),
          ),
          Text(
            content?.description ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: setSp(24),
              fontFamily: FontType.normal,
            ),
          ),
          SizedBox(height: setHeight(20)),
          _VideoDetailBottomControl(
            content?.consumption?.collectionCount ?? 0,
            content?.consumption?.shareCount ?? 0,
            content?.consumption?.replyCount ?? 0,
          )
        ],
      ),
    );
  }
}

class _VideoDetailBottomControl extends StatelessWidget {
  _VideoDetailBottomControl(
      this.favoriteCount, this.shareCount, this.replayCount)
      : super(
          key: Key('${favoriteCount + shareCount + replayCount}'),
        );
  final int favoriteCount;
  final int shareCount;
  final int replayCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _iconWidget(Icons.favorite_border, '$favoriteCount'),
        _iconWidget(Icons.share, '$shareCount'),
        _iconWidget(Icons.chat, '$replayCount'),
        _iconWidget(Icons.file_download, '缓存'),
      ],
    );
  }

  Widget _iconWidget(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: Colors.white, size: setSp(35)),
        SizedBox(width: setWidth(20)),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

///视频作者信息
class VideoAuthorWidget extends StatelessWidget {
  const VideoAuthorWidget({Key key, this.authorInfo}) : super(key: key);
  final AuthorInfo authorInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height: 1, color: ThemeUtil.dividerColor),
        Padding(
          padding: EdgeInsets.all(setWidth(30)),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: setWidth(90),
                height: setWidth(90),
                child: ClipOval(
                  child: Glide.loadImage(authorInfo.icon),
                ),
              ),
              SizedBox(width: setWidth(20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      authorInfo.name,
                      style: TextStyle(
                        fontSize: setSp(24),
                        color: Colors.white,
                        fontFamily: FontType.bold,
                      ),
                    ),
                    SizedBox(height: setHeight(5)),
                    Text(
                      authorInfo.description,
                      style: TextStyle(
                          fontSize: setSp(22),
                          color: Colors.white,
                          fontFamily: FontType.normal),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: setWidth(20)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  border: Border.all(color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: setWidth(10),
                  vertical: setHeight(5),
                ),
                child: Text(
                  '+关注',
                  style: TextStyle(color: Colors.white, fontSize: setSp(24)),
                ),
              ),
            ],
          ),
        ),
        Container(height: 1, color: ThemeUtil.dividerColor),
      ],
    );
  }
}

///相关视频的item
class VideoRelatedListWidget extends StatelessWidget {
  const VideoRelatedListWidget(
      {Key key, @required this.relatedVideo, @required this.onRelatedTap})
      : super(key: key);
  final List<Content> relatedVideo;
  final void Function(Content content) onRelatedTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          relatedVideo.map((Content content) => itemBuild(content)).toList(),
    );
  }

  Widget itemBuild(Content content) {
    if (content.type == 'textCard') {
      return textCardWidget(content);
    } else if (content.type == 'videoSmallCard') {
      return videoSmallCardWidget(content);
    } else {
      return Container();
    }
  }

  Widget textCardWidget(Content content) {
    return Padding(
      padding: EdgeInsets.all(setWidth(30)),
      child: Text(
        '${content?.data?.text ?? ''}  >',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget videoSmallCardWidget(Content content) {
    return Throttle(
      onTap: () {
        onRelatedTap(content);
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(setWidth(30)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 13 / 7,
                    child: Glide.loadImage(
                      content.data.cover.feed,
                      fit: BoxFit.cover,
                    ),
                  ),
                  flex: 4,
                ),
                SizedBox(width: setWidth(15)),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: setHeight(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          content?.data?.title ?? '',
                          style: TextStyle(
                              fontFamily: FontType.bold,
                              color: Colors.white,
                              fontSize: setSp(30)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: setHeight(10)),
                          child: Text(
                            '${content?.data?.category ?? ''}   /   ${getElapseTimeForShow(content?.data?.duration ?? 0)}',
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(height: 1, color: ThemeUtil.dividerColor),
        ],
      ),
    );
  }
}
///相关视频结束
class VideoEndWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(100),
      child: Center(
        child: Text(
          '-The End-',
          style: TextStyle(
            fontFamily: FontType.lobster,
            color: Colors.white,
            fontSize: setSp(30),
          ),
        ),
      ),
    );
  }
}
