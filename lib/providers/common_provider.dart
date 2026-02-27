import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
part 'common_provider.g.dart';

@keepAlive
class RequestFlag extends _$RequestFlag {
  @override
  bool build() => false;

  void setRequestFlag(bool value) {
    state = value;
  }
}
