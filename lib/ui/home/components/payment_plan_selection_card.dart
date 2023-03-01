import 'package:flutter/material.dart';
import '../../../theme/custom_colors.dart';
import '../../../theme/custom_theme.dart';
import '../../common/outlined_gradient_button.dart';

class PaymentPlanSelectionCard extends StatelessWidget {
  const PaymentPlanSelectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.fromBorderSide(
          BorderSide(color: CustomColors.green, width: 2),
        ),
      ),
      child: SizedBox(
        height: 178,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: OutlinedGradientButton.outlined(
                      title: "2",
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: OutlinedGradientButton.outlined(
                      title: "3",
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: OutlinedGradientButton.both(
                      title: "4",
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    const _Timeline(eventsCount: 4),
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "05/01",
                                  style: CustomTheme.textTheme.titleSmall,
                                ),
                                const _PaymentDateDot(),
                                Text(
                                  "\$3955.50",
                                  style: CustomTheme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "05/01",
                                  style: CustomTheme.textTheme.titleSmall,
                                ),
                                const _PaymentDateDot(),
                                Text(
                                  "\$3955.50",
                                  style: CustomTheme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "05/01",
                                  style: CustomTheme.textTheme.titleSmall,
                                ),
                                const _PaymentDateDot(),
                                Text(
                                  "\$3955.50",
                                  style: CustomTheme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "05/01",
                                  style: CustomTheme.textTheme.titleSmall,
                                ),
                                const _PaymentDateDot(),
                                Text(
                                  "\$3955.50",
                                  style: CustomTheme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  final int eventsCount;

  const _Timeline({Key? key, required this.eventsCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: LayoutBuilder(
      builder: (context, constrains) {
        final indent = constrains.biggest.width / eventsCount / 2;
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
    return Container(
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
    );
  }
}
