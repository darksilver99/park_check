import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/component/main_background_view/main_background_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/component/transaction_detail_view/transaction_detail_view_widget.dart';
import '/component/transaction_out_detail_view/transaction_out_detail_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.projectData = await queryProjectListRecordOnce(
        queryBuilder: (projectListRecord) => projectListRecord.where(
          'create_by',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.projectData?.reference != null) {
        FFAppState().projectData = ProjectDataStruct(
          projectDocID: _model.projectData?.reference.id,
          projectName: _model.projectData?.name,
          projectStampList: _model.projectData?.stampList,
          projectObjectiveList: _model.projectData?.objectiveList,
          projectCarList: _model.projectData?.carList,
          projectType: _model.projectData?.projectType,
          stampField: _model.projectData?.stampField,
          projectReference: _model.projectData?.reference,
        );
        _model.configResult = await queryConfigRecordOnce(
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().configData = ConfigDataStruct(
          backgroudImage: _model.configResult?.backgroundImage,
          ocrApi: _model.configResult?.ocrApi,
        );
        _model.rsDataList = await queryTransactionListRecordOnce(
          queryBuilder: (transactionListRecord) => transactionListRecord
              .where(
                'is_out',
                isEqualTo: false,
              )
              .where(
                'date_in',
                isGreaterThanOrEqualTo:
                    functions.getStartDayTime(getCurrentTimestamp),
              )
              .where(
                'date_in',
                isLessThanOrEqualTo:
                    functions.getEndDayTime(getCurrentTimestamp),
              )
              .orderBy('date_in', descending: true),
        );
        _model.isLoading = false;
        _model.transactionList =
            _model.rsDataList!.toList().cast<TransactionListRecord>();
        setState(() {});
      } else {
        context.goNamed('CreateProjectPage');
      }
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
              if (!_model.isLoading)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 200),
                                    () async {
                                      _model.searchResult =
                                          await actions.searchTransactionData(
                                        _model.textController.text,
                                        functions.getStartDayTime(
                                            getCurrentTimestamp),
                                        functions
                                            .getEndDayTime(getCurrentTimestamp),
                                      );
                                      _model.transactionList = _model
                                          .searchResult!
                                          .toList()
                                          .cast<TransactionListRecord>();
                                      _model.isLoading = false;
                                      setState(() {});

                                      setState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        'ระบุคำค้นหา ทะเบียนรถ, ชื่อผู้ติดต่อ',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    filled: true,
                                    suffixIcon: _model
                                            .textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              _model.searchResult =
                                                  await actions
                                                      .searchTransactionData(
                                                _model.textController.text,
                                                functions.getStartDayTime(
                                                    getCurrentTimestamp),
                                                functions.getEndDayTime(
                                                    getCurrentTimestamp),
                                              );
                                              _model.transactionList = _model
                                                  .searchResult!
                                                  .toList()
                                                  .cast<
                                                      TransactionListRecord>();
                                              _model.isLoading = false;
                                              setState(() {});

                                              setState(() {});
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 32.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'รายการวันที่',
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat('d/M/y', getCurrentTimestamp),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('TransactionHistoryPage');
                              },
                              text: 'รายการ รถออก/ค้าง',
                              icon: Icon(
                                Icons.history_rounded,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
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
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final dataList = _model.transactionList.toList();
                          if (dataList.isEmpty) {
                            return NoDataViewWidget();
                          }
                          return RefreshIndicator(
                            onRefresh: () async {
                              _model.isLoading = true;
                              setState(() {
                                _model.textController?.text = '';
                                _model.textController?.selection =
                                    TextSelection.collapsed(
                                        offset:
                                            _model.textController!.text.length);
                              });
                              _model.rsDataList2 =
                                  await queryTransactionListRecordOnce(
                                queryBuilder: (transactionListRecord) =>
                                    transactionListRecord
                                        .where(
                                          'is_out',
                                          isEqualTo: false,
                                        )
                                        .where(
                                          'date_in',
                                          isGreaterThanOrEqualTo:
                                              functions.getStartDayTime(
                                                  getCurrentTimestamp),
                                        )
                                        .where(
                                          'date_in',
                                          isLessThanOrEqualTo:
                                              functions.getEndDayTime(
                                                  getCurrentTimestamp),
                                        )
                                        .orderBy('date_in', descending: true),
                              );
                              _model.isLoading = false;
                              _model.transactionList = _model.rsDataList2!
                                  .toList()
                                  .cast<TransactionListRecord>();
                              setState(() {});
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                64.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: dataList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, dataListIndex) {
                                final dataListItem = dataList[dataListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  TransactionDetailViewWidget(
                                                transactionParameter:
                                                    dataListItem,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'ทะเบียน : ${dataListItem.carRegistration}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${dataListItem.preName} ${dataListItem.firstName} ${dataListItem.lastName}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'เวลาเข้า : ${dateTimeFormat('d/M/y', dataListItem.dateIn)} ${dateTimeFormat('Hm', dataListItem.dateIn)}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .content_paste_search_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Text(
                                                  'ดูรายละเอียด',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 8.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('TransactionInPage');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Icon(
                                    Icons.download_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    'เพิ่มรถเข้า',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(24.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.qrCode =
                                  await FlutterBarcodeScanner.scanBarcode(
                                '#C62828', // scanning line color
                                'Cancel', // cancel button text
                                true, // whether to show the flash icon
                                ScanMode.QR,
                              );

                              _model.transactionDocumentResult =
                                  await actions.getTransactionDocument(
                                _model.qrCode!,
                              );
                              if ((_model.transactionDocumentResult != null) ==
                                  true) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: TransactionOutDetailViewWidget(
                                          transactionParameter:
                                              _model.transactionDocumentResult!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ไม่พบข้อมูล'),
                                      content: Text(
                                          'กรุณาตรวจสอบ QR Code / ทะเบียนรถ'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('ตกลง'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              setState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Icon(
                                    Icons.upload_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    'นำรถออก',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_model.isLoading)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.loadingViewModel,
                    updateCallback: () => setState(() {}),
                    child: LoadingViewWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
