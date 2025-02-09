enum LocaleEnum {
  tr(phoneCountryCode: "+90", languageCode: "tr", region: "TR"),
  en(languageCode: "en", phoneCountryCode: "+44", region: "US"),
  ;

  final String phoneCountryCode;
  final String? region;
  final String languageCode;

  const LocaleEnum({
    required this.phoneCountryCode,
    this.region,
    required this.languageCode,
  });
}
