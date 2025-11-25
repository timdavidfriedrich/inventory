sealed class DeclutterSessionConfig {
  final String contextName;
  const DeclutterSessionConfig({required this.contextName});
}

class DeclutterByLocationSessionConfig extends DeclutterSessionConfig {
  final int locationId;
  const DeclutterByLocationSessionConfig({
    required this.locationId,
    required super.contextName,
  });
}

class DeclutterByTagSessionConfig extends DeclutterSessionConfig {
  final String tag;
  const DeclutterByTagSessionConfig({
    required this.tag,
    required super.contextName,
  });
}

class QuickDeclutterSessionConfig extends DeclutterSessionConfig {
  final int? maxItems;
  const QuickDeclutterSessionConfig({
    this.maxItems,
    required super.contextName,
  });
}
