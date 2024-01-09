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
      _linewidth = prefs.getInt('ff_linewidth') ?? _linewidth;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _selectedScreenMenu = '';
  String get selectedScreenMenu => _selectedScreenMenu;
  set selectedScreenMenu(String _value) {
    _selectedScreenMenu = _value;
  }

  MarkersStruct _start = MarkersStruct.fromSerializableMap(jsonDecode(
      '{\"coordinates\":\"37.9838,23.7275\",\"imageUrl\":\"https://res.cloudinary.com/aekara/image/upload/v1698694851/Blupry_Logo_Big_2_y0qe8u.png\"}'));
  MarkersStruct get start => _start;
  set start(MarkersStruct _value) {
    _start = _value;
  }

  void updateStartStruct(Function(MarkersStruct) updateFn) {
    updateFn(_start);
  }

  MarkersStruct _end = MarkersStruct.fromSerializableMap(jsonDecode(
      '{\"imageUrl\":\"https://res.cloudinary.com/aekara/image/upload/v1698694851/Blupry_Logo_Big_2_y0qe8u.png\"}'));
  MarkersStruct get end => _end;
  set end(MarkersStruct _value) {
    _end = _value;
  }

  void updateEndStruct(Function(MarkersStruct) updateFn) {
    updateFn(_end);
  }

  List<LatLng> _points = [];
  List<LatLng> get points => _points;
  set points(List<LatLng> _value) {
    _points = _value;
  }

  void addToPoints(LatLng _value) {
    _points.add(_value);
  }

  void removeFromPoints(LatLng _value) {
    _points.remove(_value);
  }

  void removeAtIndexFromPoints(int _index) {
    _points.removeAt(_index);
  }

  void updatePointsAtIndex(
    int _index,
    LatLng Function(LatLng) updateFn,
  ) {
    _points[_index] = updateFn(_points[_index]);
  }

  void insertAtIndexInPoints(int _index, LatLng _value) {
    _points.insert(_index, _value);
  }

  Color _linecolorr = Color(4278714623);
  Color get linecolorr => _linecolorr;
  set linecolorr(Color _value) {
    _linecolorr = _value;
  }

  int _linewidth = 5;
  int get linewidth => _linewidth;
  set linewidth(int _value) {
    _linewidth = _value;
    prefs.setInt('ff_linewidth', _value);
  }

  int _index = 0;
  int get index => _index;
  set index(int _value) {
    _index = _value;
  }

  double _linesmall = 0.0;
  double get linesmall => _linesmall;
  set linesmall(double _value) {
    _linesmall = _value;
  }

  bool _loop = true;
  bool get loop => _loop;
  set loop(bool _value) {
    _loop = _value;
  }

  double _linebig = 0.0;
  double get linebig => _linebig;
  set linebig(double _value) {
    _linebig = _value;
  }

  LatLng? _tapped = LatLng(39.074208, 21.824312);
  LatLng? get tapped => _tapped;
  set tapped(LatLng? _value) {
    _tapped = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
