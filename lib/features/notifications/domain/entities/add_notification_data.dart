class AddNotificationData {
  final String audienceType;
  final String title;
  final String body;
  final bool hasImage;
  final bool hasFile;

  const AddNotificationData({
    this.audienceType = 'all',
    this.title = '',
    this.body = '',
    this.hasImage = false,
    this.hasFile = false,
  });

  AddNotificationData copyWith({
    String? audienceType,
    String? title,
    String? body,
    bool? hasImage,
    bool? hasFile,
  }) {
    return AddNotificationData(
      audienceType: audienceType ?? this.audienceType,
      title: title ?? this.title,
      body: body ?? this.body,
      hasImage: hasImage ?? this.hasImage,
      hasFile: hasFile ?? this.hasFile,
    );
  }
}
