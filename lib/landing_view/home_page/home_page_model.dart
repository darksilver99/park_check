import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/component/expire_alert_view/expire_alert_view_widget.dart';
import '/component/loading_list_view/loading_list_view_widget.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/component/transaction_detail_view/transaction_detail_view_widget.dart';
import '/component/transaction_out_detail_view/transaction_out_detail_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<TransactionListRecord> transactionList = [];
  void addToTransactionList(TransactionListRecord item) =>
      transactionList.add(item);
  void removeFromTransactionList(TransactionListRecord item) =>
      transactionList.remove(item);
  void removeAtIndexFromTransactionList(int index) =>
      transactionList.removeAt(index);
  void insertAtIndexInTransactionList(int index, TransactionListRecord item) =>
      transactionList.insert(index, item);
  void updateTransactionListAtIndex(
          int index, Function(TransactionListRecord) updateFn) =>
      transactionList[index] = updateFn(transactionList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  ProjectListRecord? projectData;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<TransactionListRecord>? rsDataList;
  // Stores action output result for [Custom Action - getFirebaseToken] action in HomePage widget.
  String? token;
  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchTransactionData] action in TextField widget.
  List<TransactionListRecord>? searchResult;
  // Stores action output result for [Firestore Query - Query a collection] action in ListView widget.
  List<TransactionListRecord>? rsDataList2;
  // Model for LoadingListView component.
  late LoadingListViewModel loadingListViewModel;
  var qrCode = '';
  // Stores action output result for [Custom Action - getTransactionDocument] action in Row widget.
  TransactionListRecord? transactionDocumentResult;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
    loadingListViewModel = createModel(context, () => LoadingListViewModel());
  }

  @override
  void dispose() {
    mainBackgroundViewModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    loadingListViewModel.dispose();
  }
}
