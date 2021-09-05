class BagPolicy {
  static Rule parseRule(String policy) {
    final line_regex = RegExp(
        r'^(?<container_col>\w+ \w+) bags contain (?:(?<some>(?:\d+ \w+ \w+ bags?,?\s?)+)|(?<none>no other bags)).$');
    final match = line_regex.firstMatch(policy);
    // Every Rule has a subject (bag of a certain color) and rule objects (number of bags
    // of a certain color that can be contained)
    final ruleSubject = match?.namedGroup('container_col') ?? "";
    final ruleObjects =
        match?.namedGroup('some') ?? match?.namedGroup('none') ?? "";

    if (ruleObjects == 'no other bags') {
      return new Rule(ruleSubject, []);
    } else {
      final bagCounts = parseBags(ruleObjects);
      return new Rule(ruleSubject, bagCounts);
    }
  }

  static List<RuleObject> parseBags(String ruleObjects) {
    final object_regex = RegExp(r'(?<number>\d+) (?<color>\w+ \w+)');
    final matches = object_regex.allMatches(ruleObjects);
    final bagCounts = matches
        .map((m) => new RuleObject(
            m.namedGroup('color') ?? "", m.namedGroup('number') ?? ""))
        .toList();
    return bagCounts;
  }
}

typedef Rules = Map<RuleSubject, List<RuleObject>>;

class Rule {
  RuleSubject subject;
  List<RuleObject> objects;

  Rule(this.subject, this.objects);
}

typedef RuleSubject = String;

class RuleObject {
  String color;
  int amount;

  RuleObject(String color_, String amount_)
      : amount = int.parse(amount_),
        color = color_;
}
