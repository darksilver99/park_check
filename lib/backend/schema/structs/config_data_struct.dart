// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    String? ocrApi,
    String? defaultStampField,
    List<String>? defaultCarList,
    List<String>? defaultStampList,
    List<String>? defaultObjectiveList,
    List<String>? projectType,
    List<String>? ocrAlertText,
    List<String>? ocrErrorText,
    List<String>? provinceList,
    int? defaultBackgroundImage,
    int? storeVersion,
    String? storeAndroidLink,
    String? storeIosLink,
    String? guideUrl,
    List<String>? paymentAlertDefaultText,
    String? paymentDetailDefaultImage,
    String? defaultTextInLastSlip,
    String? defaultMoreDetailField,
    String? defaultMoreImageField,
    int? defaultMaxMoreImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ocrApi = ocrApi,
        _defaultStampField = defaultStampField,
        _defaultCarList = defaultCarList,
        _defaultStampList = defaultStampList,
        _defaultObjectiveList = defaultObjectiveList,
        _projectType = projectType,
        _ocrAlertText = ocrAlertText,
        _ocrErrorText = ocrErrorText,
        _provinceList = provinceList,
        _defaultBackgroundImage = defaultBackgroundImage,
        _storeVersion = storeVersion,
        _storeAndroidLink = storeAndroidLink,
        _storeIosLink = storeIosLink,
        _guideUrl = guideUrl,
        _paymentAlertDefaultText = paymentAlertDefaultText,
        _paymentDetailDefaultImage = paymentDetailDefaultImage,
        _defaultTextInLastSlip = defaultTextInLastSlip,
        _defaultMoreDetailField = defaultMoreDetailField,
        _defaultMoreImageField = defaultMoreImageField,
        _defaultMaxMoreImage = defaultMaxMoreImage,
        super(firestoreUtilData);

  // "ocr_api" field.
  String? _ocrApi;
  String get ocrApi => _ocrApi ?? '';
  set ocrApi(String? val) => _ocrApi = val;

  bool hasOcrApi() => _ocrApi != null;

  // "default_stamp_field" field.
  String? _defaultStampField;
  String get defaultStampField => _defaultStampField ?? '';
  set defaultStampField(String? val) => _defaultStampField = val;

  bool hasDefaultStampField() => _defaultStampField != null;

  // "default_car_list" field.
  List<String>? _defaultCarList;
  List<String> get defaultCarList => _defaultCarList ?? const [];
  set defaultCarList(List<String>? val) => _defaultCarList = val;

  void updateDefaultCarList(Function(List<String>) updateFn) {
    updateFn(_defaultCarList ??= []);
  }

  bool hasDefaultCarList() => _defaultCarList != null;

  // "default_stamp_list" field.
  List<String>? _defaultStampList;
  List<String> get defaultStampList => _defaultStampList ?? const [];
  set defaultStampList(List<String>? val) => _defaultStampList = val;

  void updateDefaultStampList(Function(List<String>) updateFn) {
    updateFn(_defaultStampList ??= []);
  }

  bool hasDefaultStampList() => _defaultStampList != null;

  // "default_objective_list" field.
  List<String>? _defaultObjectiveList;
  List<String> get defaultObjectiveList => _defaultObjectiveList ?? const [];
  set defaultObjectiveList(List<String>? val) => _defaultObjectiveList = val;

  void updateDefaultObjectiveList(Function(List<String>) updateFn) {
    updateFn(_defaultObjectiveList ??= []);
  }

  bool hasDefaultObjectiveList() => _defaultObjectiveList != null;

  // "project_type" field.
  List<String>? _projectType;
  List<String> get projectType => _projectType ?? const [];
  set projectType(List<String>? val) => _projectType = val;

  void updateProjectType(Function(List<String>) updateFn) {
    updateFn(_projectType ??= []);
  }

  bool hasProjectType() => _projectType != null;

  // "ocr_alert_text" field.
  List<String>? _ocrAlertText;
  List<String> get ocrAlertText => _ocrAlertText ?? const [];
  set ocrAlertText(List<String>? val) => _ocrAlertText = val;

  void updateOcrAlertText(Function(List<String>) updateFn) {
    updateFn(_ocrAlertText ??= []);
  }

  bool hasOcrAlertText() => _ocrAlertText != null;

  // "ocr_error_text" field.
  List<String>? _ocrErrorText;
  List<String> get ocrErrorText => _ocrErrorText ?? const [];
  set ocrErrorText(List<String>? val) => _ocrErrorText = val;

  void updateOcrErrorText(Function(List<String>) updateFn) {
    updateFn(_ocrErrorText ??= []);
  }

  bool hasOcrErrorText() => _ocrErrorText != null;

  // "province_list" field.
  List<String>? _provinceList;
  List<String> get provinceList => _provinceList ?? const [];
  set provinceList(List<String>? val) => _provinceList = val;

  void updateProvinceList(Function(List<String>) updateFn) {
    updateFn(_provinceList ??= []);
  }

  bool hasProvinceList() => _provinceList != null;

  // "default_background_image" field.
  int? _defaultBackgroundImage;
  int get defaultBackgroundImage => _defaultBackgroundImage ?? 0;
  set defaultBackgroundImage(int? val) => _defaultBackgroundImage = val;

  void incrementDefaultBackgroundImage(int amount) =>
      defaultBackgroundImage = defaultBackgroundImage + amount;

  bool hasDefaultBackgroundImage() => _defaultBackgroundImage != null;

  // "store_version" field.
  int? _storeVersion;
  int get storeVersion => _storeVersion ?? 0;
  set storeVersion(int? val) => _storeVersion = val;

  void incrementStoreVersion(int amount) =>
      storeVersion = storeVersion + amount;

  bool hasStoreVersion() => _storeVersion != null;

  // "store_android_link" field.
  String? _storeAndroidLink;
  String get storeAndroidLink => _storeAndroidLink ?? '';
  set storeAndroidLink(String? val) => _storeAndroidLink = val;

  bool hasStoreAndroidLink() => _storeAndroidLink != null;

  // "store_ios_link" field.
  String? _storeIosLink;
  String get storeIosLink => _storeIosLink ?? '';
  set storeIosLink(String? val) => _storeIosLink = val;

  bool hasStoreIosLink() => _storeIosLink != null;

  // "guide_url" field.
  String? _guideUrl;
  String get guideUrl => _guideUrl ?? '';
  set guideUrl(String? val) => _guideUrl = val;

  bool hasGuideUrl() => _guideUrl != null;

  // "payment_alert_default_text" field.
  List<String>? _paymentAlertDefaultText;
  List<String> get paymentAlertDefaultText =>
      _paymentAlertDefaultText ?? const [];
  set paymentAlertDefaultText(List<String>? val) =>
      _paymentAlertDefaultText = val;

  void updatePaymentAlertDefaultText(Function(List<String>) updateFn) {
    updateFn(_paymentAlertDefaultText ??= []);
  }

  bool hasPaymentAlertDefaultText() => _paymentAlertDefaultText != null;

  // "payment_detail_default_image" field.
  String? _paymentDetailDefaultImage;
  String get paymentDetailDefaultImage => _paymentDetailDefaultImage ?? '';
  set paymentDetailDefaultImage(String? val) =>
      _paymentDetailDefaultImage = val;

  bool hasPaymentDetailDefaultImage() => _paymentDetailDefaultImage != null;

  // "default_text_in_last_slip" field.
  String? _defaultTextInLastSlip;
  String get defaultTextInLastSlip => _defaultTextInLastSlip ?? '';
  set defaultTextInLastSlip(String? val) => _defaultTextInLastSlip = val;

  bool hasDefaultTextInLastSlip() => _defaultTextInLastSlip != null;

  // "default_more_detail_field" field.
  String? _defaultMoreDetailField;
  String get defaultMoreDetailField => _defaultMoreDetailField ?? '';
  set defaultMoreDetailField(String? val) => _defaultMoreDetailField = val;

  bool hasDefaultMoreDetailField() => _defaultMoreDetailField != null;

  // "default_more_image_field" field.
  String? _defaultMoreImageField;
  String get defaultMoreImageField => _defaultMoreImageField ?? '';
  set defaultMoreImageField(String? val) => _defaultMoreImageField = val;

  bool hasDefaultMoreImageField() => _defaultMoreImageField != null;

  // "default_max_more_image" field.
  int? _defaultMaxMoreImage;
  int get defaultMaxMoreImage => _defaultMaxMoreImage ?? 0;
  set defaultMaxMoreImage(int? val) => _defaultMaxMoreImage = val;

  void incrementDefaultMaxMoreImage(int amount) =>
      defaultMaxMoreImage = defaultMaxMoreImage + amount;

  bool hasDefaultMaxMoreImage() => _defaultMaxMoreImage != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        ocrApi: data['ocr_api'] as String?,
        defaultStampField: data['default_stamp_field'] as String?,
        defaultCarList: getDataList(data['default_car_list']),
        defaultStampList: getDataList(data['default_stamp_list']),
        defaultObjectiveList: getDataList(data['default_objective_list']),
        projectType: getDataList(data['project_type']),
        ocrAlertText: getDataList(data['ocr_alert_text']),
        ocrErrorText: getDataList(data['ocr_error_text']),
        provinceList: getDataList(data['province_list']),
        defaultBackgroundImage:
            castToType<int>(data['default_background_image']),
        storeVersion: castToType<int>(data['store_version']),
        storeAndroidLink: data['store_android_link'] as String?,
        storeIosLink: data['store_ios_link'] as String?,
        guideUrl: data['guide_url'] as String?,
        paymentAlertDefaultText:
            getDataList(data['payment_alert_default_text']),
        paymentDetailDefaultImage:
            data['payment_detail_default_image'] as String?,
        defaultTextInLastSlip: data['default_text_in_last_slip'] as String?,
        defaultMoreDetailField: data['default_more_detail_field'] as String?,
        defaultMoreImageField: data['default_more_image_field'] as String?,
        defaultMaxMoreImage: castToType<int>(data['default_max_more_image']),
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ocr_api': _ocrApi,
        'default_stamp_field': _defaultStampField,
        'default_car_list': _defaultCarList,
        'default_stamp_list': _defaultStampList,
        'default_objective_list': _defaultObjectiveList,
        'project_type': _projectType,
        'ocr_alert_text': _ocrAlertText,
        'ocr_error_text': _ocrErrorText,
        'province_list': _provinceList,
        'default_background_image': _defaultBackgroundImage,
        'store_version': _storeVersion,
        'store_android_link': _storeAndroidLink,
        'store_ios_link': _storeIosLink,
        'guide_url': _guideUrl,
        'payment_alert_default_text': _paymentAlertDefaultText,
        'payment_detail_default_image': _paymentDetailDefaultImage,
        'default_text_in_last_slip': _defaultTextInLastSlip,
        'default_more_detail_field': _defaultMoreDetailField,
        'default_more_image_field': _defaultMoreImageField,
        'default_max_more_image': _defaultMaxMoreImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ocr_api': serializeParam(
          _ocrApi,
          ParamType.String,
        ),
        'default_stamp_field': serializeParam(
          _defaultStampField,
          ParamType.String,
        ),
        'default_car_list': serializeParam(
          _defaultCarList,
          ParamType.String,
          isList: true,
        ),
        'default_stamp_list': serializeParam(
          _defaultStampList,
          ParamType.String,
          isList: true,
        ),
        'default_objective_list': serializeParam(
          _defaultObjectiveList,
          ParamType.String,
          isList: true,
        ),
        'project_type': serializeParam(
          _projectType,
          ParamType.String,
          isList: true,
        ),
        'ocr_alert_text': serializeParam(
          _ocrAlertText,
          ParamType.String,
          isList: true,
        ),
        'ocr_error_text': serializeParam(
          _ocrErrorText,
          ParamType.String,
          isList: true,
        ),
        'province_list': serializeParam(
          _provinceList,
          ParamType.String,
          isList: true,
        ),
        'default_background_image': serializeParam(
          _defaultBackgroundImage,
          ParamType.int,
        ),
        'store_version': serializeParam(
          _storeVersion,
          ParamType.int,
        ),
        'store_android_link': serializeParam(
          _storeAndroidLink,
          ParamType.String,
        ),
        'store_ios_link': serializeParam(
          _storeIosLink,
          ParamType.String,
        ),
        'guide_url': serializeParam(
          _guideUrl,
          ParamType.String,
        ),
        'payment_alert_default_text': serializeParam(
          _paymentAlertDefaultText,
          ParamType.String,
          isList: true,
        ),
        'payment_detail_default_image': serializeParam(
          _paymentDetailDefaultImage,
          ParamType.String,
        ),
        'default_text_in_last_slip': serializeParam(
          _defaultTextInLastSlip,
          ParamType.String,
        ),
        'default_more_detail_field': serializeParam(
          _defaultMoreDetailField,
          ParamType.String,
        ),
        'default_more_image_field': serializeParam(
          _defaultMoreImageField,
          ParamType.String,
        ),
        'default_max_more_image': serializeParam(
          _defaultMaxMoreImage,
          ParamType.int,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        ocrApi: deserializeParam(
          data['ocr_api'],
          ParamType.String,
          false,
        ),
        defaultStampField: deserializeParam(
          data['default_stamp_field'],
          ParamType.String,
          false,
        ),
        defaultCarList: deserializeParam<String>(
          data['default_car_list'],
          ParamType.String,
          true,
        ),
        defaultStampList: deserializeParam<String>(
          data['default_stamp_list'],
          ParamType.String,
          true,
        ),
        defaultObjectiveList: deserializeParam<String>(
          data['default_objective_list'],
          ParamType.String,
          true,
        ),
        projectType: deserializeParam<String>(
          data['project_type'],
          ParamType.String,
          true,
        ),
        ocrAlertText: deserializeParam<String>(
          data['ocr_alert_text'],
          ParamType.String,
          true,
        ),
        ocrErrorText: deserializeParam<String>(
          data['ocr_error_text'],
          ParamType.String,
          true,
        ),
        provinceList: deserializeParam<String>(
          data['province_list'],
          ParamType.String,
          true,
        ),
        defaultBackgroundImage: deserializeParam(
          data['default_background_image'],
          ParamType.int,
          false,
        ),
        storeVersion: deserializeParam(
          data['store_version'],
          ParamType.int,
          false,
        ),
        storeAndroidLink: deserializeParam(
          data['store_android_link'],
          ParamType.String,
          false,
        ),
        storeIosLink: deserializeParam(
          data['store_ios_link'],
          ParamType.String,
          false,
        ),
        guideUrl: deserializeParam(
          data['guide_url'],
          ParamType.String,
          false,
        ),
        paymentAlertDefaultText: deserializeParam<String>(
          data['payment_alert_default_text'],
          ParamType.String,
          true,
        ),
        paymentDetailDefaultImage: deserializeParam(
          data['payment_detail_default_image'],
          ParamType.String,
          false,
        ),
        defaultTextInLastSlip: deserializeParam(
          data['default_text_in_last_slip'],
          ParamType.String,
          false,
        ),
        defaultMoreDetailField: deserializeParam(
          data['default_more_detail_field'],
          ParamType.String,
          false,
        ),
        defaultMoreImageField: deserializeParam(
          data['default_more_image_field'],
          ParamType.String,
          false,
        ),
        defaultMaxMoreImage: deserializeParam(
          data['default_max_more_image'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigDataStruct &&
        ocrApi == other.ocrApi &&
        defaultStampField == other.defaultStampField &&
        listEquality.equals(defaultCarList, other.defaultCarList) &&
        listEquality.equals(defaultStampList, other.defaultStampList) &&
        listEquality.equals(defaultObjectiveList, other.defaultObjectiveList) &&
        listEquality.equals(projectType, other.projectType) &&
        listEquality.equals(ocrAlertText, other.ocrAlertText) &&
        listEquality.equals(ocrErrorText, other.ocrErrorText) &&
        listEquality.equals(provinceList, other.provinceList) &&
        defaultBackgroundImage == other.defaultBackgroundImage &&
        storeVersion == other.storeVersion &&
        storeAndroidLink == other.storeAndroidLink &&
        storeIosLink == other.storeIosLink &&
        guideUrl == other.guideUrl &&
        listEquality.equals(
            paymentAlertDefaultText, other.paymentAlertDefaultText) &&
        paymentDetailDefaultImage == other.paymentDetailDefaultImage &&
        defaultTextInLastSlip == other.defaultTextInLastSlip &&
        defaultMoreDetailField == other.defaultMoreDetailField &&
        defaultMoreImageField == other.defaultMoreImageField &&
        defaultMaxMoreImage == other.defaultMaxMoreImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ocrApi,
        defaultStampField,
        defaultCarList,
        defaultStampList,
        defaultObjectiveList,
        projectType,
        ocrAlertText,
        ocrErrorText,
        provinceList,
        defaultBackgroundImage,
        storeVersion,
        storeAndroidLink,
        storeIosLink,
        guideUrl,
        paymentAlertDefaultText,
        paymentDetailDefaultImage,
        defaultTextInLastSlip,
        defaultMoreDetailField,
        defaultMoreImageField,
        defaultMaxMoreImage
      ]);
}

ConfigDataStruct createConfigDataStruct({
  String? ocrApi,
  String? defaultStampField,
  int? defaultBackgroundImage,
  int? storeVersion,
  String? storeAndroidLink,
  String? storeIosLink,
  String? guideUrl,
  String? paymentDetailDefaultImage,
  String? defaultTextInLastSlip,
  String? defaultMoreDetailField,
  String? defaultMoreImageField,
  int? defaultMaxMoreImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      ocrApi: ocrApi,
      defaultStampField: defaultStampField,
      defaultBackgroundImage: defaultBackgroundImage,
      storeVersion: storeVersion,
      storeAndroidLink: storeAndroidLink,
      storeIosLink: storeIosLink,
      guideUrl: guideUrl,
      paymentDetailDefaultImage: paymentDetailDefaultImage,
      defaultTextInLastSlip: defaultTextInLastSlip,
      defaultMoreDetailField: defaultMoreDetailField,
      defaultMoreImageField: defaultMoreImageField,
      defaultMaxMoreImage: defaultMaxMoreImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigDataStruct? updateConfigDataStruct(
  ConfigDataStruct? configData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigDataStructData(
  Map<String, dynamic> firestoreData,
  ConfigDataStruct? configData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configData == null) {
    return;
  }
  if (configData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configDataData = getConfigDataFirestoreData(configData, forFieldValue);
  final nestedData = configDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigDataFirestoreData(
  ConfigDataStruct? configData, [
  bool forFieldValue = false,
]) {
  if (configData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configData.toMap());

  // Add any Firestore field values
  configData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigDataListFirestoreData(
  List<ConfigDataStruct>? configDatas,
) =>
    configDatas?.map((e) => getConfigDataFirestoreData(e, true)).toList() ?? [];
