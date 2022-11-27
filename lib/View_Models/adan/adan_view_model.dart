import 'package:drosq8/models/adan_model.dart';

class AdhanViewModel {
  final AdhanModel _adhanModel;
  AdhanViewModel({required AdhanModel adhanModel}) : _adhanModel = adhanModel;

  String? get monthName {
    return _adhanModel.data!.date!.hijri!.month!.ar!;
  }

  String? get dayName {
    return _adhanModel.data!.date!.hijri!.weekday!.ar!;
  }

  String? get dayNumber {
    return _adhanModel.data!.date!.hijri!.day;
  }

  String? get date {
    return _adhanModel.data!.date!.hijri!.date;
  }

  String? get year {
    return _adhanModel.data!.date!.hijri!.year;
  }

  String? get fajr {
    return _adhanModel.data!.timings!.fajr;
  }

  String? get sunrise {
    return _adhanModel.data!.timings!.sunrise;
  }

  String? get dhuhr {
    return _adhanModel.data!.timings!.dhuhr;
  }

  String? get asr {
    return _adhanModel.data!.timings!.asr;
  }

  String? get sunset {
    return _adhanModel.data!.timings!.sunset;
  }

  String? get maghrib {
    return _adhanModel.data!.timings!.maghrib;
  }

  String? get isha {
    return _adhanModel.data!.timings!.isha;
  }

  String? get imsak {
    return _adhanModel.data!.timings!.imsak;
  }

  String? get midnight {
    return _adhanModel.data!.timings!.midnight;
  }

  String? get firstthird {
    return _adhanModel.data!.timings!.firstthird;
  }

  String? get lastthird {
    return _adhanModel.data!.timings!.lastthird;
  }
}
