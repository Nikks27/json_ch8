class GeetaModel {
  late int Chapter;
  late List<Verses> Verse;
  late ChapterName chapterName;

  GeetaModel(
      {required this.Chapter, required this.Verse, required this.chapterName});

  factory GeetaModel.fromJson(Map m1) {
    return GeetaModel(
        Chapter: m1['Chapter'],
        Verse: (m1['Verses'] as List)
            .map(
              (e) => Verses.fromJson(
                e,
              ),
            )
            .toList(),
        chapterName: ChapterName.fromJson(m1['ChapterName']));
  }
}

class ChapterName {
  late String hindi, english, gujarati, sanskrit;

  ChapterName(
      {required this.hindi,
      required this.english,
      required this.gujarati,
      required this.sanskrit});

  factory ChapterName.fromJson(Map m1) {
    return ChapterName(
        hindi: m1['Hindi'],
        english: m1['English'],
        gujarati: m1['Gujarati'],
        sanskrit: m1['Sanskrit']);
  }
}

class Verses {
  late int VerseNumber;
  late Language language;

  Verses({required this.VerseNumber, required this.language});

  factory Verses.fromJson(Map m1) {
    return Verses(
      VerseNumber: m1['VerseNumber'],
      language: Language.fromJson(m1['Text']),
    );
  }
}

class Language {
  late String hindi, english, gujarati, sanskrit;

  Language(
      {required this.hindi,
      required this.english,
      required this.gujarati,
      required this.sanskrit});

  factory Language.fromJson(Map m1) {
    return Language(
        hindi: m1['Hindi'],
        english: m1['English'],
        gujarati: m1['Gujarati'],
        sanskrit: m1['Sanskrit']);
  }
}
