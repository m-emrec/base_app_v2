enum RemoteConfigParameters {
  minAppVersion("minimum_supported_app_version"),
  eventCategories("event_categories");

  const RemoteConfigParameters(this.parameterName);

  final String parameterName;
}
