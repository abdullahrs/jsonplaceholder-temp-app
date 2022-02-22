class User {
  final String name;
  final String imageUrl;
  final String country;
  final String mail;
  final String phoneNumber;
  final String githubUrl;
  final String linkedinUrl;
  final String instagramUrl;
  final int numberOfAlbums;
  final int numberOfEvaluations;

  const User(
    this.name,
    this.country,
    this.mail,
    this.phoneNumber,
    this.githubUrl,
    this.linkedinUrl,
    this.instagramUrl,
    this.numberOfAlbums,
    this.numberOfEvaluations,
    this.imageUrl,
  );
}
