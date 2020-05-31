import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class BaseInfo {
  BaseInfo({
    this.itemList,
    this.count,
    this.total,
    this.nextPageUrl,
    this.adExist,
    this.date,
    this.nextPublishTime,
    this.dialog,
    this.topIssue,
    this.refreshCount,
    this.lastStartId,
  });

  factory BaseInfo.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<Content> itemList =
        jsonRes['itemList'] is List ? <Content>[] : null;
    if (itemList != null) {
      for (final dynamic item in jsonRes['itemList']) {
        if (item != null) {
          itemList.add(Content.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return BaseInfo(
      itemList: itemList,
      count: asT<int>(jsonRes['count']),
      total: asT<int>(jsonRes['total']),
      nextPageUrl: asT<String>(jsonRes['nextPageUrl']),
      adExist: asT<bool>(jsonRes['adExist']),
      date: asT<int>(jsonRes['date']),
      nextPublishTime: asT<int>(jsonRes['nextPublishTime']),
      dialog: asT<Object>(jsonRes['dialog']),
      topIssue:
          TopIssue.fromJson(asT<Map<String, dynamic>>(jsonRes['topIssue'])),
      refreshCount: asT<int>(jsonRes['refreshCount']),
      lastStartId: asT<int>(jsonRes['lastStartId']),
    );
  }

  List<Content> itemList;
  int count;
  int total;
  String nextPageUrl;
  bool adExist;
  int date;
  int nextPublishTime;
  Object dialog;
  TopIssue topIssue;
  int refreshCount;
  int lastStartId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'itemList': itemList,
        'count': count,
        'total': total,
        'nextPageUrl': nextPageUrl,
        'adExist': adExist,
        'date': date,
        'nextPublishTime': nextPublishTime,
        'dialog': dialog,
        'topIssue': topIssue,
        'refreshCount': refreshCount,
        'lastStartId': lastStartId,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Content {
  Content({
    this.type,
    this.data,
    this.tag,
    this.id,
    this.adIndex,
  });

  factory Content.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Content(
          type: asT<String>(jsonRes['type']),
          data:
              ContentInfo.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])),
          tag: asT<Object>(jsonRes['tag']),
          id: asT<int>(jsonRes['id']),
          adIndex: asT<int>(jsonRes['adIndex']),
        );

  String type;
  ContentInfo data;
  Object tag;
  int id;
  int adIndex;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'data': data,
        'tag': tag,
        'id': id,
        'adIndex': adIndex,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Header {
  Header({
    this.id,
    this.title,
    this.font,
    this.subTitle,
    this.subTitleFont,
    this.textAlign,
    this.cover,
    this.label,
    this.actionUrl,
    this.labelList,
    this.rightText,
    this.icon,
    this.iconType,
    this.description,
    this.time,
    this.showHateVideo,
  });

  factory Header.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Header(
          id: asT<int>(jsonRes['id']),
          title: asT<String>(jsonRes['title']),
          font: asT<Object>(jsonRes['font']),
          subTitle: asT<Object>(jsonRes['subTitle']),
          subTitleFont: asT<Object>(jsonRes['subTitleFont']),
          textAlign: asT<String>(jsonRes['textAlign']),
          cover: asT<Object>(jsonRes['cover']),
          label: asT<Object>(jsonRes['label']),
          actionUrl: asT<String>(jsonRes['actionUrl']),
          labelList: asT<Object>(jsonRes['labelList']),
          rightText: asT<Object>(jsonRes['rightText']),
          icon: asT<String>(jsonRes['icon']),
          iconType: asT<String>(jsonRes['iconType']),
          description: asT<String>(jsonRes['description']),
          time: asT<int>(jsonRes['time']),
          showHateVideo: asT<bool>(jsonRes['showHateVideo']),
        );

  int id;
  String title;
  Object font;
  Object subTitle;
  Object subTitleFont;
  String textAlign;
  Object cover;
  Object label;
  String actionUrl;
  Object labelList;
  Object rightText;
  String icon;
  String iconType;
  String description;
  int time;
  bool showHateVideo;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'font': font,
        'subTitle': subTitle,
        'subTitleFont': subTitleFont,
        'textAlign': textAlign,
        'cover': cover,
        'label': label,
        'actionUrl': actionUrl,
        'labelList': labelList,
        'rightText': rightText,
        'icon': icon,
        'iconType': iconType,
        'description': description,
        'time': time,
        'showHateVideo': showHateVideo,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class ContentInfo {
  ContentInfo({
    this.dataType,
    this.id,
    this.title,
    this.description,
    this.library,
    this.tags,
    this.consumption,
    this.resourceType,
    this.slogan,
    this.provider,
    this.category,
    this.author,
    this.cover,
    this.playUrl,
    this.thumbPlayUrl,
    this.duration,
    this.webUrl,
    this.releaseTime,
    this.playInfo,
    this.campaign,
    this.waterMarks,
    this.ad,
    this.adTrack,
    this.type,
    this.titlePgc,
    this.descriptionPgc,
    this.remark,
    this.ifLimitVideo,
    this.searchWeight,
    this.brandWebsiteInfo,
    this.idx,
    this.shareAdTrack,
    this.favoriteAdTrack,
    this.webAdTrack,
    this.date,
    this.promotion,
    this.label,
    this.labelList,
    this.descriptionEditor,
    this.collected,
    this.reallyCollected,
    this.played,
    this.subtitles,
    this.lastViewTime,
    this.playlists,
    this.src,
    this.recallSource,
    this.content,
    this.header,
    this.text,
  });

  factory ContentInfo.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<TagsInfo> tags = jsonRes['tags'] is List ? <TagsInfo>[] : null;
    if (tags != null) {
      for (final dynamic item in jsonRes['tags']) {
        if (item != null) {
          tags.add(TagsInfo.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }

    final List<PlayInfo> playInfo =
        jsonRes['playInfo'] is List ? <PlayInfo>[] : null;
    if (playInfo != null) {
      for (final dynamic item in jsonRes['playInfo']) {
        if (item != null) {
          playInfo.add(PlayInfo.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }

    final List<Object> labelList =
        jsonRes['labelList'] is List ? <Object>[] : null;
    if (labelList != null) {
      for (final dynamic item in jsonRes['labelList']) {
        if (item != null) {
          labelList.add(asT<Object>(item));
        }
      }
    }

    final List<Object> subtitles =
        jsonRes['subtitles'] is List ? <Object>[] : null;
    if (subtitles != null) {
      for (final dynamic item in jsonRes['subtitles']) {
        if (item != null) {
          subtitles.add(asT<Object>(item));
        }
      }
    }
    return ContentInfo(
      dataType: asT<String>(jsonRes['dataType']),
      id: asT<int>(jsonRes['id']),
      title: asT<String>(jsonRes['title']),
      description: asT<String>(jsonRes['description']),
      library: asT<String>(jsonRes['library']),
      tags: tags,
      consumption: ConsumptionInfo.fromJson(
          asT<Map<String, dynamic>>(jsonRes['consumption'])),
      resourceType: asT<String>(jsonRes['resourceType']),
      slogan: asT<String>(jsonRes['slogan']),
      provider:
          ProviderInfo.fromJson(asT<Map<String, dynamic>>(jsonRes['provider'])),
      category: asT<String>(jsonRes['category']),
      author: AuthorInfo.fromJson(asT<Map<String, dynamic>>(jsonRes['author'])),
      cover: CoverInfo.fromJson(asT<Map<String, dynamic>>(jsonRes['cover'])),
      playUrl: asT<String>(jsonRes['playUrl']),
      thumbPlayUrl: asT<Object>(jsonRes['thumbPlayUrl']),
      duration: asT<int>(jsonRes['duration']),
      webUrl: WebUrlInfo.fromJson(asT<Map<String, dynamic>>(jsonRes['webUrl'])),
      releaseTime: asT<int>(jsonRes['releaseTime']),
      playInfo: playInfo,
      campaign: asT<Object>(jsonRes['campaign']),
      waterMarks: asT<Object>(jsonRes['waterMarks']),
      ad: asT<bool>(jsonRes['ad']),
      adTrack: asT<Object>(jsonRes['adTrack']),
      type: asT<String>(jsonRes['type']),
      titlePgc: asT<Object>(jsonRes['titlePgc']),
      descriptionPgc: asT<Object>(jsonRes['descriptionPgc']),
      remark: asT<Object>(jsonRes['remark']),
      ifLimitVideo: asT<bool>(jsonRes['ifLimitVideo']),
      searchWeight: asT<int>(jsonRes['searchWeight']),
      brandWebsiteInfo: asT<Object>(jsonRes['brandWebsiteInfo']),
      idx: asT<int>(jsonRes['idx']),
      shareAdTrack: asT<Object>(jsonRes['shareAdTrack']),
      favoriteAdTrack: asT<Object>(jsonRes['favoriteAdTrack']),
      webAdTrack: asT<Object>(jsonRes['webAdTrack']),
      date: asT<int>(jsonRes['date']),
      promotion: asT<Object>(jsonRes['promotion']),
      label: asT<Object>(jsonRes['label']),
      labelList: labelList,
      descriptionEditor: asT<String>(jsonRes['descriptionEditor']),
      collected: asT<bool>(jsonRes['collected']),
      reallyCollected: asT<bool>(jsonRes['reallyCollected']),
      played: asT<bool>(jsonRes['played']),
      subtitles: subtitles,
      lastViewTime: asT<Object>(jsonRes['lastViewTime']),
      playlists: asT<Object>(jsonRes['playlists']),
      src: asT<int>(jsonRes['src']),
      recallSource: asT<String>(jsonRes['recallSource']),
      content: Content.fromJson(asT<Map<String, dynamic>>(jsonRes['content'])),
      header: Header.fromJson(asT<Map<String, dynamic>>(jsonRes['header'])),
      text: asT<String>(jsonRes['text']),
    );
  }

  String dataType;
  int id;
  String title;
  String description;
  String library;
  List<TagsInfo> tags;
  ConsumptionInfo consumption;
  String resourceType;
  String slogan;
  ProviderInfo provider;
  String category;
  AuthorInfo author;
  CoverInfo cover;
  String playUrl;
  Object thumbPlayUrl;
  int duration;
  WebUrlInfo webUrl;
  int releaseTime;
  List<PlayInfo> playInfo;
  Object campaign;
  Object waterMarks;
  bool ad;
  Object adTrack;
  String type;
  Object titlePgc;
  Object descriptionPgc;
  Object remark;
  bool ifLimitVideo;
  int searchWeight;
  Object brandWebsiteInfo;
  int idx;
  Object shareAdTrack;
  Object favoriteAdTrack;
  Object webAdTrack;
  int date;
  Object promotion;
  Object label;
  List<Object> labelList;
  String descriptionEditor;
  bool collected;
  bool reallyCollected;
  bool played;
  List<Object> subtitles;
  Object lastViewTime;
  Object playlists;
  int src;
  String recallSource;
  Content content;
  Header header;
  String text;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dataType': dataType,
        'id': id,
        'title': title,
        'description': description,
        'library': library,
        'tags': tags,
        'consumption': consumption,
        'resourceType': resourceType,
        'slogan': slogan,
        'provider': provider,
        'category': category,
        'author': author,
        'cover': cover,
        'playUrl': playUrl,
        'thumbPlayUrl': thumbPlayUrl,
        'duration': duration,
        'webUrl': webUrl,
        'releaseTime': releaseTime,
        'playInfo': playInfo,
        'campaign': campaign,
        'waterMarks': waterMarks,
        'ad': ad,
        'adTrack': adTrack,
        'type': type,
        'titlePgc': titlePgc,
        'descriptionPgc': descriptionPgc,
        'remark': remark,
        'ifLimitVideo': ifLimitVideo,
        'searchWeight': searchWeight,
        'brandWebsiteInfo': brandWebsiteInfo,
        'idx': idx,
        'shareAdTrack': shareAdTrack,
        'favoriteAdTrack': favoriteAdTrack,
        'webAdTrack': webAdTrack,
        'date': date,
        'promotion': promotion,
        'label': label,
        'labelList': labelList,
        'descriptionEditor': descriptionEditor,
        'collected': collected,
        'reallyCollected': reallyCollected,
        'played': played,
        'subtitles': subtitles,
        'lastViewTime': lastViewTime,
        'playlists': playlists,
        'src': src,
        'recallSource': recallSource,
        'content': content,
        'text': text,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TagsInfo {
  TagsInfo({
    this.id,
    this.name,
    this.actionUrl,
    this.adTrack,
    this.desc,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.childTagList,
    this.childTagIdList,
    this.haveReward,
    this.ifNewest,
    this.newestEndTime,
    this.communityIndex,
  });

  factory TagsInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TagsInfo(
          id: asT<int>(jsonRes['id']),
          name: asT<String>(jsonRes['name']),
          actionUrl: asT<String>(jsonRes['actionUrl']),
          adTrack: asT<Object>(jsonRes['adTrack']),
          desc: asT<Object>(jsonRes['desc']),
          bgPicture: asT<String>(jsonRes['bgPicture']),
          headerImage: asT<String>(jsonRes['headerImage']),
          tagRecType: asT<String>(jsonRes['tagRecType']),
          childTagList: asT<Object>(jsonRes['childTagList']),
          childTagIdList: asT<Object>(jsonRes['childTagIdList']),
          haveReward: asT<bool>(jsonRes['haveReward']),
          ifNewest: asT<bool>(jsonRes['ifNewest']),
          newestEndTime: asT<Object>(jsonRes['newestEndTime']),
          communityIndex: asT<int>(jsonRes['communityIndex']),
        );

  int id;
  String name;
  String actionUrl;
  Object adTrack;
  Object desc;
  String bgPicture;
  String headerImage;
  String tagRecType;
  Object childTagList;
  Object childTagIdList;
  bool haveReward;
  bool ifNewest;
  Object newestEndTime;
  int communityIndex;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'actionUrl': actionUrl,
        'adTrack': adTrack,
        'desc': desc,
        'bgPicture': bgPicture,
        'headerImage': headerImage,
        'tagRecType': tagRecType,
        'childTagList': childTagList,
        'childTagIdList': childTagIdList,
        'haveReward': haveReward,
        'ifNewest': ifNewest,
        'newestEndTime': newestEndTime,
        'communityIndex': communityIndex,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class ConsumptionInfo {
  ConsumptionInfo({
    this.collectionCount,
    this.shareCount,
    this.replyCount,
    this.realCollectionCount,
  });

  factory ConsumptionInfo.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : ConsumptionInfo(
              collectionCount: asT<int>(jsonRes['collectionCount']),
              shareCount: asT<int>(jsonRes['shareCount']),
              replyCount: asT<int>(jsonRes['replyCount']),
              realCollectionCount: asT<int>(jsonRes['realCollectionCount']),
            );

  int collectionCount;
  int shareCount;
  int replyCount;
  int realCollectionCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'collectionCount': collectionCount,
        'shareCount': shareCount,
        'replyCount': replyCount,
        'realCollectionCount': realCollectionCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class ProviderInfo {
  ProviderInfo({
    this.name,
    this.alias,
    this.icon,
  });

  factory ProviderInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : ProviderInfo(
          name: asT<String>(jsonRes['name']),
          alias: asT<String>(jsonRes['alias']),
          icon: asT<String>(jsonRes['icon']),
        );

  String name;
  String alias;
  String icon;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'alias': alias,
        'icon': icon,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class AuthorInfo {
  AuthorInfo({
    this.id,
    this.icon,
    this.name,
    this.description,
    this.link,
    this.latestReleaseTime,
    this.videoNum,
    this.adTrack,
    this.follow,
    this.shield,
    this.approvedNotReadyVideoCount,
    this.ifPgc,
    this.recSort,
    this.expert,
  });

  factory AuthorInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : AuthorInfo(
          id: asT<int>(jsonRes['id']),
          icon: asT<String>(jsonRes['icon']),
          name: asT<String>(jsonRes['name']),
          description: asT<String>(jsonRes['description']),
          link: asT<String>(jsonRes['link']),
          latestReleaseTime: asT<int>(jsonRes['latestReleaseTime']),
          videoNum: asT<int>(jsonRes['videoNum']),
          adTrack: asT<Object>(jsonRes['adTrack']),
          follow:
              FollowInfo.fromJson(asT<Map<String, dynamic>>(jsonRes['follow'])),
          shield:
              ShieldInfo.fromJson(asT<Map<String, dynamic>>(jsonRes['shield'])),
          approvedNotReadyVideoCount:
              asT<int>(jsonRes['approvedNotReadyVideoCount']),
          ifPgc: asT<bool>(jsonRes['ifPgc']),
          recSort: asT<int>(jsonRes['recSort']),
          expert: asT<bool>(jsonRes['expert']),
        );

  int id;
  String icon;
  String name;
  String description;
  String link;
  int latestReleaseTime;
  int videoNum;
  Object adTrack;
  FollowInfo follow;
  ShieldInfo shield;
  int approvedNotReadyVideoCount;
  bool ifPgc;
  int recSort;
  bool expert;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'icon': icon,
        'name': name,
        'description': description,
        'link': link,
        'latestReleaseTime': latestReleaseTime,
        'videoNum': videoNum,
        'adTrack': adTrack,
        'follow': follow,
        'shield': shield,
        'approvedNotReadyVideoCount': approvedNotReadyVideoCount,
        'ifPgc': ifPgc,
        'recSort': recSort,
        'expert': expert,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class FollowInfo {
  FollowInfo({
    this.itemType,
    this.itemId,
    this.followed,
  });

  factory FollowInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : FollowInfo(
          itemType: asT<String>(jsonRes['itemType']),
          itemId: asT<int>(jsonRes['itemId']),
          followed: asT<bool>(jsonRes['followed']),
        );

  String itemType;
  int itemId;
  bool followed;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'itemType': itemType,
        'itemId': itemId,
        'followed': followed,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class ShieldInfo {
  ShieldInfo({
    this.itemType,
    this.itemId,
    this.shielded,
  });

  factory ShieldInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : ShieldInfo(
          itemType: asT<String>(jsonRes['itemType']),
          itemId: asT<int>(jsonRes['itemId']),
          shielded: asT<bool>(jsonRes['shielded']),
        );

  String itemType;
  int itemId;
  bool shielded;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'itemType': itemType,
        'itemId': itemId,
        'shielded': shielded,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class CoverInfo {
  CoverInfo({
    this.feed,
    this.detail,
    this.blurred,
    this.sharing,
    this.homepage,
  });

  factory CoverInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : CoverInfo(
          feed: asT<String>(jsonRes['feed']),
          detail: asT<String>(jsonRes['detail']),
          blurred: asT<String>(jsonRes['blurred']),
          sharing: asT<Object>(jsonRes['sharing']),
          homepage: asT<String>(jsonRes['homepage']),
        );

  String feed;
  String detail;
  String blurred;
  Object sharing;
  String homepage;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'feed': feed,
        'detail': detail,
        'blurred': blurred,
        'sharing': sharing,
        'homepage': homepage,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class WebUrlInfo {
  WebUrlInfo({
    this.raw,
    this.forWeibo,
  });

  factory WebUrlInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : WebUrlInfo(
          raw: asT<String>(jsonRes['raw']),
          forWeibo: asT<String>(jsonRes['forWeibo']),
        );

  String raw;
  String forWeibo;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'raw': raw,
        'forWeibo': forWeibo,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class PlayInfo {
  PlayInfo({
    this.height,
    this.width,
    this.urlList,
    this.name,
    this.type,
    this.url,
  });

  factory PlayInfo.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<UrlListInfo> urlList =
        jsonRes['urlList'] is List ? <UrlListInfo>[] : null;
    if (urlList != null) {
      for (final dynamic item in jsonRes['urlList']) {
        if (item != null) {
          urlList.add(UrlListInfo.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return PlayInfo(
      height: asT<int>(jsonRes['height']),
      width: asT<int>(jsonRes['width']),
      urlList: urlList,
      name: asT<String>(jsonRes['name']),
      type: asT<String>(jsonRes['type']),
      url: asT<String>(jsonRes['url']),
    );
  }

  int height;
  int width;
  List<UrlListInfo> urlList;
  String name;
  String type;
  String url;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'height': height,
        'width': width,
        'urlList': urlList,
        'name': name,
        'type': type,
        'url': url,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class UrlListInfo {
  UrlListInfo({
    this.name,
    this.url,
    this.size,
  });

  factory UrlListInfo.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : UrlListInfo(
          name: asT<String>(jsonRes['name']),
          url: asT<String>(jsonRes['url']),
          size: asT<int>(jsonRes['size']),
        );

  String name;
  String url;
  int size;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
        'size': size,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TopIssue {
  TopIssue({
    this.type,
    this.data,
    this.tag,
    this.id,
    this.adIndex,
  });

  factory TopIssue.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TopIssue(
          type: asT<String>(jsonRes['type']),
          data: TopIssueModel.fromJson(
              asT<Map<String, dynamic>>(jsonRes['data'])),
          tag: asT<Object>(jsonRes['tag']),
          id: asT<int>(jsonRes['id']),
          adIndex: asT<int>(jsonRes['adIndex']),
        );

  String type;
  TopIssueModel data;
  Object tag;
  int id;
  int adIndex;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'data': data,
        'tag': tag,
        'id': id,
        'adIndex': adIndex,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TopIssueModel {
  TopIssueModel({
    this.dataType,
    this.itemList,
    this.count,
  });

  factory TopIssueModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<Content> itemList =
        jsonRes['itemList'] is List ? <Content>[] : null;
    if (itemList != null) {
      for (final dynamic item in jsonRes['itemList']) {
        if (item != null) {
          itemList.add(Content.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return TopIssueModel(
      dataType: asT<String>(jsonRes['dataType']),
      itemList: itemList,
      count: asT<int>(jsonRes['count']),
    );
  }

  String dataType;
  List<Content> itemList;
  int count;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dataType': dataType,
        'itemList': itemList,
        'count': count,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TagsModel {
  TagsModel({
    this.id,
    this.name,
    this.actionUrl,
    this.adTrack,
    this.desc,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.childTagList,
    this.childTagIdList,
    this.haveReward,
    this.ifNewest,
    this.newestEndTime,
    this.communityIndex,
  });

  factory TagsModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : TagsModel(
          id: asT<int>(jsonRes['id']),
          name: asT<String>(jsonRes['name']),
          actionUrl: asT<String>(jsonRes['actionUrl']),
          adTrack: asT<Object>(jsonRes['adTrack']),
          desc: asT<String>(jsonRes['desc']),
          bgPicture: asT<String>(jsonRes['bgPicture']),
          headerImage: asT<String>(jsonRes['headerImage']),
          tagRecType: asT<String>(jsonRes['tagRecType']),
          childTagList: asT<Object>(jsonRes['childTagList']),
          childTagIdList: asT<Object>(jsonRes['childTagIdList']),
          haveReward: asT<bool>(jsonRes['haveReward']),
          ifNewest: asT<bool>(jsonRes['ifNewest']),
          newestEndTime: asT<Object>(jsonRes['newestEndTime']),
          communityIndex: asT<int>(jsonRes['communityIndex']),
        );

  int id;
  String name;
  String actionUrl;
  Object adTrack;
  String desc;
  String bgPicture;
  String headerImage;
  String tagRecType;
  Object childTagList;
  Object childTagIdList;
  bool haveReward;
  bool ifNewest;
  Object newestEndTime;
  int communityIndex;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'actionUrl': actionUrl,
        'adTrack': adTrack,
        'desc': desc,
        'bgPicture': bgPicture,
        'headerImage': headerImage,
        'tagRecType': tagRecType,
        'childTagList': childTagList,
        'childTagIdList': childTagIdList,
        'haveReward': haveReward,
        'ifNewest': ifNewest,
        'newestEndTime': newestEndTime,
        'communityIndex': communityIndex,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
