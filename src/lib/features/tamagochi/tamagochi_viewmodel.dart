import 'package:flutter/material.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/services/tamagochi_service.dart';
import 'package:stacked/stacked.dart';

class TamagochiViewModel extends BaseViewModel {
  final _tamagochiService = locator<TamagochiService>();
  final nameController = TextEditingController();

  bool get hasTamagochi => _tamagochiService.currentTamagochi != null;
  String get tamagochiName => _tamagochiService.currentTamagochi?.name ?? '';
  int get happiness => _tamagochiService.currentTamagochi?.happiness ?? 0;
  int get hunger => _tamagochiService.currentTamagochi?.hunger ?? 0;
  int get energy => _tamagochiService.currentTamagochi?.energy ?? 0;

  TamagochiViewModel() {
    _tamagochiService.addListener(() => notifyListeners());
  }

  void createTamagochi() {
    try {
      _tamagochiService.createTamagochi(nameController.text.trim());
      nameController.clear();
      clearErrors();
    } catch (e) {
      setError(e.toString());
    }
  }

  void feed() {
    try {
      _tamagochiService.feed();
      clearErrors();
    } catch (e) {
      setError(e.toString());
    }
  }

  void play() {
    try {
      _tamagochiService.play();
      clearErrors();
    } catch (e) {
      setError(e.toString());
    }
  }

  void sleep() {
    try {
      _tamagochiService.sleep();
      clearErrors();
    } catch (e) {
      setError(e.toString());
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
