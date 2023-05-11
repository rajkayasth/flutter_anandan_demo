import 'dart:convert';
/// count : 20
/// totalCount : 2127
/// page : 1
/// totalPages : 107
/// lastItemIndex : 20
/// results : [{"_id":"An5NAXPrbN","author":"Thomas Edison","content":"Hell, there are no rules here-- we're trying to accomplish something.","tags":[],"authorSlug":"thomas-edison","length":69,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"bfNpGC2NI","author":"Thomas Edison","content":"As a cure for worrying, work is better than whisky.","tags":["Humorous"],"authorSlug":"thomas-edison","length":51,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"btV2j1uf2t","author":"Thomas Edison","content":"Faith, as well intentioned as it may be, must be built on facts, not fiction--faith in fiction is a damnable false hope.","tags":["Religion"],"authorSlug":"thomas-edison","length":120,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"XtZMaD2s28","author":"Thomas Edison","content":"If we all did the things we are capable of doing, we would literally astound ourselves.","tags":["Inspirational","Motivational"],"authorSlug":"thomas-edison","length":87,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"R1DmP1kYtW","author":"Charles Dickens","content":"Reflect on your present blessings, of which every man has many; not on your past misfortunes, of which all men have some.","tags":["Gratitude"],"authorSlug":"charles-dickens","length":121,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"bZIw7gy0sR","author":"Thomas Edison","content":"I never did anything worth doing by accident, nor did any of my inventions come by accident","tags":["Success","Science"],"authorSlug":"thomas-edison","length":91,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"ghVnmSpeAo","author":"Thomas Edison","content":"Everything comes to him who hustles while he waits.","tags":["Success","Motivational"],"authorSlug":"thomas-edison","length":51,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"QfeIDluRi_","author":"Thomas Edison","content":"There is no expedient to which a man will not go to avoid the labor of thinking.","tags":["Work"],"authorSlug":"thomas-edison","length":80,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"qF9iB6wrCQ","author":"Charles Dickens","content":"Subdue your appetites, my dears, and you've conquered human nature.","tags":[],"authorSlug":"charles-dickens","length":67,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"j7W6pP1XiG","author":"Charles Dickens","content":"Train up a fig tree in the way it should go, and when you are old sit under the shade of it.","tags":["Age","Wisdom"],"authorSlug":"charles-dickens","length":92,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"niVz2fQWSH","author":"Thomas Edison","content":"Opportunity is missed by most people because it is dressed in overalls and looks like work.","tags":["Opportunity","Work"],"authorSlug":"thomas-edison","length":91,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"_EC8bhSDQa","author":"Charles Dickens","content":"Minds, like bodies, will often fall into a pimpled, ill-conditioned state from mere excess of comfort.","tags":["Weakness"],"authorSlug":"charles-dickens","length":102,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"jQHjwwHpLN","author":"Thomas Edison","content":"Results! Why, man, I have gotten a lot of results. I know several thousand things that won't work.","tags":["Success","Failure","Perseverance"],"authorSlug":"thomas-edison","length":98,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"_92j6kAvwd","author":"Thomas Edison","content":"I never did a day's work in my life.  It was all fun.","tags":["Humorous"],"authorSlug":"thomas-edison","length":53,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"ijc0sPlYFd","author":"Thomas Edison","content":"The doctor of the future will give no medicine, but will interest her or his patients in the care of the human frame, in a proper diet, and in the cause and prevention of disease.","tags":["Health","Wellness"],"authorSlug":"thomas-edison","length":179,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"BzfxvRlA2Y","author":"Thomas Edison","content":"We don't know a millionth of one percent about anything.","tags":["Knowledge"],"authorSlug":"thomas-edison","length":56,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"KMTJ0Ya3e9","author":"Thomas Edison","content":"To invent, you need a good imagination and a pile of junk.","tags":["Imagination","Creativity","Science","Technology"],"authorSlug":"thomas-edison","length":58,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"RKl9iZrjfP","author":"Charles Dickens","content":"We need never be ashamed of our tears.","tags":["Sadness"],"authorSlug":"charles-dickens","length":38,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"as0ElEk5g7","author":"Charles Dickens","content":"No one is useless in this world who lightens the burdens of another.","tags":["Generosity"],"authorSlug":"charles-dickens","length":68,"dateAdded":"2023-04-14","dateModified":"2023-04-14"},{"_id":"RTYhCs5Ka","author":"Charles Dickens","content":"I do not know the American gentleman, god forgive me for putting two such words together.","tags":["Humorous"],"authorSlug":"charles-dickens","length":89,"dateAdded":"2023-04-14","dateModified":"2023-04-14"}]

QuotesModel quotesModelFromJson(String str) => QuotesModel.fromJson(json.decode(str));
String quotesModelToJson(QuotesModel data) => json.encode(data.toJson());

class QuotesModel {
  QuotesModel({
      num? count, 
      num? totalCount, 
      num? page, 
      num? totalPages, 
      num? lastItemIndex, 
      List<Results>? results,}){
    _count = count;
    _totalCount = totalCount;
    _page = page;
    _totalPages = totalPages;
    _lastItemIndex = lastItemIndex;
    _results = results;
}

  QuotesModel.fromJson(dynamic json) {
    _count = json['count'];
    _totalCount = json['totalCount'];
    _page = json['page'];
    _totalPages = json['totalPages'];
    _lastItemIndex = json['lastItemIndex'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  num? _count;
  num? _totalCount;
  num? _page;
  num? _totalPages;
  num? _lastItemIndex;
  List<Results>? _results;
QuotesModel copyWith({  num? count,
  num? totalCount,
  num? page,
  num? totalPages,
  num? lastItemIndex,
  List<Results>? results,
}) => QuotesModel(  count: count ?? _count,
  totalCount: totalCount ?? _totalCount,
  page: page ?? _page,
  totalPages: totalPages ?? _totalPages,
  lastItemIndex: lastItemIndex ?? _lastItemIndex,
  results: results ?? _results,
);
  num? get count => _count;
  num? get totalCount => _totalCount;
  num? get page => _page;
  num? get totalPages => _totalPages;
  num? get lastItemIndex => _lastItemIndex;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['totalCount'] = _totalCount;
    map['page'] = _page;
    map['totalPages'] = _totalPages;
    map['lastItemIndex'] = _lastItemIndex;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "An5NAXPrbN"
/// author : "Thomas Edison"
/// content : "Hell, there are no rules here-- we're trying to accomplish something."
/// tags : []
/// authorSlug : "thomas-edison"
/// length : 69
/// dateAdded : "2023-04-14"
/// dateModified : "2023-04-14"

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));
String resultsToJson(Results data) => json.encode(data.toJson());
class Results {
  Results({
      String? id, 
      String? author, 
      String? content, 
      List<dynamic>? tags, 
      String? authorSlug, 
      num? length, 
      String? dateAdded, 
      String? dateModified,}){
    _id = id;
    _author = author;
    _content = content;
    _tags = tags;
    _authorSlug = authorSlug;
    _length = length;
    _dateAdded = dateAdded;
    _dateModified = dateModified;
}

  Results.fromJson(dynamic json) {
    _id = json['_id'];
    _author = json['author'];
    _content = json['content'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        //_tags?.add(Dynamic.fromJson(v));
      });
    }
    _authorSlug = json['authorSlug'];
    _length = json['length'];
    _dateAdded = json['dateAdded'];
    _dateModified = json['dateModified'];
  }
  String? _id;
  String? _author;
  String? _content;
  List<dynamic>? _tags;
  String? _authorSlug;
  num? _length;
  String? _dateAdded;
  String? _dateModified;
Results copyWith({  String? id,
  String? author,
  String? content,
  List<dynamic>? tags,
  String? authorSlug,
  num? length,
  String? dateAdded,
  String? dateModified,
}) => Results(  id: id ?? _id,
  author: author ?? _author,
  content: content ?? _content,
  tags: tags ?? _tags,
  authorSlug: authorSlug ?? _authorSlug,
  length: length ?? _length,
  dateAdded: dateAdded ?? _dateAdded,
  dateModified: dateModified ?? _dateModified,
);
  String? get id => _id;
  String? get author => _author;
  String? get content => _content;
  List<dynamic>? get tags => _tags;
  String? get authorSlug => _authorSlug;
  num? get length => _length;
  String? get dateAdded => _dateAdded;
  String? get dateModified => _dateModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['author'] = _author;
    map['content'] = _content;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    map['authorSlug'] = _authorSlug;
    map['length'] = _length;
    map['dateAdded'] = _dateAdded;
    map['dateModified'] = _dateModified;
    return map;
  }

}