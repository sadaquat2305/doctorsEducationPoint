

abstract class SubjectEvent {
}

class FetchSubjectsEvent extends SubjectEvent {
  final String documentId;

  FetchSubjectsEvent(this.documentId);


}
