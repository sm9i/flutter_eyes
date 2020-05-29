import 'package:flutter/material.dart';
import 'package:flutter_eyes/constants/constants.dart';
import 'package:flutter_eyes/widget/status/status_widget.dart';
import 'package:provider/provider.dart';

class MultiStatusWidget extends StatelessWidget {
  const MultiStatusWidget({
    Key key,
    @required this.provider,
    @required this.content,
    this.errorTap,
    this.emptyTap,
  }) : super(key: key);

  final Widget content;
  final WidgetProvider provider;
  final GestureTapCallback errorTap;
  final GestureTapCallback emptyTap;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WidgetProvider>.value(
      value: provider,
      child: Selector<WidgetProvider, PageStatus>(
        builder: (_, PageStatus value, __) {
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
        selector: (_, WidgetProvider s) => s.status,
      ),
    );
  }
}

class WidgetProvider extends ChangeNotifier {
  PageStatus _status = PageStatus.loading;

  PageStatus get status => _status;

  void changeStatus(PageStatus status) {
    if (_status == status) {
      return;
    }
    _status = status;
    notifyListeners();
  }
}

enum PageStatus {
  content,
  empty,
  loading,
  error,
}
