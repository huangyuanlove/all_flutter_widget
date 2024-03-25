// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dio_generatorHash() => r'd475ea0cfc80c465420d2c53a508da50a7dd7dc3';

/// See also [dio_generator].
@ProviderFor(dio_generator)
final dio_generatorProvider = AutoDisposeProvider<Dio>.internal(
  dio_generator,
  name: r'dio_generatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dio_generatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef Dio_generatorRef = AutoDisposeProviderRef<Dio>;
String _$counterHash() => r'6b26baf29ab7c65258c6367ad62133458d88a2b3';

/// See also [counter].
@ProviderFor(counter)
final counterProvider = Provider<int>.internal(
  counter,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CounterRef = ProviderRef<int>;
String _$generateNameHash() => r'3968da59b2f3d04dc47c4ee4ccae7cb0117ba786';

/// See also [generateName].
@ProviderFor(generateName)
final generateNameProvider = AutoDisposeFutureProvider<String>.internal(
  generateName,
  name: r'generateNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$generateNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GenerateNameRef = AutoDisposeFutureProviderRef<String>;
String _$timeCountHash() => r'df6d17c726d73d071ac1f373f717cbeb06c2517c';

/// See also [timeCount].
@ProviderFor(timeCount)
final timeCountProvider = AutoDisposeStreamProvider<int>.internal(
  timeCount,
  name: r'timeCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$timeCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TimeCountRef = AutoDisposeStreamProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
