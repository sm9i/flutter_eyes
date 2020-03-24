import 'package:flutter/material.dart';

///拦截左右滑动 和向下滑动
class InterceptVerticalWidget extends StatefulWidget {
  final Widget child;
  final int indicator;
  final Function() verticalCallBack;
  final Function(AxisDirection axis) horizontalCallBack;

  const InterceptVerticalWidget({
    Key key,
    @required this.child,
    this.indicator,
    this.verticalCallBack,
    this.horizontalCallBack,
  }) : super(key: key);

  @override
  _InterceptVerticalWidgetState createState() =>
      _InterceptVerticalWidgetState();
}

class _InterceptVerticalWidgetState extends State<InterceptVerticalWidget> {
  Offset _onDown;
  Offset _onUp;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (down) => _onDown = down.position,
      onPointerUp: (up) {
        _onUp = up.position;
        _whenMoveFinish();
      },
      child: widget.child,
    );
  }

  void _whenMoveFinish() {
    //左右移
    final offsetX = _onUp.dx - _onDown.dx;
    //上下移
    final offsetY = _onUp.dy - _onDown.dy;
    //判断是左右还是上下
    if (offsetX.abs() > offsetY.abs()) {
      if (widget.horizontalCallBack != null) {
        widget.horizontalCallBack(
            offsetX > 0 ? AxisDirection.left : AxisDirection.right);
      }
    } else {
      if (offsetY < 0) {
        if (widget.verticalCallBack != null) {
          widget.verticalCallBack();
        }
      }
    }
  }
}
