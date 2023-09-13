class ApplicationStates {
  final int page;
  const ApplicationStates({this.page = 0});

  ApplicationStates copyWith({int? page}) {
    return ApplicationStates(page: page ?? this.page);
  }
}
