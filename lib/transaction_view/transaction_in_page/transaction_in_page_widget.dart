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
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'transaction_in_page_model.dart';
export 'transaction_in_page_model.dart';

class TransactionInPageWidget extends StatefulWidget {
  const TransactionInPageWidget({super.key});

  @override
  State<TransactionInPageWidget> createState() =>
      _TransactionInPageWidgetState();
}

class _TransactionInPageWidgetState extends State<TransactionInPageWidget> {
  late TransactionInPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionInPageModel());

    _model.preNameTextController ??= TextEditingController();
    _model.preNameFocusNode ??= FocusNode();

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.idNumberTextController ??= TextEditingController();
    _model.idNumberFocusNode ??= FocusNode();

    _model.registrationTextController ??= TextEditingController();
    _model.registrationFocusNode ??= FocusNode();

    _model.contactAddressTextController ??= TextEditingController();
    _model.contactAddressFocusNode ??= FocusNode();

    _model.moreDetailTextController ??= TextEditingController();
    _model.moreDetailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'ลงทะเบียนรถเข้า',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            wrapWithModel(
              model: _model.mainBackgroundViewModel,
              updateCallback: () => setState(() {}),
              child: MainBackgroundViewWidget(),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xE6FFFFFF),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.uploadData1 =
                                                  await actions.customCamera(
                                                context,
                                              );
                                              if (_model.uploadData1 != null &&
                                                  (_model.uploadData1)!
                                                      .isNotEmpty) {
                                                _model.base64Result2 =
                                                    await actions.getBase64(
                                                  _model.uploadData1!.first,
                                                );
                                                _model.apiReuslt2 =
                                                    await GetORCDataCall.call(
                                                  api: FFAppState()
                                                      .configData
                                                      .ocrApi,
                                                  base64: _model.base64Result2,
                                                );

                                                if ((_model.apiReuslt2
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (GeneralDataStruct
                                                              .maybeFromMap((_model
                                                                      .apiReuslt2
                                                                      ?.jsonBody ??
                                                                  ''))
                                                          ?.status ==
                                                      1) {
                                                    if (!FFAppState()
                                                        .isSkipOCRAlert) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  OCRAlertViewWidget(),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                    if (getJsonField(
                                                          (_model.apiReuslt2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.id_card_number''',
                                                        ) !=
                                                        null) {
                                                      setState(() {
                                                        _model
                                                            .preNameTextController
                                                            ?.text = getJsonField(
                                                          (_model.apiReuslt2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.pre_name''',
                                                        ).toString();
                                                        _model.preNameTextController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .preNameTextController!
                                                                    .text
                                                                    .length);
                                                      });
                                                      setState(() {
                                                        _model
                                                            .firstNameTextController
                                                            ?.text = getJsonField(
                                                          (_model.apiReuslt2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.first_name''',
                                                        ).toString();
                                                        _model.firstNameTextController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .firstNameTextController!
                                                                    .text
                                                                    .length);
                                                      });
                                                      setState(() {
                                                        _model
                                                            .lastNameTextController
                                                            ?.text = getJsonField(
                                                          (_model.apiReuslt2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.last_name''',
                                                        ).toString();
                                                        _model.lastNameTextController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .lastNameTextController!
                                                                    .text
                                                                    .length);
                                                      });
                                                      setState(() {
                                                        _model
                                                            .idNumberTextController
                                                            ?.text = getJsonField(
                                                          (_model.apiReuslt2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.id_card_number''',
                                                        ).toString();
                                                        _model.idNumberTextController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .idNumberTextController!
                                                                    .text
                                                                    .length);
                                                      });
                                                      _model.allCardData =
                                                          getJsonField(
                                                        (_model.apiReuslt2
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.all_data''',
                                                      ).toString();
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                CustomInfoAlertViewWidget(
                                                              title: FFAppState()
                                                                  .configData
                                                                  .ocrErrorText
                                                                  .first,
                                                              detail: FFAppState()
                                                                  .configData
                                                                  .ocrErrorText
                                                                  .last,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              CustomInfoAlertViewWidget(
                                                            title: FFAppState()
                                                                .configData
                                                                .ocrErrorText
                                                                .first,
                                                            detail: FFAppState()
                                                                .configData
                                                                .ocrErrorText
                                                                .last,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'ถ่ายรูปบัตร',
                                            options: FFButtonOptions(
                                              height: 60.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.uploadData2 =
                                                  await actions.customCamera(
                                                context,
                                              );
                                              if (_model.uploadData2 != null &&
                                                  (_model.uploadData2)!
                                                      .isNotEmpty) {
                                                _model.base64Result =
                                                    await actions.getBase64(
                                                  _model.uploadData2!.first,
                                                );
                                                _model.apiReuslt =
                                                    await GetORCDataCall.call(
                                                  api: FFAppState()
                                                      .configData
                                                      .ocrApi,
                                                  base64: _model.base64Result,
                                                );

                                                if ((_model
                                                        .apiReuslt?.succeeded ??
                                                    true)) {
                                                  if (GeneralDataStruct
                                                              .maybeFromMap((_model
                                                                      .apiReuslt
                                                                      ?.jsonBody ??
                                                                  ''))
                                                          ?.status ==
                                                      1) {
                                                    if (!FFAppState()
                                                        .isSkipOCRAlert) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  OCRAlertViewWidget(),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                    if (getJsonField(
                                                          (_model.apiReuslt
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.registration''',
                                                        ) !=
                                                        null) {
                                                      setState(() {
                                                        _model
                                                            .registrationTextController
                                                            ?.text = getJsonField(
                                                          (_model.apiReuslt
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.registration''',
                                                        ).toString();
                                                        _model.registrationTextController
                                                                ?.selection =
                                                            TextSelection.collapsed(
                                                                offset: _model
                                                                    .registrationTextController!
                                                                    .text
                                                                    .length);
                                                      });
                                                      setState(() {
                                                        _model.dropDownValueController
                                                                ?.value =
                                                            getJsonField(
                                                          (_model.apiReuslt
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.province''',
                                                        ).toString();
                                                      });
                                                      _model.allRegistrationData =
                                                          getJsonField(
                                                        (_model.apiReuslt
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.all_data''',
                                                      ).toString();
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                CustomInfoAlertViewWidget(
                                                              title: FFAppState()
                                                                  .configData
                                                                  .ocrErrorText
                                                                  .first,
                                                              detail: FFAppState()
                                                                  .configData
                                                                  .ocrErrorText
                                                                  .last,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              CustomInfoAlertViewWidget(
                                                            title: FFAppState()
                                                                .configData
                                                                .ocrErrorText
                                                                .first,
                                                            detail: FFAppState()
                                                                .configData
                                                                .ocrErrorText
                                                                .last,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'ถ่ายรูปทะเบียนรถ',
                                            options: FFButtonOptions(
                                              height: 60.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'ข้อมูลผู้จอดรถ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: TextFormField(
                                      controller: _model.preNameTextController,
                                      focusNode: _model.preNameFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'คำนำหน้า',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        filled: true,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .preNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: TextFormField(
                                      controller:
                                          _model.firstNameTextController,
                                      focusNode: _model.firstNameFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'ชื่อ',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        filled: true,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .firstNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: TextFormField(
                                      controller: _model.lastNameTextController,
                                      focusNode: _model.lastNameFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'นามสกุล',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        filled: true,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .lastNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: TextFormField(
                                      controller: _model.idNumberTextController,
                                      focusNode: _model.idNumberFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'เลขประจำตัวประชาชน',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        filled: true,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .idNumberTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 3.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'ข้อมูลรถ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: TextFormField(
                                      controller:
                                          _model.registrationTextController,
                                      focusNode: _model.registrationFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'ทะเบียนรถ',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        filled: true,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .registrationTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options:
                                        FFAppState().configData.provinceList,
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue = val),
                                    width: double.infinity,
                                    height: 56.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'เลือกจังหวัด',
                                    searchHintText: 'เลือกจังหวัด',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 42.0,
                                    ),
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 1.0,
                                    borderRadius: 24.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        'ประเภทรถ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    FlutterFlowChoiceChips(
                                      options: FFAppState()
                                          .projectData
                                          .projectCarList
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) => setState(() => _model
                                          .carSelectedValue = val?.firstOrNull),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 8.0, 16.0, 8.0),
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 8.0, 16.0, 8.0),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.carSelectedValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      wrapped: true,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  'วัตถุประสงค์',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: FlutterFlowChoiceChips(
                                  options: FFAppState()
                                      .projectData
                                      .projectObjectiveList
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) => setState(() =>
                                      _model.objectiveSelectedValue =
                                          val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 18.0,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                    elevation: 4.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  chipSpacing: 12.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  alignment: WrapAlignment.start,
                                  controller: _model
                                          .objectiveSelectedValueController ??=
                                      FormFieldController<List<String>>(
                                    [],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                              Divider(
                                thickness: 3.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              if (FFAppState().projectData.enableContactAddress)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'ที่อยู่ที่มาติดต่อ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: TextFormField(
                                        controller:
                                            _model.contactAddressTextController,
                                        focusNode:
                                            _model.contactAddressFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ห้อง/บ้านเลขที่',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          filled: true,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .contactAddressTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 3.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ],
                                ),
                              if (FFAppState().projectData.enableMoreDetail)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        FFAppState()
                                            .projectData
                                            .moreDetailField,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: TextFormField(
                                        controller:
                                            _model.moreDetailTextController,
                                        focusNode: _model.moreDetailFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFAppState()
                                              .projectData
                                              .moreDetailField,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          filled: true,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: 4,
                                        validator: _model
                                            .moreDetailTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              if (FFAppState().projectData.enableMoreImage)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          FFAppState()
                                              .projectData
                                              .moreImageField,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final moreImageList = _model
                                                      .tmpMoreImageListPath
                                                      .toList();

                                                  return Wrap(
                                                    spacing: 8.0,
                                                    runSpacing: 8.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        moreImageList.length,
                                                        (moreImageListIndex) {
                                                      final moreImageListItem =
                                                          moreImageList[
                                                              moreImageListIndex];
                                                      return Container(
                                                        width: 86.0,
                                                        height: 86.0,
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                moreImageListItem,
                                                                width: 86.0,
                                                                height: 86.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: Text('ต้องการลบรูปนี้?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('ยกเลิก'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('ยืนยัน'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      await FirebaseStorage
                                                                          .instance
                                                                          .refFromURL(
                                                                              moreImageListItem)
                                                                          .delete();
                                                                      _model.removeFromTmpMoreImageListPath(
                                                                          moreImageListItem);
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .cancel_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.tmpMoreImageListPath
                                                    .length >=
                                                FFAppState()
                                                    .projectData
                                                    .maxMoreImage) {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child:
                                                          CustomInfoAlertViewWidget(
                                                        title:
                                                            'กำหนดรูปภาพสูงสุด ${FFAppState().projectData.maxMoreImage.toString()} รูป',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              _model.uploadData3 =
                                                  await actions.customCamera(
                                                context,
                                              );
                                              if (_model.uploadData3 != null &&
                                                  (_model.uploadData3)!
                                                      .isNotEmpty) {
                                                _model.moreImagePath =
                                                    await actions
                                                        .uploadImageToFirebase(
                                                  _model.uploadData3!.first,
                                                  'more_image',
                                                );
                                                _model
                                                    .addToTmpMoreImageListPath(
                                                        _model.moreImagePath!);
                                                setState(() {});
                                              }
                                            }

                                            setState(() {});
                                          },
                                          text: 'ถ่ายรูป',
                                          icon: Icon(
                                            Icons.photo_camera,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .link,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.dropDownValue == null) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('กรุณาเลือกจังหวัด'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('ตกลง'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                  if (_model.carSelectedValue != null &&
                                      _model.carSelectedValue != '') {
                                    if (_model.objectiveSelectedValue != null &&
                                        _model.objectiveSelectedValue != '') {
                                      if (_model.uploadData2 != null &&
                                          (_model.uploadData2)!.isNotEmpty) {
                                        _model.registrationImagePath =
                                            await actions.uploadImageToFirebase(
                                          _model.uploadData2!.first,
                                          'registrations',
                                        );
                                        _model.tmpRegistrationImagePath =
                                            _model.registrationImagePath;
                                      }
                                      if (_model.uploadData1 != null &&
                                          (_model.uploadData1)!.isNotEmpty) {
                                        _model.cardImagePath =
                                            await actions.uploadImageToFirebase(
                                          _model.uploadData1!.first,
                                          'cards',
                                        );
                                        _model.tmpCardImagePath =
                                            _model.cardImagePath;
                                      }
                                      _model.lastDocument =
                                          await queryTransactionListRecordOnce(
                                        queryBuilder: (transactionListRecord) =>
                                            transactionListRecord.orderBy(
                                                'create_date',
                                                descending: true),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.transactionNumber =
                                          functions.getTransactionNumber(
                                              _model.lastDocument);

                                      var transactionListRecordReference =
                                          TransactionListRecord.collection
                                              .doc();
                                      await transactionListRecordReference.set({
                                        ...createTransactionListRecordData(
                                          createDate: getCurrentTimestamp,
                                          cardNumber: _model
                                              .idNumberTextController.text,
                                          preName:
                                              _model.preNameTextController.text,
                                          firstName: _model
                                              .firstNameTextController.text,
                                          lastName: _model
                                              .lastNameTextController.text,
                                          carRegistration: _model
                                              .registrationTextController.text,
                                          carRegistrationProvince:
                                              _model.dropDownValue,
                                          objective:
                                              _model.objectiveSelectedValue,
                                          carType: _model.carSelectedValue,
                                          dateIn: getCurrentTimestamp,
                                          isOut: false,
                                          contactAddress: _model
                                              .contactAddressTextController
                                              .text,
                                          allCardData: _model.allCardData,
                                          allRegistrationData:
                                              _model.allRegistrationData,
                                          registrationImage:
                                              _model.tmpRegistrationImagePath,
                                          cardImage: _model.tmpCardImagePath,
                                          moreDetail: _model
                                              .moreDetailTextController.text,
                                          transactionNumber:
                                              _model.transactionNumber,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'more_image':
                                                _model.tmpMoreImageListPath,
                                          },
                                        ),
                                      });
                                      _model.insertedTransaction =
                                          TransactionListRecord
                                              .getDocumentFromData({
                                        ...createTransactionListRecordData(
                                          createDate: getCurrentTimestamp,
                                          cardNumber: _model
                                              .idNumberTextController.text,
                                          preName:
                                              _model.preNameTextController.text,
                                          firstName: _model
                                              .firstNameTextController.text,
                                          lastName: _model
                                              .lastNameTextController.text,
                                          carRegistration: _model
                                              .registrationTextController.text,
                                          carRegistrationProvince:
                                              _model.dropDownValue,
                                          objective:
                                              _model.objectiveSelectedValue,
                                          carType: _model.carSelectedValue,
                                          dateIn: getCurrentTimestamp,
                                          isOut: false,
                                          contactAddress: _model
                                              .contactAddressTextController
                                              .text,
                                          allCardData: _model.allCardData,
                                          allRegistrationData:
                                              _model.allRegistrationData,
                                          registrationImage:
                                              _model.tmpRegistrationImagePath,
                                          cardImage: _model.tmpCardImagePath,
                                          moreDetail: _model
                                              .moreDetailTextController.text,
                                          transactionNumber:
                                              _model.transactionNumber,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'more_image':
                                                _model.tmpMoreImageListPath,
                                          },
                                        ),
                                      }, transactionListRecordReference);
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  TransactionDetailViewWidget(
                                                transactionParameter:
                                                    _model.insertedTransaction!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      await actions.pushReplacement(
                                        context,
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text(
                                                  'กรุณาเลือกวัตถุประสงค์'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('ตกลง'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('กรุณาเลือกประเภทรถ'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('ตกลง'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  setState(() {});
                                },
                                text: 'บันทึกรถเข้า',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 16.0))
                    .addToEnd(SizedBox(height: 16.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
