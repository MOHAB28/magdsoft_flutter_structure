import '../../models/help_model.dart';

class HelpResponse extends HelpModel {
  final List<HelpItemResponse>? itemsR;
  HelpResponse({
    int? status,
    String? message,
    this.itemsR,
  }) : super(
          items: itemsR!,
          message: message!,
          status: status!,
        );

  factory HelpResponse.fromJson(Map<String, dynamic> json) {
    List<HelpItemResponse> items = [];
    if (json['help'] != null) {
      for (var item in json['help']) {
        items.add(HelpItemResponse.fromJson(item));
      }
    }
    return HelpResponse(
      itemsR: items,
      message: json['message'],
      status: json['status'],
    );
  }
}

class HelpItemResponse extends HelpItems {
  HelpItemResponse({
    int? id,
    String? question,
    String? answer,
  }) : super(
          id: id!,
          question: question!,
          answer: answer!,
        );

  factory HelpItemResponse.fromJson(Map<String, dynamic> json) {
    return HelpItemResponse(
      id: json['id'],
      answer: json['answer'],
      question: json['question'],
    );
  }
}
