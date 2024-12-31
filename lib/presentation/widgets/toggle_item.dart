import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/toggle_cubit.dart';

class ToggleItem extends StatelessWidget {
  final String textOn;
  final String textOff;
  // Initial state value
  final bool initialValue;
  // Function executed when the state changes
  final Function(bool) onChanged;

  const ToggleItem({
    Key? key,
    required this.textOn,
    required this.textOff,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleCubit, bool>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displays the text based on the current state (on or off)
            Text(state ? textOn : textOff,
                style: const TextStyle(fontSize: 20)),
            Switch(
              value: state, // Sets the switch value based on the state
              onChanged: (value) {
                // Toggles the state when the switch is changed
                context.read<ToggleCubit>().toggle();
                // Calls the onChanged function passed as a parameter
                onChanged(value);
              },
            ),
          ],
        );
      },
    );
  }
}
