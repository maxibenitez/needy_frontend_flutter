import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/needy/needy.dart';

class NeedyView extends StatelessWidget {
  const NeedyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NeedyBloc, NeedyState>(
        listener: (context, state) {
          if (state.status == NeedyStatus.error) {
            // Handle Error
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          appBar: NAAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: NAColors.primary,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const NAPictureContainer(
                  //TODO: Put the actual need picture
                  src: "https://picsum.photos/200/300",
                ),
                NAContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: NASpacing.s20,
                    ),
                    Text(
                      "Carpinteria",
                      style: NATextStyle.headline3
                          .copyWith(color: NAColors.primary),
                    ),
                    const SizedBox(
                      height: NASpacing.md,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _TitleWidgetSmallColumn(
                          text: "Necesidad",
                          child: Image.network(
                            // TODO: Put the actual person picture
                            // needies[index].image,
                            "https://picsum.photos/200/300",
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const _TitleWidgetSmallColumn(
                          text: "Skill",
                          child: SquareCircleContainer(
                            icon: Icon(Icons.settings),
                            title: "Carpintero",
                          ),
                        ),
                        _TitleWidgetSmallColumn(
                          text: "Fecha",
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child:
                                Text(DateFormat.yMd().format(DateTime.now())),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: NASpacing.md,
                    ),
                    Text(
                      "Dirección",
                      style: NATextStyle.headline3
                          .copyWith(color: NAColors.primary, fontSize: 20),
                    ),
                    const SizedBox(
                      height: NASpacing.sm,
                    ),
                    Text(
                      "Calle 123 # 123 - 123",
                      style: NATextStyle.headline3
                          .copyWith(color: NAColors.primary, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: NAButton.primary(
                          text: "Aplicar",
                          onPressed: () {
                            //TODO: Apply to the need
                          },
                        ))
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}

class _TitleWidgetSmallColumn extends StatelessWidget {
  const _TitleWidgetSmallColumn({
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: NATextStyle.headline3
              .copyWith(color: NAColors.primary, fontSize: 15),
        ),
        const SizedBox(
          height: NASpacing.sm,
        ),
        child,
      ],
    );
  }
}
