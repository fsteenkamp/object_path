class ObjectPath {
  ObjectPath();

  ///
  /// set
  ///
  /// Takes a json object, path and value,
  /// returns the object with that value set
  /// at the path
  ///
  /// @Map<String,dynamic> target
  /// @List<String> path
  /// @dynamic value
  ///
  Map<String, dynamic> setList(
    Map<String, dynamic> target,
    List<String> path,
    dynamic value,
  ) {
    if (!(path is List<String>)) {
      return target;
    }

    if (path.length == 1) {
      _result(target, path[0], value);
      return target;
    }

    var orig = target;
    var len = path.length;

    for (var i = 0; i < len; i++) {
      var prop = path[i];

      if (!(target[prop] is Map<String, dynamic>)) {
        target[prop] = <String, dynamic>{};
      }

      if (i == len - 1) {
        _result(target, prop, value);
        break;
      }

      target = target[prop];
    }

    return orig;
  }

  ///
  /// unset
  ///
  /// Takes a json object and unsets a key
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  ///
  Map<String, dynamic> unsetList(
    Map<String, dynamic> target,
    List<String> path,
  ) {
    if (!(path is List<String>)) {
      return target;
    }

    if (path.length == 1) {
      target.remove(path[0]);
      return target;
    }

    var orig = target;
    var len = path.length;

    for (var i = 0; i < len; i++) {
      var prop = path[i];

      if (!(target.containsKey(prop))) {
        break;
      }

      if (i == len - 1) {
        target.remove(path[i]);
        break;
      }

      target = target[prop];
    }

    return orig;
  }

  ///
  /// get
  ///
  /// Takes a json object and path and returns the value at that path
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  ///
  ///
  dynamic getList(
    Map<String, dynamic> target,
    List<String> path,
    {
      dynamic defaultVal,
    }
  ) {
    if (!(path is List<String>)) {
      return target;
    }

    if (path.length == 1) {
      return target[path[0]];
    }

    var len = path.length;

    for (var i = 0; i < len; i++) {
      var prop = path[i];

      if (!(target.containsKey(prop))) {
        break;
      }

      if (i == len - 1) {
        return target[path[i]];
      }

      target = target[prop];
    }
    return defaultVal;
  }

  ///
  /// setDot
  /// Add a value to the Map key using dot-notation
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  /// @dynamic value
  ///
  Map<String, dynamic> setDot(
    Map<String, dynamic> target,
    String path,
    dynamic value, {
    String splitAt = '.',
    String escapeWith = '\\',
  }) {
    return setList(target, _split(path, splitAt, escapeWith), value);
  }

  ///
  /// unsetDot
  /// Remove a key from the map using dot-notation
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  /// @optional String splitAt
  /// @optional String escapeWith
  ///
  Map<String, dynamic> unsetDot(
    Map<String, dynamic> target,
    String path, {
    String splitAt = '.',
    String escapeWith = '\\',
  }) {
    return unsetList(target, _split(path, splitAt, escapeWith));
  }


  ///
  /// getDot
  /// Get a value at any path using dot-notation
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  /// @optional String splitAt
  /// @optional String escapeWith
  ///
  dynamic getDot(
      Map<String, dynamic> target,
      String path, {
        String splitAt = '.',
        String escapeWith = '\\',
        dynamic defaultVal,
      }) {
    return getList(target, _split(path, splitAt, escapeWith));
  }

  ///
  /// _result
  /// Add a value to the Map key
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  /// @dynamic value
  ///
  void _result(
    Map<String, dynamic> target,
    String path,
    dynamic value,
  ) {
    target[path] = value;
  }

  ///
  /// _split
  /// Split an String with dot-notation
  ///
  /// @Map<String,dynamic> target
  /// @String splitAt
  /// @String escapeWith
  ///

  List<String> _split(String path, String splitAt, String escapeWith) {
    var keys = path.split(splitAt);

    var res = <String>[];
    String prop;

    for (var i = 0; i < keys.length; i++) {
      prop = keys[i];
      var lastChar = prop.length - 1;
      while (prop.substring(lastChar) == escapeWith) {
        prop = prop.substring(0, lastChar) + splitAt + keys[++i];
        lastChar = prop.length - 1;
      }
      res.add(prop);
    }
    return res;
  }
}
