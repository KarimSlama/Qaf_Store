import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qaf_store/features/screens/checkout/data/model/payment_method_model.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required PaymentMethodModel selectedPaymentMethod,
  }) = _CheckoutState;

  factory CheckoutState.initial() => CheckoutState(
        selectedPaymentMethod: PaymentMethodModel.empty(),
      );
}
