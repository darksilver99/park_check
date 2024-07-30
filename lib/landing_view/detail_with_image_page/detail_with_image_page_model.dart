import '/component/main_background_view/main_background_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'detail_with_image_page_widget.dart' show DetailWithImagePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailWithImagePageModel
    extends FlutterFlowModel<DetailWithImagePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    mainBackgroundViewModel.dispose();
  }
}
