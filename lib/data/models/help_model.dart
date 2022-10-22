class HelpModel {
  final int status;
  final String message;
  final List<HelpItems> items;
  const HelpModel({
    required this.items,
    required this.message,
    required this.status,
  });
}

class HelpItems {
  final int id;
  final String question;
  final String answer;
  const HelpItems({
    required this.answer,
    required this.id,
    required this.question,
  });
}
