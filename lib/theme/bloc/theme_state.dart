part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  ThemeState({required this.themeType, this.appTheme});

  final String themeType;
 final ThemeData? appTheme;
  @override
  List<Object?> get props => [themeType];
  ThemeState copyWith({String? themeType,ThemeData? appTheme}) {
    return ThemeState(
      themeType: themeType ?? this.themeType,
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
