import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/component/transaction_out_detail_view/transaction_out_detail_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_history_page_widget.dart' show TransactionHistoryPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransactionHistoryPageModel
    extends FlutterFlowModel<TransactionHistoryPageWidget> {
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

  DateTime? startDate;

  DateTime? endDate;

  List<TransactionListRecord> searchedTransactionList = [];
  void addToSearchedTransactionList(TransactionListRecord item) =>
      searchedTransactionList.add(item);
  void removeFromSearchedTransactionList(TransactionListRecord item) =>
      searchedTransactionList.remove(item);
  void removeAtIndexFromSearchedTransactionList(int index) =>
      searchedTransactionList.removeAt(index);
  void insertAtIndexInSearchedTransactionList(
          int index, TransactionListRecord item) =>
      searchedTransactionList.insert(index, item);
  void updateSearchedTransactionListAtIndex(
          int index, Function(TransactionListRecord) updateFn) =>
      searchedTransactionList[index] = updateFn(searchedTransactionList[index]);

  bool isFullList = true;

  ///  State fields for stateful widgets in this page.

  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - TransactionOutDetailView] action in Container widget.
  String? isSaved;
  // Stores action output result for [Bottom Sheet - TransactionOutDetailView] action in Container widget.
  String? isSaved2;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    mainBackgroundViewModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future getTransactionList(BuildContext context) async {
    List<TransactionListRecord>? transactionResult;

    transactionResult = await queryTransactionListRecordOnce(
      queryBuilder: (transactionListRecord) => transactionListRecord
          .where(
            'date_in',
            isGreaterThanOrEqualTo: startDate,
          )
          .where(
            'date_in',
            isLessThanOrEqualTo: endDate,
          )
          .orderBy('date_in', descending: true),
    );
    transactionList = transactionResult!.toList().cast<TransactionListRecord>();
  }
}
