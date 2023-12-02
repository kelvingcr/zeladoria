import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'complete_company_profile_page_widget.dart'
    show CompleteCompanyProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CompleteCompanyProfilePageModel
    extends FlutterFlowModel<CompleteCompanyProfilePageWidget> {
  ///  Local state fields for this page.

  String image = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for edtNomeEmpresa widget.
  FocusNode? edtNomeEmpresaFocusNode;
  TextEditingController? edtNomeEmpresaController;
  String? Function(BuildContext, String?)? edtNomeEmpresaControllerValidator;
  String? _edtNomeEmpresaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ozov39d4' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for edtCNPJ widget.
  FocusNode? edtCNPJFocusNode;
  TextEditingController? edtCNPJController;
  final edtCNPJMask = MaskTextInputFormatter(mask: '##. ###. ###/0001-##');
  String? Function(BuildContext, String?)? edtCNPJControllerValidator;
  String? _edtCNPJControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't6o3l1eh' /* Campo obrigatório */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in btnCriarEmpresa widget.
  EmpresasRecord? outPutCriarEmpresa;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    edtNomeEmpresaControllerValidator = _edtNomeEmpresaControllerValidator;
    edtCNPJControllerValidator = _edtCNPJControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    edtNomeEmpresaFocusNode?.dispose();
    edtNomeEmpresaController?.dispose();

    edtCNPJFocusNode?.dispose();
    edtCNPJController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
