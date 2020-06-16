import 'package:json_conditional/json_conditional.dart';
import 'package:test/test.dart';

void main() {
  test('from code', () {
    expect(EvaluationMode.fromCode('and'), EvaluationMode.and);
    expect(EvaluationMode.fromCode('AND'), EvaluationMode.and);
    expect(EvaluationMode.fromCode('or'), EvaluationMode.or);
    expect(EvaluationMode.fromCode('OR'), EvaluationMode.or);

    try {
      EvaluationMode.fromCode('fail');

      fail('An exception should have been thrown');
    } catch (e) {
      // pass
    }
  });
}
