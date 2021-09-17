import 'package:object_path/object_path.dart';
import 'package:test/test.dart';

void main() {
  group('Test List Notation', () {
    test('Test set function', () {
      var objPath = ObjectPath();
      Map<String, dynamic>? testMap = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'}
      };

      testMap =
          objPath.setList(testMap, ['Key 4', 'Key 4.1', 'Key 4.1.1'], 'Value 4');
      testMap = objPath.setList(testMap, ['Key 5'], [1, 2]);

      var assertTest = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'},
        'Key 4': {
          'Key 4.1': {
            'Key 4.1.1': 'Value 4',
          }
        },
        'Key 5': [1, 2]
      };

      expect(testMap, equals(assertTest));
    });

    test('Test unset function', () {
      var objPath = ObjectPath();
      Map<String, dynamic>? testMap = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'},
        'Key 5': {
          'Key 5.1': {
            'Key 5.1.2': [1, 2]
          },
          'Key 5.2': {
            'Key 5.2.1': 'Val 5.2.1',
            'Key 5.2.2': 'Val 5.2.2',
          }
        }
      };

      testMap = objPath.unsetList(testMap, ['Key 5', 'Key 5.2', 'Key 5.2.2']);
      testMap = objPath.unsetList(testMap, ['Key 1']);

      var assertTest = <String, dynamic>{
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'},
        'Key 5': {
          'Key 5.1': {
            'Key 5.1.2': [1, 2]
          },
          'Key 5.2': {
            'Key 5.2.1': 'Val 5.2.1',
          }
        }
      };

      expect(testMap, equals(assertTest));
    });
  });

  group('Test Dot Notation', () {
    test('Test setDot function', () {
      var objPath = ObjectPath();
      Map<String, dynamic>? testMap = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'}
      };

      testMap =
          objPath.setDot(testMap, 'Key 4.Key 4\\.1.Key 4\\.1\\.1', 'Value 4');
      testMap = objPath.setDot(testMap, 'Key 5', [1, 2]);

      var assertTest = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'},
        'Key 4': {
          'Key 4.1': {
            'Key 4.1.1': 'Value 4',
          }
        },
        'Key 5': [1, 2]
      };

      expect(testMap, equals(assertTest));
    });

    test('Test unsetDot function', () {
      var objPath = ObjectPath();
      Map<String, dynamic>? testMap = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'},
        'Key 5': {
          'Key 5.1': {
            'Key 5.1.2': [1, 2]
          },
          'Key 5.2': {
            'Key 5.2.1': 'Val 5.2.1',
            'Key 5.2.2': 'Val 5.2.2',
          }
        }
      };

      testMap = objPath.unsetDot(testMap, 'Key 5.Key 5\\.2.Key 5\\.2\\.2');
      testMap = objPath.unsetDot(testMap, 'Key 1');

      var assertTest = <String, dynamic>{
        'Key 2': 'Val 2',
        'Key 3': {'Key 3.1': 'Val 3'},
        'Key 5': {
          'Key 5.1': {
            'Key 5.1.2': [1, 2]
          },
          'Key 5.2': {
            'Key 5.2.1': 'Val 5.2.1',
          }
        }
      };

      expect(testMap, equals(assertTest));
    });
  });
}
