# object_path

> Create nested values and any intermediaries using list notation `['a','b',c']` OR dot notation `"a.b.c"`.

This is a `Dart` copy of the `js` projects [set-value](https://www.npmjs.com/package/set-value) by [Jon Schlinkert](https://github.com/jonschlinkert) and [object-path](https://www.npmjs.com/package/object-path) by [Mario Casciaro](https://github.com/mariocasciaro).
Please consider following either (or all) projects and giving some stars :star: to show your :heart: and support.
Also, feel free to make pull requests, open issues, or just let me know if I've messed up. The goal is to keep this project functionality in-line with the originals as far as possible. Bear in mind that some functionality is slightly different to accommodate for the typed nature of `Dart`, as well as my personal preference (if you want anything changed...my arm can be twisted).


Lastly, please consider following the project author [Ferdinand Steenkamp](https://github.com/Ferdzzzzzzzz/).

## Install
Install with [pub.dev](https://pub.dev/), add this to your `pubspec.yaml`:

    dependencies:
        object_path:
Then run `flutter pub get`.

## Usage

Import the package:
    
    import 'package:object_path/object_path.dart';

#### Note: I made strong distinctions between `list` and `dot`-notation to prevent confusion.

### Using `dot` notation:
    
    void main() {
        
        var mock = <String, dynamic>{}
        var objPath = ObjectPath();
        
        // set a value in a map
        mock = objPath.setDot(mock, 'a.b.c', 'Value', splitAt = '.', escapeWith = '\\');
        
        // unset value in a map
        mock = objPath.unsetDot(mock, 'a.b.c');
        
        // get value in a map, returns null if it doesn't exists
        print(objPath.getDot(mock, 'a.b.c'));

        // escape split character
        mock = objPath.setDot(mock, 'a.b.c\\.d', 'Value');
    }

Notes:

*Escaping:* You can escape a split character using `\\`, alternatively, you can add your own escape character using the optional `escapeWith` option.

*Dot Notation:* The dot notation obviously uses...dots. Alternatively, you can add your own dot character using the optional `splitAt` option.

### Using `List<String>` method:
    
    void main() {
        
        var mock = <String, dynamic>{}
        var objPath = ObjectPath();
        
        // set a value in a map
        mock = objPath.set(mock, ['a', 'b', 'c'], 'Value');
        
        // unset value in a map
        mock = objPath.unset(mock, ['a', 'b', 'c']);
        
        //get value in a map, returns null if it doesn't exists
        print(objPath.get(mock, ['a','b','c']));
    }



### About

Pull requests and issues always welcome. There is a lot more information on this project at the original [set-value](https://www.npmjs.com/package/set-value). 

### Author

**Ferdinand Steenkamp**

* [Website](https://ferdzz.com)
* [GitHub Profile](https://github.com/Ferdzzzzzzzz)
* [Twitter Profile](https://twitter.com/therealferdz)
* [LinkedIn Profile](https://www.linkedin.com/in/ferdinand-steenkamp-552335181/)



### License

Copyright © 2020, [Ferdinand Steenkamp](https://github.com/Ferdzzzzzzzz).
Released under the [BSD License](LICENSE).



