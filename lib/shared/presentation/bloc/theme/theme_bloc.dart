import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences _prefs;
  static const String _themeKey = 'isDarkMode';

  ThemeBloc(this._prefs) : super(const ThemeState()) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<SetThemeEvent>(_onSetTheme);

    // Başlangıçta kaydedilmiş tema tercihini yükle
    _loadTheme();
  }

  void _loadTheme() {
    final isDark = _prefs.getBool(_themeKey) ?? false;
    add(SetThemeEvent(isDark));
  }

  Future<void> _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    emit(state.copyWith(themeMode: newThemeMode));

    // Tercihi kaydet
    await _prefs.setBool(_themeKey, newThemeMode == ThemeMode.dark);
  }

  Future<void> _onSetTheme(
    SetThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final themeMode = event.isDark ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: themeMode));
  }
}
