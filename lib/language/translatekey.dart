import 'localizetion_services.dart';

enum TKey{
  English,
  Deutsch,
  Spanish,
  French,
  Portuguese,
  BahasaIndonesia,
  Russian,
  Italian
}

extension TKeyExtension on TKey{
  String get _string =>  toString().split('.')[1];

  String translate(context){
    return  LocalizationService.of(context).translate(_string) ?? '';
  }
}