import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'setting_project_page_widget.dart' show SettingProjectPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingProjectPageModel
    extends FlutterFlowModel<SettingProjectPageWidget> {
  ///  Local state fields for this page.

  List<String> carList = [];
  void addToCarList(String item) => carList.add(item);
  void removeFromCarList(String item) => carList.remove(item);
  void removeAtIndexFromCarList(int index) => carList.removeAt(index);
  void insertAtIndexInCarList(int index, String item) =>
      carList.insert(index, item);
  void updateCarListAtIndex(int index, Function(String) updateFn) =>
      carList[index] = updateFn(carList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;
  // State field(s) for carTypeValue widget.
  FocusNode? carTypeValueFocusNode;
  TextEditingController? carTypeValueTextController;
  String? Function(BuildContext, String?)? carTypeValueTextControllerValidator;
  // State field(s) for carList widget.
  FormFieldController<List<String>>? carListValueController;
  String? get carListValue => carListValueController?.value?.firstOrNull;
  set carListValue(String? val) =>
      carListValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainBackgroundViewModel.dispose();
    carTypeValueFocusNode?.dispose();
    carTypeValueTextController?.dispose();
  }
}
