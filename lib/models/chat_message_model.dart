class ChatMessageModel {
  final String? text, image;
  final String hour;
  final bool isSender;

  const ChatMessageModel({
    this.text,
    this.image,
    required this.isSender,
    required this.hour,
  });
}
