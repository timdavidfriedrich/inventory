import 'package:flutter/material.dart';

mixin TabScreen on Widget {
  String tabLabel(BuildContext context);
  Icon get tabIcon;
  Icon get tabSelectedIcon;
  Icon get tabCupertinoIcon;
  Icon get tabCupertinoSelectedIcon;
}
