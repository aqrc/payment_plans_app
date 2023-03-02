import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../extensions/collections_extensions.dart';
import '../../../models/payment_plans_api/get_payment_plans/payment_plan.dart';
import '../../../theme/custom_colors.dart';
import '../../../theme/custom_theme.dart';
import '../../common/outlined_gradient_button.dart';
import 'payment_plan_selection_card_viewmodel.dart';

class PaymentPlanSelectionCardView extends StatelessWidget {
  final List<PaymentPlan> paymentPlans;
  final void Function(String, List<DateTime>) setSelectedPlanCallback;

  const PaymentPlanSelectionCardView({
    Key? key,
    required this.paymentPlans,
    required this.setSelectedPlanCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 178,
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.fromBorderSide(
            BorderSide(color: CustomColors.green, width: 2),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 30,
              color: CustomColors.black10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          child: ViewModelBuilder<PaymentPlanSelectionCardViewModel>.reactive(
            viewModelBuilder: () => PaymentPlanSelectionCardViewModel(
              paymentPlans: paymentPlans,
              setSelectedPlanCallback: setSelectedPlanCallback,
            ),
            builder: (context, viewModel, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(flex: 1),
                    ...viewModel.paymentPlans
                        .mapIndexed((index, paymentPlan) {
                          return [
                            Expanded(
                              flex: 2,
                              child: OutlinedGradientButton.outlined(
                                title: viewModel.getButtonTitle(index),
                                onPressed: () => viewModel.setPage(index),
                                hasGradient: index == viewModel.currentIndex,
                              ),
                            ),
                            const Spacer(flex: 1),
                          ];
                        })
                        .flattened
                        .toList(),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: viewModel.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: viewModel.paymentPlans
                        .map(
                          (paymentPlan) => _PaymentsRow(
                            payments:
                                viewModel.getEditablePayments(paymentPlan.id),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentsRow extends StatelessWidget {
  final List<EditablePayment> payments;

  const _PaymentsRow({Key? key, required this.payments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Timeline(paymentsCount: payments.length),
        Center(
          child: Row(
            children: payments
                .mapIndexed(
                  (index, payment) => Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: payment.initialDate,
                            firstDate: payment.firstDate,
                            lastDate: payment.lastDate,
                          );
                          date?.let((it) => payment.onEdited(it));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              payment.initialDateFormatted,
                              style: CustomTheme.textTheme.titleSmall,
                            ),
                            const _PaymentDateDot(),
                            Text(
                              "\$${payment.amount}",
                              style: CustomTheme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  final int paymentsCount;

  const _Timeline({Key? key, required this.paymentsCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: LayoutBuilder(
      builder: (context, constrains) {
        final indent = constrains.biggest.width / paymentsCount / 2;
        return Divider(
          color: CustomColors.black20,
          height: 1,
          indent: indent,
          endIndent: indent,
        );
      },
    ));
  }
}

class _PaymentDateDot extends StatelessWidget {
  const _PaymentDateDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(color: CustomColors.green),
          gradient: const RadialGradient(
            colors: [
              CustomColors.green,
              CustomColors.white,
            ],
          ),
        ),
      ),
    );
  }
}
