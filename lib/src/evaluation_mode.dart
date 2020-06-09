import 'package:meta/meta.dart';

/// Typesafe enum representing the evaluation mode a conditional should operate
/// with.
@immutable
class EvaluationMode {
  const EvaluationMode._(this.code);

  /// A mode that informs the evaluator to operate using an `and` based
  /// mechanism.
  static const and = EvaluationMode._('and');

  /// A mode that informs the evaluator to operate using an `or` based
  /// mechanism.
  static const or = EvaluationMode._('or');

  static final List<EvaluationMode> _all = [
    and,
    or,
  ];

  final String code;

  /// Returns the evaluation mode from the given code.  If the [code] is [null]
  /// then this will return [null].  Otherwise, if the [code] doesn't match a
  /// valid code then this will throw an exception rather than returning.
  static EvaluationMode fromCode(String code) {
    EvaluationMode type;
    if (code != null) {
      code = code.toLowerCase();

      for (var mode in _all) {
        if (mode.code == code) {
          type = mode;
          break;
        }
      }

      if (type == null) {
        throw Exception('Unknown code encountered');
      }
    }
    return type;
  }
}
