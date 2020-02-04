import 'package:object_path/object_path.dart';
import 'package:pretty_json/pretty_json.dart';

void main() {
  //List Example
  var mock = <String, dynamic>{
    'Key 1': 'Val 1',
    'Key 2': 'Val 2',
    'Key 3': {'Key 3.1': 'Val 3'}
  };

  var objPath = ObjectPath();

  /*
  * Below we set three different keys on the map,
  * two of which are nested.
  * */

  mock = objPath.setList(mock, ['Key 4'], 'Val 4');
  mock = objPath.setList(mock, ['Key 5', 'Key 5.1'], 'Val 5.1');

  /*
  * Below we remove Key 2 and it's value from the map
  * */

  mock = objPath.unsetList(mock, ['Key 2']);

  /*
  * Here we expect an output of:
  * {
  *   'Key 1': 'Val 1',
  *   'Key 3': {
  *     'Key 3.1': 'Val 3'
  *   }
  *   'Key 4': 'Val 4',
  *   'Key 5':  {
  *     'Key 5.1': 'Val 5.1',
  *   }
  * }
  * */

  print(prettyJson(mock));

  //Dot Notation Example
  //reset the Map
  mock = <String, dynamic>{
    'Key 1': 'Val 1',
    'Key 2': 'Val 2',
    'Key 3': {'Key 3.1': 'Val 3'}
  };

  objPath = ObjectPath();

  /*
  * Below we set three different keys on the map,
  * two of which are nested.
  * */

  mock = objPath.setDot(mock, 'Key 4', 'Val 4');

  //Remember to escape unwanted splits using \\
  //Alternatively, you can specify your own split character using the
  //option 'splitAt' param
  mock = objPath.setDot(mock, 'Key 5.Key 5\\.1', 'Val 5.1');

  /*
  * Below we remove Key 2 and it's value from the map
  * */

  mock = objPath.unsetDot(mock, 'Key 2');

  /*
  * Here we expect an output of:
  * {
  *   'Key 1': 'Val 1',
  *   'Key 3': {
  *     'Key 3.1': 'Val 3'
  *   }
  *   'Key 4': 'Val 4',
  *   'Key 5':  {
  *     'Key 5.1': 'Val 5.1',
  *   }
  * }
  * */

  print(prettyJson(mock));

  print(objPath.getList(mock, ['Key 5','Key 5.1']));
  print(objPath.getDot(mock, 'Key 5.Key 5\\.1'));
}
