import '../../../../../core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState<T> with _$ResetPasswordState<T> {
  const factory ResetPasswordState.initial() = ResetPasswordInitial;

  const factory ResetPasswordState.loading() = ResetPasswordLoading;

  const factory ResetPasswordState.success(T data) = ResetPasswordSuccess<T>;

  const factory ResetPasswordState.error({required ApiErrorModel error}) = ResetPasswordError;
}
