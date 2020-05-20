import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/constants.dart';
import 'package:flutter_eyes/widget/button/throttle_btn.dart';
import 'package:flutter_eyes/widget/status/status_widget.dart';
import 'package:provider/provider.dart';

class MultiStatusWidget extends StatelessWidget {
  final Widget content;
  final WidgetProvider provider;
  final GestureTapCallback errorTap;
  final GestureTapCallback emptyTap;

  const MultiStatusWidget({
    Key key,
    @required this.provider,
    @required this.content,
    this.errorTap,
    this.emptyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Selector<WidgetProvider, PageStatus>(
        builder: (_, value, __) {
          if (value == PageStatus.loading) {
            return Container(
              child: Center(child: StatusLoadWidget()),
            );
          } else if (value == PageStatus.error) {
            return Center(
              child: StatusErrorWidget(
                onTap: errorTap,
                errorMsg: Constants.messageNetError,
              ),
            );
          } else if (value == PageStatus.empty) {
            return Container(
              child: Center(
                child: StatusErrorWidget(
                  onTap: emptyTap,
                  errorMsg: Constants.messageEmpty,
                ),
              ),
            );
          } else {
            return content;
          }
        },
        selector: (_, s) => s.status,
      ),
    );
  }
}

class WidgetProvider extends ChangeNotifier {
  PageStatus _status = PageStatus.loading;

  PageStatus get status => _status;

  void changeStatus(PageStatus status) {
    if (_status == status) return;
    this._status = status;
    notifyListeners();
  }
}

enum PageStatus {
  content,
  empty,
  loading,
  error,
}
