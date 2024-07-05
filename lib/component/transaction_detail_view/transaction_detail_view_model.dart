import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_detail_view_widget.dart' show TransactionDetailViewWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransactionDetailViewModel
    extends FlutterFlowModel<TransactionDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - printSlip] action in Button widget.
  PrintStatusDataStruct? printResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
