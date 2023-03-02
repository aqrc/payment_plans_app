import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../assets/custom_icons.dart';
import '../../theme/custom_colors.dart';
import '../../theme/custom_theme.dart';
import '../common/custom_icon.dart';
import '../common/outlined_gradient_button.dart';
import 'components/payment_plan_selection_card_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomIcon(CustomIcons.logo),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () => HomeViewModel(),
          builder: (context, viewModel, child) => viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Your rent",
                          style: CustomTheme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "\$${viewModel.totalPaymentDollars}",
                              style: CustomTheme.textTheme.displaySmall,
                            ),
                            Text(
                              ".${viewModel.totalPaymentCents}",
                              style: CustomTheme.textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Your installments plan",
                          style: CustomTheme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 12),
                        PaymentPlanSelectionCardView(
                          paymentPlans: viewModel.paymentPlans,
                          setSelectedPlanCallback: viewModel.setSelectedPlan,
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 10,
                            color: CustomColors.black20,
                          ),
                        ],
                      ),
                      child: OutlinedGradientButton.gradient(
                        onPressed: () async {
                          final result = await viewModel.submitSelectedPlan();
                          await _showResult(context, result);
                        },
                        title: "Split my rent",
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> _showResult(BuildContext context, String? result) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(result ?? "Success!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).maybePop(),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
