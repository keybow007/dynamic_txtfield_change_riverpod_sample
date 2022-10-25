import 'package:dynamic_txtfield_change_riverpod_sample/view/notifier/multi_text_controller_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeletableTextField extends HookConsumerWidget {
  final int index;
  final TextEditingController controller;

  const DeletableTextField({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (value) => _onTextChanged(ref, index, value),
            ),
          ),
          IconButton(
            onPressed: () => _delete(ref, index),
            icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  _onTextChanged(WidgetRef ref, int index, String value) {
    final controllerNotifier = ref.read<MultiTextControllerNotifier>(
        multiTextControllerProvider.notifier);
    controllerNotifier.update(index, value);
  }

  _delete(WidgetRef ref, int index) {
    final controllerNotifier = ref.read<MultiTextControllerNotifier>(
        multiTextControllerProvider.notifier);
    controllerNotifier.remove(index);
  }
}
