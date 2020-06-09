import 'package:flutter_test/flutter_test.dart';
import 'package:json_conditional/json_conditional.dart';

void main() {
  test('and - coonditions', () {
    var conditional = Conditional(
      conditions: [
        Conditional(values: {'bool': true}),
        Conditional(values: {'num': 42}),
        Conditional(values: {'string': String}),
      ],
      mode: EvaluationMode.and,
    );

    expect(
      conditional.evaluate({
        'bool': true,
        'num': 42,
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'bool': false,
        'num': 42,
        'string': 'String',
      }),
      false,
    );

    expect(
      conditional.evaluate({}),
      false,
    );

    expect(
      conditional.evaluate(null),
      false,
    );
  });

  test('and - values', () {
    var conditional = Conditional(
      mode: EvaluationMode.and,
      values: {
        'bool': true,
        'num': 42,
        'string': 'String',
      },
    );

    expect(
      conditional.evaluate({
        'bool': true,
        'num': 42,
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'bool': false,
        'num': 42,
        'string': 'String',
      }),
      false,
    );

    expect(
      conditional.evaluate({}),
      false,
    );

    expect(
      conditional.evaluate(null),
      false,
    );
  });

  test('constructors - invalid', () {
    try {
      Conditional();

      fail('Exception should have been thrown');
    } catch (e) {
      // pass
    }

    try {
      Conditional(
        conditions: [
          Conditional(values: {'foo': 'bar'}),
        ],
        values: {'foo': 'bar'},
      );

      fail('Exception should have been thrown');
    } catch (e) {
      // pass
    }

    try {
      Conditional(
        mode: null,
        values: {'foo': 'bar'},
      );

      fail('Exception should have been thrown');
    } catch (e) {
      // pass
    }
  });

  test('constructors - valid', () {
    Conditional(conditions: [
      Conditional(values: {'foo': 'bar'})
    ]);
    Conditional(
      conditions: [
        Conditional(values: {'foo': 'bar'})
      ],
      mode: EvaluationMode.or,
    );

    Conditional(values: {'foo': 'bar'});
    Conditional(
      mode: EvaluationMode.or,
      values: {'foo': 'bar'},
    );

    expect(Conditional(values: {'foo': 'bar'}).mode, EvaluationMode.and);
  });

  test('or - conditions', () {
    var conditional = Conditional(
      conditions: [
        Conditional(values: {'bool': true}),
        Conditional(values: {'num': 42}),
        Conditional(values: {'string': 'String'}),
      ],
      mode: EvaluationMode.or,
    );

    expect(
      conditional.evaluate({
        'bool': true,
        'num': 42,
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'bool': false,
        'num': 42,
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'num': 4,
      }),
      false,
    );

    expect(
      conditional.evaluate({}),
      false,
    );

    expect(
      conditional.evaluate(null),
      false,
    );
  });

  test('or - values', () {
    var conditional = Conditional(
      mode: EvaluationMode.or,
      values: {
        'bool': true,
        'num': 42,
        'string': 'String',
      },
    );

    expect(
      conditional.evaluate({
        'bool': true,
        'num': 42,
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'bool': false,
        'num': 42,
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'string': 'String',
      }),
      true,
    );

    expect(
      conditional.evaluate({
        'num': 4,
      }),
      false,
    );

    expect(
      conditional.evaluate({}),
      false,
    );

    expect(
      conditional.evaluate(null),
      false,
    );
  });
}
