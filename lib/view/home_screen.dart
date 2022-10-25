import 'package:dynamic_txtfield_change_riverpod_sample/view/components/delatable_text_field.dart';
import 'package:dynamic_txtfield_change_riverpod_sample/view/notifier/multi_text_controller_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllers = ref.watch(multiTextControllerProvider);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _add(ref),
        ),
        //本当はここでConsumerにしたほうがよさそうな気がするが、あえてHookConsumerWidgetにしておく
        body: Column(
          children: List.generate(controllers.length, (index) {
            return DeletableTextField(
              index: index,
              //keyはあってもなくてもWorkしそう
              key: UniqueKey(),
              controller: controllers[index],
            );
          }),
        ),
      ),
    );
  }

  _add(WidgetRef ref) {
    final controllerNotifier = ref.read(multiTextControllerProvider.notifier);
    controllerNotifier.add();
  }
}