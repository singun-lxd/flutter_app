import 'dart:io' show Platform;

enum CompatMode {
  AutoDetect, Material, Cupertino
}

// 默认为自动检测
CompatMode _compatMode = _autoDetectCompatMode();
bool get isMaterial => _compatMode == CompatMode.Material;
bool get isCupertino => _compatMode == CompatMode.Cupertino;

CompatMode _autoDetectCompatMode() {
  bool materialCompat = Platform.isAndroid || Platform.isFuchsia || Platform.isLinux || Platform.isWindows;
  bool cupertinoCompat = Platform.isIOS || Platform.isMacOS;
  if (materialCompat) {
    return CompatMode.Material;
  } else if (cupertinoCompat) {
    return CompatMode.Cupertino;
  } else {
    throw UnsupportedError('unsupported platform');
  }
}

void setCompatMode(CompatMode mode) {
  switch (mode) {
    case CompatMode.Material:
    case CompatMode.Cupertino:
      _compatMode = mode;
      break;
    case CompatMode.AutoDetect:
      _autoDetectCompatMode();
      break;
  }
}

