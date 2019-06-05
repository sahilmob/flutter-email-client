import "package:flutter/material.dart";

class Observer<T> extends StatelessWidget {
  @required
  final Stream<T> stream;

  @required
  final Function onSuccess;

  final Function onError;
  final Function onWating;

  Observer({this.stream, this.onSuccess, this.onWating, this.onError});

  Function get _defaultOnWaiting => (context) => Center(
        child: CircularProgressIndicator(),
      );

  Function get _defaultOnError => (context, error) => Text(error);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return onError != null
              ? onError(context, snapshot.error)
              : _defaultOnError(context, snapshot.error);
        }
        if (snapshot.hasData) {
          T data = snapshot.data;
          return onSuccess(context, data);
        } else {
          return onWating != null
              ? onWating(context)
              : _defaultOnWaiting(context);
        }
      },
    );
  }
}
