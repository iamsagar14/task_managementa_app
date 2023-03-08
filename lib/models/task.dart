class Task {
  int? id;
  String? title;
  String? note;
  int? isComplected;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repate;
  Task(
      {this.id,
      this.title,
      this.note,
      this.isComplected,
      this.date,
      this.startTime,
      this.endTime,
      this.color,
      this.remind,
      this.repate});
  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isComplected = json['isComplected'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    remind = json['remind'];
    repate = json['repete'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.note;
    data['isComplected'] = this.isComplected;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    data['remind'] = this.remind;
    data['repete'] = this.repate;
    return data;
  }
}
