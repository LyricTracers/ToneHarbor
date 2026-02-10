import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/providers/theme_data_provider.dart';
import 'package:toneharbor/utils/consts.dart';
part 'base_funs_sp.dart';
part 'base_funs_theme.dart';

T getValueWhenReadyWithWidgetRef<T>(
  WidgetRef ref,
  ProviderListenable<AsyncValue<T>> provider,
  T defaultValue,
) {
  final asyncValue = ref.watch(provider);
  return asyncValue.when(
    data: (value) => value,
    loading: () => defaultValue,
    error: (_, __) => defaultValue,
  );
}

T getValueWhenReadyWithRef<T>(
  Ref ref,
  ProviderListenable<AsyncValue<T>> provider,
  T defaultValue,
) {
  final asyncValue = ref.watch(provider);
  return asyncValue.when(
    data: (value) => value,
    loading: () => defaultValue,
    error: (_, __) => defaultValue,
  );
}
