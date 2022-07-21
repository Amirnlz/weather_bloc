extension ParseString on String {
  Uri get parseUri => Uri.parse(this);
}
