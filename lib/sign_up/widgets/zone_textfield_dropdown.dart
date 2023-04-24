import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:needy_frontend/sign_up/sign_up.dart';

class ZoneTextFieldDropDown extends StatelessWidget {
  ZoneTextFieldDropDown({super.key});

  final List<String> _zoneOptions = [
    'Artigas',
    'Salto',
    'Paysandú',
    'Río Negro',
    'Soriano',
    'Colonia',
    'San José',
    'Canelones',
    'Montevideo',
    'Maldonado',
    'Rocha',
    'Durazno',
    'Flores',
    'Florida',
    'Rivera',
    'Tacuarembó',
    'Trenta y Tres',
    'Cerro Largo',
    'Lavalleja',
  ];

  @override
  Widget build(BuildContext context) {
    final selectedZone = context.select((SignUpBloc bloc) => bloc.state.zone);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Departamento", style: NATextStyle.bodyText1),
        DropdownButton(
          hint: const Text('Selecciona un departamento'),
          value: selectedZone,
          underline: Container(
            height: 1,
            color: NAColors.grey,
          ),
          onChanged: (zone) {
            context.read<SignUpBloc>().add(SignUpZoneChanged(zone: zone!));
          },
          items: _zoneOptions.map((zone) {
            return DropdownMenuItem(
              value: zone,
              child: Text(zone),
            );
          }).toList(),
        ),
      ],
    );
  }
}
