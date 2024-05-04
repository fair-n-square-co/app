import 'package:fair_and_square/app/bloc/app_bloc.dart';
import 'package:fair_and_square/groups/views/groups_page.dart';
import 'package:fair_and_square/login/view/login_page.dart';
import 'package:flutter/widgets.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [GroupsPage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
