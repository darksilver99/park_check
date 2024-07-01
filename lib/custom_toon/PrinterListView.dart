import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:park_check/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import 'package:park_check/flutter_flow/flutter_flow_theme.dart';
import 'package:park_check/flutter_flow/flutter_flow_widgets.dart';

class PrinterListView extends StatefulWidget {
  const PrinterListView({super.key});

  @override
  State<PrinterListView> createState() => _PrinterListViewState();
}

class _PrinterListViewState extends State<PrinterListView> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  bool _connected = false;
  BluetoothDevice? _device;
  String tips = 'no device connect';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      initBluetooth();
    });
  }

  Future<void> initBluetooth() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 4));

    bool isConnected = await bluetoothPrint.isConnected ?? false;

    bluetoothPrint.state.listen((state) {
      print('******************* cur device status: $state');
      print("BluetoothPrint.CONNECTED : ${BluetoothPrint.CONNECTED}");
      print("BluetoothPrint.DISCONNECTED : ${BluetoothPrint.DISCONNECTED}");

      switch (state) {
        case BluetoothPrint.CONNECTED:
          print(">>>a");
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          print(">>>b");
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          print(">>>c");
          break;
      }
    });

    print("tips $tips");

    if (!mounted) return;

    if (isConnected) {
      setState(() {
        _connected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                  child: StreamBuilder<bool>(
                    stream: bluetoothPrint.isScanning,
                    initialData: false,
                    builder: (c, snapshot) {
                      if (snapshot.data == true) {
                        return FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                            //bluetoothPrint.stopScan();
                          },
                          text: 'กำลังค้นหา...',
                          options: FFButtonOptions(
                            height: 40,
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      } else {
                        return // Generated code for this Button Widget...
                            FFButtonWidget(
                          onPressed: () {
                            bluetoothPrint.startScan(timeout: Duration(seconds: 4));
                          },
                          text: 'ค้นหา',
                          icon: Icon(
                            Icons.search_rounded,
                            size: 22,
                          ),
                          options: FFButtonOptions(
                            height: 40,
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Flexible(
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_connected) {
                      await bluetoothPrint.disconnect();
                      await bluetoothPrint.destroy();
                      _connected = false;
                      setState(() {});
                      return;
                    }
                    if (_device != null && _device!.address != null) {
                      setState(() {
                        tips = 'connecting...';
                      });
                      await bluetoothPrint.connect(_device!);
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                            child: CustomInfoAlertViewWidget(
                              title: "เชื่อมต่อสำเร็จ",
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    } else {
                      setState(() {
                        tips = 'please select device';
                      });
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                            child: CustomInfoAlertViewWidget(
                              title: "กรุณาเลือกเครื่องพิมพ์",
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    }
                  },
                  text: (_connected) ? 'ยกเลิกเชื่อมต่อ' : 'เชื่อมต่อ',
                  options: FFButtonOptions(
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<List<BluetoothDevice>>(
            stream: bluetoothPrint.scanResults,
            initialData: [],
            builder: (c, snapshot) => Column(
              children: snapshot.data!
                  .map(
                    (d) => InkWell(
                      onTap: () {
                        setState(() {
                          _device = d;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                    child: Text(
                                      d.name ?? '',
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 18,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                if (_device != null && _device!.address == d.address)
                                  Icon(
                                    Icons.check,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 24,
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),

              /*children: snapshot.data!
                  .map((d) => ListTile(
                        title: Text(d.name ?? ''),
                        subtitle: Text(d.address ?? ''),
                        onTap: () async {
                          setState(() {
                            _device = d;
                          });
                        },
                        trailing: _device != null && _device!.address == d.address
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : null,
                      ))
                  .toList(),*/
            ),
          ),
        ),
      ],
    );
  }
}
