import 'package:flutter/material.dart';

import '../../assets/custom_icons.dart';
import '../../theme/custom_theme.dart';
import '../common/custom_icon.dart';
import '../common/outlined_gradient_button.dart';
import 'components/payment_plan_selection_card.dart';

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
        child: Column(
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
                      "\$1,500",
                      style: CustomTheme.textTheme.headlineMedium,
                    ),
                    Text(
                      ".50",
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
                const PaymentPlanSelectionCard(),
              ],
            ),
            OutlinedGradientButton.gradient(
              onPressed: () {},
              title: "Split my rent",
            ),
          ],
        ),
      ),
    );
  }
}
