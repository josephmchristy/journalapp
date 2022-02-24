class JournalEntryFieldDTO {
  
  late String title;
  late String body;
  late String dateTime;
  late int rating;

  JournalEntryFieldDTO({required this.title, required this.body, required this.rating, required this.dateTime});
  
  @override
  String toString() {
    return "Title: $title, Body: $body, Rating: $rating";
  }
}