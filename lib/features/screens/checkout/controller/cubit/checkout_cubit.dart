import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/checkout/controller/cubit/checkout_state.dart';
import 'package:qaf_store/features/screens/checkout/data/model/payment_method_model.dart';
import 'package:qaf_store/features/screens/checkout/widgets/selection_btm_sheet.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutState.initial());

  void changePaymentMethod(PaymentMethodModel newMethod) {
    emit(state.copyWith(selectedPaymentMethod: newMethod));
  }

  Future<void> showPaymentMethodSelection(BuildContext context) async {
    final selectedMethod =
        await SelectionBottomSheet.selectedPaymentMethod(context);
    if (selectedMethod != null) {
      changePaymentMethod(selectedMethod);
    }
  }
}
