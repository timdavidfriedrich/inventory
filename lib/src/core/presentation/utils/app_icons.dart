import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/core/presentation/extensions/context_extensions.dart';

class AppIcons {
  const AppIcons._();

  static IconData ai(BuildContext context) {
    return context.isIos ? CupertinoIcons.sparkles : Icons.auto_awesome_outlined;
  }

  static IconData archive(BuildContext context) {
    return context.isIos ? CupertinoIcons.archivebox : Icons.archive_outlined;
  }

  static IconData error(BuildContext context) {
    return context.isIos ? CupertinoIcons.exclamationmark_triangle : Icons.warning_amber_rounded;
  }

  static IconData settings(BuildContext context) {
    return context.isIos ? CupertinoIcons.settings : Icons.settings_outlined;
  }

  static IconData save(BuildContext context) {
    return context.isIos ? CupertinoIcons.floppy_disk : Icons.save;
  }

  static IconData add(BuildContext context) {
    return context.isIos ? CupertinoIcons.add : Icons.add;
  }

  static IconData search(BuildContext context) {
    return context.isIos ? CupertinoIcons.search : Icons.search_outlined;
  }

  static IconData camera(BuildContext context) {
    return context.isIos ? CupertinoIcons.camera : Icons.camera_alt_outlined;
  }

  static IconData manage(BuildContext context) {
    return context.isIos ? CupertinoIcons.slider_horizontal_3 : Icons.tune_outlined;
  }

  static IconData more(BuildContext context) {
    return context.isIos ? CupertinoIcons.ellipsis_vertical : Icons.more_vert_outlined;
  }

  static IconData undo(BuildContext context) {
    return context.isIos ? CupertinoIcons.arrow_uturn_left : Icons.undo_outlined;
  }

  static IconData overview(BuildContext context) {
    return context.isIos ? CupertinoIcons.rectangle_grid_2x2 : Icons.dashboard_outlined;
  }

  static IconData overviewSelected(BuildContext context) {
    return context.isIos ? CupertinoIcons.rectangle_grid_2x2_fill : Icons.dashboard;
  }

  static IconData declutter(BuildContext context) {
    return context.isIos
        ? CupertinoIcons.rectangle_on_rectangle_angled
        : Icons.cleaning_services_outlined;
  }

  static IconData declutterSelected(BuildContext context) {
    return context.isIos
        ? CupertinoIcons.rectangle_fill_on_rectangle_angled_fill
        : Icons.cleaning_services;
  }

  static IconData tasks(BuildContext context) {
    return context.isIos ? CupertinoIcons.square_list : Icons.fact_check_outlined;
  }

  static IconData tasksSelected(BuildContext context) {
    return context.isIos ? CupertinoIcons.square_list_fill : Icons.fact_check;
  }
}
