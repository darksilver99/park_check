import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_projectData')) {
        try {
          final serializedData = prefs.getString('ff_projectData') ?? '{}';
          _projectData =
              ProjectDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _tmpTransactionList = prefs
              .getStringList('ff_tmpTransactionList')
              ?.map((x) {
                try {
                  return TransactionDataStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _tmpTransactionList;
    });
    _safeInit(() {
      _currentDate = prefs.containsKey('ff_currentDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_currentDate')!)
          : _currentDate;
    });
    _safeInit(() {
      _isSkipOCRAlert = prefs.getBool('ff_isSkipOCRAlert') ?? _isSkipOCRAlert;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  ProjectDataStruct _projectData = ProjectDataStruct();
  ProjectDataStruct get projectData => _projectData;
  set projectData(ProjectDataStruct value) {
    _projectData = value;
    prefs.setString('ff_projectData', value.serialize());
  }

  void updateProjectDataStruct(Function(ProjectDataStruct) updateFn) {
    updateFn(_projectData);
    prefs.setString('ff_projectData', _projectData.serialize());
  }

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  List<TransactionDataStruct> _tmpTransactionList = [];
  List<TransactionDataStruct> get tmpTransactionList => _tmpTransactionList;
  set tmpTransactionList(List<TransactionDataStruct> value) {
    _tmpTransactionList = value;
    prefs.setStringList(
        'ff_tmpTransactionList', value.map((x) => x.serialize()).toList());
  }

  void addToTmpTransactionList(TransactionDataStruct value) {
    tmpTransactionList.add(value);
    prefs.setStringList('ff_tmpTransactionList',
        _tmpTransactionList.map((x) => x.serialize()).toList());
  }

  void removeFromTmpTransactionList(TransactionDataStruct value) {
    tmpTransactionList.remove(value);
    prefs.setStringList('ff_tmpTransactionList',
        _tmpTransactionList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTmpTransactionList(int index) {
    tmpTransactionList.removeAt(index);
    prefs.setStringList('ff_tmpTransactionList',
        _tmpTransactionList.map((x) => x.serialize()).toList());
  }

  void updateTmpTransactionListAtIndex(
    int index,
    TransactionDataStruct Function(TransactionDataStruct) updateFn,
  ) {
    tmpTransactionList[index] = updateFn(_tmpTransactionList[index]);
    prefs.setStringList('ff_tmpTransactionList',
        _tmpTransactionList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTmpTransactionList(
      int index, TransactionDataStruct value) {
    tmpTransactionList.insert(index, value);
    prefs.setStringList('ff_tmpTransactionList',
        _tmpTransactionList.map((x) => x.serialize()).toList());
  }

  DateTime? _currentDate = DateTime.fromMillisecondsSinceEpoch(13064400000);
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
    value != null
        ? prefs.setInt('ff_currentDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_currentDate');
  }

  bool _isSkipOCRAlert = false;
  bool get isSkipOCRAlert => _isSkipOCRAlert;
  set isSkipOCRAlert(bool value) {
    _isSkipOCRAlert = value;
    prefs.setBool('ff_isSkipOCRAlert', value);
  }

  bool _isSkipExpireAlert = false;
  bool get isSkipExpireAlert => _isSkipExpireAlert;
  set isSkipExpireAlert(bool value) {
    _isSkipExpireAlert = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
