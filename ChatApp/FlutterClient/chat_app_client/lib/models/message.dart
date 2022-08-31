class Message
{
  String? sender = '';
  String? text = '';

  Message.params({this.sender, this.text});

  Message.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['text'] = this.text;
    return data;
  }
}