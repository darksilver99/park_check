import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/component/o_c_r_alert_view/o_c_r_alert_view_widget.dart';
import '/component/transaction_detail_view/transaction_detail_view_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_in_page_widget.dart' show TransactionInPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransactionInPageModel extends FlutterFlowModel<TransactionInPageWidget> {
  ///  Local state fields for this page.

  String? allCardData;

  String? allRegistrationData;

  String? tmpCardImagePath;

  String? tmpRegistrationImagePath;

  List<String> tmpMoreImageListPath = [];
  void addToTmpMoreImageListPath(String item) => tmpMoreImageListPath.add(item);
  void removeFromTmpMoreImageListPath(String item) =>
      tmpMoreImageListPath.remove(item);
  void removeAtIndexFromTmpMoreImageListPath(int index) =>
      tmpMoreImageListPath.removeAt(index);
  void insertAtIndexInTmpMoreImageListPath(int index, String item) =>
      tmpMoreImageListPath.insert(index, item);
  void updateTmpMoreImageListPathAtIndex(
          int index, Function(String) updateFn) =>
      tmpMoreImageListPath[index] = updateFn(tmpMoreImageListPath[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - getBase64] action in Button widget.
  String? base64Result2;
  // Stores action output result for [Backend Call - API (getORCData)] action in Button widget.
  ApiCallResponse? apiReuslt2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - getBase64] action in Button widget.
  String? base64Result;
  // Stores action output result for [Backend Call - API (getORCData)] action in Button widget.
  ApiCallResponse? apiReuslt;
  // State field(s) for preName widget.
  FocusNode? preNameFocusNode;
  TextEditingController? preNameTextController;
  String? Function(BuildContext, String?)? preNameTextControllerValidator;
  String? _preNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for idNumber widget.
  FocusNode? idNumberFocusNode;
  TextEditingController? idNumberTextController;
  String? Function(BuildContext, String?)? idNumberTextControllerValidator;
  String? _idNumberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for registration widget.
  FocusNode? registrationFocusNode;
  TextEditingController? registrationTextController;
  String? Function(BuildContext, String?)? registrationTextControllerValidator;
  String? _registrationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for carSelected widget.
  FormFieldController<List<String>>? carSelectedValueController;
  String? get carSelectedValue =>
      carSelectedValueController?.value?.firstOrNull;
  set carSelectedValue(String? val) =>
      carSelectedValueController?.value = val != null ? [val] : [];
  // State field(s) for objectiveSelected widget.
  FormFieldController<List<String>>? objectiveSelectedValueController;
  String? get objectiveSelectedValue =>
      objectiveSelectedValueController?.value?.firstOrNull;
  set objectiveSelectedValue(String? val) =>
      objectiveSelectedValueController?.value = val != null ? [val] : [];
  // State field(s) for contact_address widget.
  FocusNode? contactAddressFocusNode;
  TextEditingController? contactAddressTextController;
  String? Function(BuildContext, String?)?
      contactAddressTextControllerValidator;
  // State field(s) for more_detail widget.
  FocusNode? moreDetailFocusNode;
  TextEditingController? moreDetailTextController;
  String? Function(BuildContext, String?)? moreDetailTextControllerValidator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  String? moreImagePath;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  String? registrationImagePath;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  String? cardImagePath;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TransactionListRecord? lastDocument;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionListRecord? insertedTransaction;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
    preNameTextControllerValidator = _preNameTextControllerValidator;
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    idNumberTextControllerValidator = _idNumberTextControllerValidator;
    registrationTextControllerValidator = _registrationTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainBackgroundViewModel.dispose();
    preNameFocusNode?.dispose();
    preNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    idNumberFocusNode?.dispose();
    idNumberTextController?.dispose();

    registrationFocusNode?.dispose();
    registrationTextController?.dispose();

    contactAddressFocusNode?.dispose();
    contactAddressTextController?.dispose();

    moreDetailFocusNode?.dispose();
    moreDetailTextController?.dispose();
  }
}
