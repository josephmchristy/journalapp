class JournalEntryFields {
  
  late String title;
  late String body;
  late DateTime dateTime;
  late int rating;
  
  @override
  String toString() {
    return "Title: $title, Body: $body, Time: $dateTime, Rating: $rating";
  }
}