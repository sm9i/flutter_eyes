import 'package:flutter/material.dart';

///拦截左右滑动 和向下滑动
class InterceptVerticalWidget extends StatefulWidget {
  const InterceptVerticalWidget({
    Key key,
    @required this.child,
    this.verticalCallBack,
    this.horizontalCallBack,
  }) : super(key: key);

  final Widget child;
  final Function() verticalCallBack;
  final Function(AxisDirection axis) horizontalCallBack;

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
      onPointerDown: (PointerDownEvent down) => _onDown = down.position,
      onPointerUp: (PointerUpEvent up) {
        _onUp = up.position;
        _whenMoveFinish();
      },
      child: widget.child,
    );
  }

  void _whenMoveFinish() {
    //左右移
    final double offsetX = _onUp.dx - _onDown.dx;
    //上下移
    final double offsetY = _onUp.dy - _onDown.dy;
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
