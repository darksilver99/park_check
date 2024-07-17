import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_out_detail_view_widget.dart'
    show TransactionOutDetailViewWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import 'package:widgets_to_image/widgets_to_image.dart';

class TransactionOutDetailViewModel
    extends FlutterFlowModel<TransactionOutDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for stampSelected widget.
  FormFieldController<List<String>>? stampSelectedValueController;
  String? get stampSelectedValue =>
      stampSelectedValueController?.value?.firstOrNull;
  set stampSelectedValue(String? val) =>
      stampSelectedValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TransactionListRecord? checkStamp;
  // Stores action output result for [Custom Action - printSlip] action in Button widget.
  PrintStatusDataStruct? printResult2;
  // Stores action output result for [Custom Action - printSlip] action in Button widget.
  PrintStatusDataStruct? printResult;

  WidgetsToImageController controller = WidgetsToImageController();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future updateCarOut(BuildContext context, controller) async {
    PrintStatusDataStruct? printResultActionBlock;

    await widget!.transactionParameter!.reference
        .update(createTransactionListRecordData(
      dateOut: getCurrentTimestamp,
      isOut: true,
    ));
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: Text('ต้องการพิมพ์ใบขาออกหรือไม่'),
                content:
                    Text('สามารถพิมพ์ย้อนหลังได้ที่เมนู \"รายการรถออก/ค้าง\"'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, false),
                    child: Text('ไม่พิมพ์'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext, true),
                    child: Text('พิมพ์'),
                  ),
                ],
              ),
            );
          },
        ) ??
        false;
    if (confirmDialogResponse) {
      printResultActionBlock = await actions.printSlip(
        controller,
      );
      if (printResultActionBlock?.status != 1) {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: CustomInfoAlertViewWidget(
                  title: printResultActionBlock!.msg,
                ),
              ),
            );
          },
        );
      }
    }
    Navigator.pop(context, 'saved');
  }
}
