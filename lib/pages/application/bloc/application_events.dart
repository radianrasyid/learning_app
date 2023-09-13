abstract class ApplicationEvent {
  const ApplicationEvent();
}

class PageEvent extends ApplicationEvent {
  final int page;

  const PageEvent({
    required this.page,
  });
}
