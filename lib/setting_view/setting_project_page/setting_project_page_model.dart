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

  List<String> objectiveList = [];
  void addToObjectiveList(String item) => objectiveList.add(item);
  void removeFromObjectiveList(String item) => objectiveList.remove(item);
  void removeAtIndexFromObjectiveList(int index) =>
      objectiveList.removeAt(index);
  void insertAtIndexInObjectiveList(int index, String item) =>
      objectiveList.insert(index, item);
  void updateObjectiveListAtIndex(int index, Function(String) updateFn) =>
      objectiveList[index] = updateFn(objectiveList[index]);

  List<String> stampList = [];
  void addToStampList(String item) => stampList.add(item);
  void removeFromStampList(String item) => stampList.remove(item);
  void removeAtIndexFromStampList(int index) => stampList.removeAt(index);
  void insertAtIndexInStampList(int index, String item) =>
      stampList.insert(index, item);
  void updateStampListAtIndex(int index, Function(String) updateFn) =>
      stampList[index] = updateFn(stampList[index]);

  String? stampFieldName;

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
  // State field(s) for objectiveValue widget.
  FocusNode? objectiveValueFocusNode;
  TextEditingController? objectiveValueTextController;
  String? Function(BuildContext, String?)?
      objectiveValueTextControllerValidator;
  // State field(s) for objectiveList widget.
  FormFieldController<List<String>>? objectiveListValueController;
  String? get objectiveListValue =>
      objectiveListValueController?.value?.firstOrNull;
  set objectiveListValue(String? val) =>
      objectiveListValueController?.value = val != null ? [val] : [];
  // State field(s) for stampValue widget.
  FocusNode? stampValueFocusNode;
  TextEditingController? stampValueTextController;
  String? Function(BuildContext, String?)? stampValueTextControllerValidator;
  // State field(s) for stampList widget.
  FormFieldController<List<String>>? stampListValueController;
  String? get stampListValue => stampListValueController?.value?.firstOrNull;
  set stampListValue(String? val) =>
      stampListValueController?.value = val != null ? [val] : [];

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

    objectiveValueFocusNode?.dispose();
    objectiveValueTextController?.dispose();

    stampValueFocusNode?.dispose();
    stampValueTextController?.dispose();
  }
}
