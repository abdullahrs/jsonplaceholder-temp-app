enum RestAPI {
  base,
  albums,
  photos,
  comments
}

extension RestAPIExtension on RestAPI{
  String get url => 'jsonplaceholder.typicode.com';
}
