import 'package:flutter/material.dart';

class BackButtonAppBarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final dynamic callback;
  const BackButtonAppBarWidget({
    super.key,
    this.onTap,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ??
          () {
            Navigator.pop(context, callback);
          },
      icon: const Icon(
        Icons.keyboard_arrow_left,
        color: Colors.white,
      ),
    );
  }
}
