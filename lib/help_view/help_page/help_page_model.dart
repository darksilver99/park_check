import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/help_view/help_detail_view/help_detail_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'help_page_widget.dart' show HelpPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HelpPageModel extends FlutterFlowModel<HelpPageWidget> {
  ///  Local state fields for this page.

  int total = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HelpPage widget.
  int? totalHelpResult;
  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;
  List<HelpListRecord>? listViewPreviousSnapshot;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    mainBackgroundViewModel.dispose();
  }
}
