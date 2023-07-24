class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;
  String accountID; // new field

  Todo(
      {required this.createdTime,
      required this.title,
      this.description = '',
      this.id = '',
      this.isDone = false,
      required this.accountID}); // updated constructor

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      createdTime: DateTime.parse(json['createdTime']),
      title: json['title'],
      description: json['content'],
      isDone: json['iscomplete'],
      id: json['noteNum'].toString(),
      accountID: json['accountID'], // new field
    );
  }
}
