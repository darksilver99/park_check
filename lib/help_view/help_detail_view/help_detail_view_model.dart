import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/custom_confirm_view/custom_confirm_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/help_view/remark_edit_view/remark_edit_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'help_detail_view_widget.dart' show HelpDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HelpDetailViewModel extends FlutterFlowModel<HelpDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? remark;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? update2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
