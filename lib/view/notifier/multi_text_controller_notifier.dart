import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MultiTextControllerNotifier
    extends StateNotifier<List<TextEditingController>> {
  MultiTextControllerNotifier() : super([]);

  void add() {
    state = [...state, TextEditingController()];
  }

  void remove(int index) {
    state.removeAt(index);
    //https://www.technicalfeeder.com/2021/10/flutter-dynamic-textfield-creation-with-riverpod/
    state = [...state];
  }

  void update(int index, String value) {
    state[index].text = value;
    state = [...state];
  }
}

final multiTextControllerProvider = StateNotifierProvider<
    MultiTextControllerNotifier,
    List<TextEditingController>>((ref) => MultiTextControllerNotifier());
