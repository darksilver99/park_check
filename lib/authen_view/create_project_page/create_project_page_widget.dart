import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_project_page_model.dart';
export 'create_project_page_model.dart';

class CreateProjectPageWidget extends StatefulWidget {
  const CreateProjectPageWidget({super.key});

  @override
  State<CreateProjectPageWidget> createState() =>
      _CreateProjectPageWidgetState();
}

class _CreateProjectPageWidgetState extends State<CreateProjectPageWidget> {
  late CreateProjectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProjectPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.getConfigData(context);
      _model.isLoading = false;
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.3,
                            0.0,
                          ),
                          0.0,
                          0.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Visibility(
                              visible: !_model.isLoading,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'ระบุชื่อโครงการ',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
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
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Text(
                                      'ประเภทโครงการ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: FlutterFlowChoiceChips(
                                        options: FFAppState()
                                            .configData
                                            .projectType
                                            .map((label) => ChipData(label))
                                            .toList(),
                                        onChanged: (val) => setState(() =>
                                            _model.projectTypeSelectedValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
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
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
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
                                        controller: _model
                                                .projectTypeSelectedValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.projectTypeSelectedValue !=
                                                null &&
                                            _model.projectTypeSelectedValue !=
                                                '') {
                                          var projectListRecordReference =
                                              ProjectListRecord.collection
                                                  .doc();
                                          await projectListRecordReference.set({
                                            ...createProjectListRecordData(
                                              createDate: getCurrentTimestamp,
                                              createBy: currentUserReference,
                                              name: _model.textController.text,
                                              status: 1,
                                              stampField: FFAppState()
                                                  .configData
                                                  .defaultStampField,
                                              projectType: _model
                                                  .projectTypeSelectedValue,
                                              backgroundImage: FFAppState()
                                                  .configData
                                                  .defaultBackgroundImage,
                                              enableContactAddress: true,
                                              expireDate:
                                                  functions.getNextDay(30),
                                              paymentDetailImage: FFAppState()
                                                  .configData
                                                  .paymentDetailDefaultImage,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'objective_list': FFAppState()
                                                    .configData
                                                    .defaultObjectiveList,
                                                'stamp_list': FFAppState()
                                                    .configData
                                                    .defaultStampList,
                                                'car_list': FFAppState()
                                                    .configData
                                                    .defaultCarList,
                                                'payment_alert_text':
                                                    FFAppState()
                                                        .configData
                                                        .paymentAlertDefaultText,
                                              },
                                            ),
                                          });
                                          _model.projectInserted =
                                              ProjectListRecord
                                                  .getDocumentFromData({
                                            ...createProjectListRecordData(
                                              createDate: getCurrentTimestamp,
                                              createBy: currentUserReference,
                                              name: _model.textController.text,
                                              status: 1,
                                              stampField: FFAppState()
                                                  .configData
                                                  .defaultStampField,
                                              projectType: _model
                                                  .projectTypeSelectedValue,
                                              backgroundImage: FFAppState()
                                                  .configData
                                                  .defaultBackgroundImage,
                                              enableContactAddress: true,
                                              expireDate:
                                                  functions.getNextDay(30),
                                              paymentDetailImage: FFAppState()
                                                  .configData
                                                  .paymentDetailDefaultImage,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'objective_list': FFAppState()
                                                    .configData
                                                    .defaultObjectiveList,
                                                'stamp_list': FFAppState()
                                                    .configData
                                                    .defaultStampList,
                                                'car_list': FFAppState()
                                                    .configData
                                                    .defaultCarList,
                                                'payment_alert_text':
                                                    FFAppState()
                                                        .configData
                                                        .paymentAlertDefaultText,
                                              },
                                            ),
                                          }, projectListRecordReference);
                                          FFAppState().projectData =
                                              ProjectDataStruct(
                                            projectDocID: _model
                                                .projectInserted?.reference.id,
                                            projectName:
                                                _model.textController.text,
                                            projectStampList: _model
                                                .projectInserted?.stampList,
                                            projectObjectiveList: _model
                                                .projectInserted?.objectiveList,
                                            projectCarList:
                                                _model.projectInserted?.carList,
                                            projectType: _model
                                                .projectInserted?.projectType,
                                            stampField: _model
                                                .projectInserted?.stampField,
                                            projectReference: _model
                                                .projectInserted?.reference,
                                            enableContactAddress: true,
                                            backgroundImage: _model
                                                .projectInserted
                                                ?.backgroundImage,
                                            expireDate: _model
                                                .projectInserted?.expireDate,
                                            paymentDetailImage: _model
                                                .projectInserted
                                                ?.paymentDetailImage,
                                            paymentAlertText: _model
                                                .projectInserted
                                                ?.paymentAlertText,
                                          );

                                          context.goNamed('HomePage');
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'กรุณาเลือกประเภทโครงการ'),
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

                                        setState(() {});
                                      },
                                      text: 'สร้างโครงการ',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_model.isLoading)
                wrapWithModel(
                  model: _model.loadingViewModel,
                  updateCallback: () => setState(() {}),
                  child: LoadingViewWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
