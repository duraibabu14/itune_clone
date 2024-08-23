// Mocks generated by Mockito 5.4.4 from annotations
// in ituneclone/test/screens/landing/landing_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:flutter/material.dart' as _i2;
import 'package:ituneclone/screens/landing/landing_screen_viewmodel.dart'
    as _i3;
import 'package:ituneclone/utils/enum.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTextEditingController_0 extends _i1.SmartFake
    implements _i2.TextEditingController {
  _FakeTextEditingController_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LandingScreenViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockLandingScreenViewModel extends _i1.Mock
    implements _i3.LandingScreenViewModel {
  @override
  List<_i4.MediaTypes> get mediaTypes => (super.noSuchMethod(
        Invocation.getter(#mediaTypes),
        returnValue: <_i4.MediaTypes>[],
        returnValueForMissingStub: <_i4.MediaTypes>[],
      ) as List<_i4.MediaTypes>);

  @override
  set mediaTypes(List<_i4.MediaTypes>? _mediaTypes) => super.noSuchMethod(
        Invocation.setter(
          #mediaTypes,
          _mediaTypes,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.TextEditingController get searchController => (super.noSuchMethod(
        Invocation.getter(#searchController),
        returnValue: _FakeTextEditingController_0(
          this,
          Invocation.getter(#searchController),
        ),
        returnValueForMissingStub: _FakeTextEditingController_0(
          this,
          Invocation.getter(#searchController),
        ),
      ) as _i2.TextEditingController);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void addAllMediaTypes(List<_i4.MediaTypes>? types) => super.noSuchMethod(
        Invocation.method(
          #addAllMediaTypes,
          [types],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool isSearchTextValidated() => (super.noSuchMethod(
        Invocation.method(
          #isSearchTextValidated,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.Future<bool> isBreaked() => (super.noSuchMethod(
        Invocation.method(
          #isBreaked,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
