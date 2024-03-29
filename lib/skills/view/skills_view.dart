import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/main_options/view/main_options_page.dart';
import 'package:needy_frontend/skills/skills.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final skills = context.select((SkillsBloc bloc) => bloc.state.skills);

    return BlocListener<SkillsBloc, SkillsState>(
      listener: (context, state) {
        if (state.status == SkillsStatus.alreadyOneSkillSelected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No se puede seleccionar mas de un servicio"),
              duration: Duration(seconds: 2),
            ),
          );
        }
        if (state.status == SkillsStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Ocurrio un error"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: NAColors.white,
        appBar: const NAAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(NASpacing.xlg),
          child: Column(children: [
            Text(
              "Indique su servicio",
              style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: 20,
                  color: NAColors.primary,
                  fontWeight: NAFontWeight.bold),
            ),
            const SizedBox(height: NASpacing.xxxlg),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: NASpacing.xs,
              runSpacing: 10,
              children: skills
                  .map(
                    (skill) => ActionChip(
                      backgroundColor: skill.selected
                          ? NAColors.primary
                          : NAColors.lightGrey,
                      onPressed: () {
                        context
                            .read<SkillsBloc>()
                            .add(SkillSelected(skill: skill));
                      },
                      label: Text(
                        skill.name,
                      ),
                      labelPadding: const EdgeInsets.all(NASpacing.xxxs * 3),
                      labelStyle: theme.textTheme.labelLarge?.copyWith(
                          color:
                              skill.selected ? NAColors.white : NAColors.black),
                      side: BorderSide(color: theme.colorScheme.onBackground),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            NAButton.primary(
                text: "Continuar",
                onPressed: () {
                  Navigator.of(context).push(MainOptionsPage.route());
                }),
          ]),
        ),
      ),
    );
  }
}
