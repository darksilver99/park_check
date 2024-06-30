import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:park_check/flutter_flow/flutter_flow_theme.dart';

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

      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });

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
      children: [
        StreamBuilder<bool>(
          stream: bluetoothPrint.isScanning,
          initialData: false,
          builder: (c, snapshot) {
            if (snapshot.data == true) {
              return FloatingActionButton(
                child: Icon(Icons.stop),
                onPressed: () => bluetoothPrint.stopScan(),
                backgroundColor: Colors.red,
              );
            } else {
              return FloatingActionButton(child: Icon(Icons.search), onPressed: () => bluetoothPrint.startScan(timeout: Duration(seconds: 4)));
            }
          },
        ),

        OutlinedButton(
          child: Text('connect'),
          onPressed:  _connected?null:() async {
            if(_device!=null && _device!.address !=null){
              setState(() {
                tips = 'connecting...';
              });
              await bluetoothPrint.connect(_device!);
            }else{
              setState(() {
                tips = 'please select device';
              });
              print('please select device');
            }
          },
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
