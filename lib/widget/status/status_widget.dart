import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_eyes/utils/image_util.dart';
import 'package:flutter_eyes/utils/screens.dart';
import 'package:flutter_eyes/widget/button/throttle_btn.dart';

///页面 为error 或者空数据时展示
class StatusErrorWidget extends StatelessWidget {
  final String errorMsg;
  final GestureTapCallback onTap;

  const StatusErrorWidget({Key key, this.errorMsg = '网络异常', this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Throttle(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Glide.loadAssetIcon('ic_eye_black_error.png'),
              width: setWidth(200),
            ),
            SizedBox(height: setHeight(10)),
            Text(
              errorMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}

///页面初始化的时候的page
class StatusLoadWidget extends StatefulWidget {
  @override
  _StatusLoadWidgetState createState() => _StatusLoadWidgetState();
}

class _StatusLoadWidgetState extends State<StatusLoadWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        Future.delayed(const Duration(milliseconds: 300), () {
          _animationController.forward();
        });
      }
    });
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(Duration(milliseconds: 500), () {
          if (mounted) _animationController.forward();
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    RotationTransition(
//      turns: _animationController,
//    );
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: setWidth(200),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Glide.loadAssetIcon('ic_eye_black_outer.png'),
                ),
                RotationTransition(
                  turns: _animationController,
                  child: Container(
                    child: Glide.loadAssetIcon('ic_eye_black_inner.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
