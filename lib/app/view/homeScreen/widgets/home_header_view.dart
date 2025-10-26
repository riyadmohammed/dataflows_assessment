import 'package:dataflows_assessment/app/assets/assets.g.dart';
import 'package:dataflows_assessment/app/assets/constants/constants.dart';
import 'package:dataflows_assessment/app/view/homeScreen/appointment_details_page.dart';
import 'package:dataflows_assessment/app/viewmodel/appointment_view_model.dart';
import 'package:dataflows_assessment/app/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      expandedHeight: 240,
      backgroundColor: GeneralConstant.greenColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCollapsed = constraints.biggest.height < 140;

          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            centerTitle: false,
            title: AnimatedOpacity(
              opacity: isCollapsed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                "🌿 Plantopia",
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      "🌿 Plantopia",
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Hi, Riyadh Welcome back!",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Consumer<AppointmentViewModel>(
                    builder: (context, viewModel, _) {
                      final appointment = viewModel.appointment;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NEXT APPOINTMENT",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey.shade300,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              spacing: 2,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          spacing: 4,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: headerInfoView(
                                                context: context,
                                                icon: Assets.icAlender.path,
                                                text: appointment?.date ?? '',
                                              ),
                                            ),
                                            Expanded(
                                              child: headerInfoView(
                                                context: context,
                                                icon: Assets.icLock.path,
                                                text: appointment?.time ?? '',
                                              ),
                                            ),
                                            Expanded(
                                              child: headerInfoView(
                                                context: context,
                                                icon: Assets.icLocation.path,
                                                text: appointment?.location ?? '',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TouchableOpacity(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AppointmentDetailsPage(
                                          date: appointment?.date ?? '',
                                          time: appointment?.time ?? '',
                                          location: appointment?.location ?? '',
                                          // imagePath: appointment?.imagePath??'',
                                          // credit: appointment?.credit??'',
                                          // points: appointment?.points??'',
                                          // package: appointment.package,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.asset(Assets.icArrow.path, height: 24),
                                ),
                              ],
                            ),

                            const Divider(height: 30, color: Colors.white30),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF66BB6A),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.15),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  creditInfoView(
                                    context: context,
                                    title: "CREDIT",
                                    value: appointment?.credit ?? '',
                                  ),
                                  verticalDivider(),
                                  creditInfoView(
                                    context: context,
                                    title: "POINTS",
                                    value: appointment?.points ?? '',
                                  ),
                                  verticalDivider(),
                                  creditInfoView(
                                    context: context,
                                    title: "PACKAGE",
                                    value: appointment?.package ?? '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget creditInfoView({required BuildContext context, String? title, String? value}) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 3),
        Text(
          value ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget verticalDivider() {
    return Container(width: 1, height: 30, color: Colors.white30);
  }

  Widget headerInfoView({required BuildContext context, String? icon, String? text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(icon ?? '', height: 20, width: 20),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade300, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
