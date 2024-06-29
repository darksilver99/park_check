import '/component/main_background_view/main_background_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'setting_printer_page_widget.dart' show SettingPrinterPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingPrinterPageModel
    extends FlutterFlowModel<SettingPrinterPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> printerList = [];
  void addToPrinterList(dynamic item) => printerList.add(item);
  void removeFromPrinterList(dynamic item) => printerList.remove(item);
  void removeAtIndexFromPrinterList(int index) => printerList.removeAt(index);
  void insertAtIndexInPrinterList(int index, dynamic item) =>
      printerList.insert(index, item);
  void updatePrinterListAtIndex(int index, Function(dynamic) updateFn) =>
      printerList[index] = updateFn(printerList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getPrinterList] action in SettingPrinterPage widget.
  List<dynamic>? printerResultList;
  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainBackgroundViewModel.dispose();
  }
}
