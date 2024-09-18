import '../../../../../core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState<T> with _$ForgetPasswordState<T> {
  const factory ForgetPasswordState.initial() = _Initial;

  const factory ForgetPasswordState.loading() = ForgetPasswordLoading;
  const factory ForgetPasswordState.success(T data) = ForgetPasswordSuccess<T>;
  const factory ForgetPasswordState.error({required ApiErrorModel error}) =
      ForgetPasswordError;
}
