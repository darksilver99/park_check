import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_out_detail_view_widget.dart'
    show TransactionOutDetailViewWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TransactionOutDetailViewModel
    extends FlutterFlowModel<TransactionOutDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for stampSelected widget.
  FormFieldController<List<String>>? stampSelectedValueController;
  String? get stampSelectedValue =>
      stampSelectedValueController?.value?.firstOrNull;
  set stampSelectedValue(String? val) =>
      stampSelectedValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - printSlip] action in Button widget.
  PrintStatusDataStruct? printResult2;
  // Stores action output result for [Custom Action - printSlip] action in Button widget.
  PrintStatusDataStruct? printResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
