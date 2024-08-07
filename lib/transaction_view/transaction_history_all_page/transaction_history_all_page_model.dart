import '/backend/backend.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/component/transaction_out_detail_view/transaction_out_detail_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_history_all_page_widget.dart'
    show TransactionHistoryAllPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransactionHistoryAllPageModel
    extends FlutterFlowModel<TransactionHistoryAllPageWidget> {
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
  // Stores action output result for [Bottom Sheet - TransactionOutDetailView] action in Container widget.
  String? isSaved;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    mainBackgroundViewModel.dispose();
  }

  /// Action blocks.
  Future getTransactionList(BuildContext context) async {}
}
