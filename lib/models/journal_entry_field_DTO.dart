class JournalEntryFieldDTO {
  
  late String title;
  late String body;
  late DateTime dateTime;
  late String rating;

  JournalEntryFieldDTO({required this.title, required this.body, required this.dateTime, required this.rating});
  
  @override
  String toString() {
    return "Title: $title, Body: $body, Rating: $rating";
  }
}