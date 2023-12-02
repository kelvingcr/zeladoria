import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'complete_your_profile_page_widget.dart'
    show CompleteYourProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CompleteYourProfilePageModel
    extends FlutterFlowModel<CompleteYourProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for edtPrimeiroNome widget.
  FocusNode? edtPrimeiroNomeFocusNode;
  TextEditingController? edtPrimeiroNomeController;
  String? Function(BuildContext, String?)? edtPrimeiroNomeControllerValidator;
  String? _edtPrimeiroNomeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w8gr7n1f' /* Campo obrigátorio */,
      );
    }

    return null;
  }

  // State field(s) for edtSobrenome widget.
  FocusNode? edtSobrenomeFocusNode;
  TextEditingController? edtSobrenomeController;
  String? Function(BuildContext, String?)? edtSobrenomeControllerValidator;
  String? _edtSobrenomeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wgcvomei' /* Campo obrigátorio */,
      );
    }

    return null;
  }

  // State field(s) for edtEmail widget.
  FocusNode? edtEmailFocusNode;
  TextEditingController? edtEmailController;
  String? Function(BuildContext, String?)? edtEmailControllerValidator;
  String? _edtEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zd8ciqaz' /* Campo obrigátorio */,
      );
    }

    return null;
  }

  // State field(s) for edtDDD widget.
  FocusNode? edtDDDFocusNode;
  TextEditingController? edtDDDController;
  String? Function(BuildContext, String?)? edtDDDControllerValidator;
  String? _edtDDDControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8uhyqm4r' /* Field is requiredCampo obrigát... */,
      );
    }

    return null;
  }

  // State field(s) for edtTelefone widget.
  FocusNode? edtTelefoneFocusNode;
  TextEditingController? edtTelefoneController;
  final edtTelefoneMask = MaskTextInputFormatter(mask: '#####-####');
  String? Function(BuildContext, String?)? edtTelefoneControllerValidator;
  String? _edtTelefoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yujgf90a' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for edtCPF widget.
  FocusNode? edtCPFFocusNode;
  TextEditingController? edtCPFController;
  final edtCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? edtCPFControllerValidator;
  String? _edtCPFControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'k5y4ajzf' /* Field is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    edtPrimeiroNomeControllerValidator = _edtPrimeiroNomeControllerValidator;
    edtSobrenomeControllerValidator = _edtSobrenomeControllerValidator;
    edtEmailControllerValidator = _edtEmailControllerValidator;
    edtDDDControllerValidator = _edtDDDControllerValidator;
    edtTelefoneControllerValidator = _edtTelefoneControllerValidator;
    edtCPFControllerValidator = _edtCPFControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    edtPrimeiroNomeFocusNode?.dispose();
    edtPrimeiroNomeController?.dispose();

    edtSobrenomeFocusNode?.dispose();
    edtSobrenomeController?.dispose();

    edtEmailFocusNode?.dispose();
    edtEmailController?.dispose();

    edtDDDFocusNode?.dispose();
    edtDDDController?.dispose();

    edtTelefoneFocusNode?.dispose();
    edtTelefoneController?.dispose();

    edtCPFFocusNode?.dispose();
    edtCPFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
