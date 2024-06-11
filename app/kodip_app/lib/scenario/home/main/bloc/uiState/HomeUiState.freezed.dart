// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HomeUiState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeUiState {
  User? get userInfo => throw _privateConstructorUsedError;
  List<Wallet> get wallets => throw _privateConstructorUsedError;
  List<TransactionSummary> get transactionSummaryList =>
      throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  HomeState get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeUiStateCopyWith<HomeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUiStateCopyWith<$Res> {
  factory $HomeUiStateCopyWith(
          HomeUiState value, $Res Function(HomeUiState) then) =
      _$HomeUiStateCopyWithImpl<$Res, HomeUiState>;
  @useResult
  $Res call(
      {User? userInfo,
      List<Wallet> wallets,
      List<TransactionSummary> transactionSummaryList,
      int currentPage,
      bool hasNext,
      HomeState state});
}

/// @nodoc
class _$HomeUiStateCopyWithImpl<$Res, $Val extends HomeUiState>
    implements $HomeUiStateCopyWith<$Res> {
  _$HomeUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = freezed,
    Object? wallets = null,
    Object? transactionSummaryList = null,
    Object? currentPage = null,
    Object? hasNext = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User?,
      wallets: null == wallets
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      transactionSummaryList: null == transactionSummaryList
          ? _value.transactionSummaryList
          : transactionSummaryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionSummary>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HomeState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeUiStateImplCopyWith<$Res>
    implements $HomeUiStateCopyWith<$Res> {
  factory _$$HomeUiStateImplCopyWith(
          _$HomeUiStateImpl value, $Res Function(_$HomeUiStateImpl) then) =
      __$$HomeUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? userInfo,
      List<Wallet> wallets,
      List<TransactionSummary> transactionSummaryList,
      int currentPage,
      bool hasNext,
      HomeState state});
}

/// @nodoc
class __$$HomeUiStateImplCopyWithImpl<$Res>
    extends _$HomeUiStateCopyWithImpl<$Res, _$HomeUiStateImpl>
    implements _$$HomeUiStateImplCopyWith<$Res> {
  __$$HomeUiStateImplCopyWithImpl(
      _$HomeUiStateImpl _value, $Res Function(_$HomeUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = freezed,
    Object? wallets = null,
    Object? transactionSummaryList = null,
    Object? currentPage = null,
    Object? hasNext = null,
    Object? state = null,
  }) {
    return _then(_$HomeUiStateImpl(
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User?,
      wallets: null == wallets
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      transactionSummaryList: null == transactionSummaryList
          ? _value._transactionSummaryList
          : transactionSummaryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionSummary>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HomeState,
    ));
  }
}

/// @nodoc

class _$HomeUiStateImpl implements _HomeUiState {
  const _$HomeUiStateImpl(
      {required this.userInfo,
      required final List<Wallet> wallets,
      required final List<TransactionSummary> transactionSummaryList,
      required this.currentPage,
      required this.hasNext,
      required this.state})
      : _wallets = wallets,
        _transactionSummaryList = transactionSummaryList;

  @override
  final User? userInfo;
  final List<Wallet> _wallets;
  @override
  List<Wallet> get wallets {
    if (_wallets is EqualUnmodifiableListView) return _wallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  final List<TransactionSummary> _transactionSummaryList;
  @override
  List<TransactionSummary> get transactionSummaryList {
    if (_transactionSummaryList is EqualUnmodifiableListView)
      return _transactionSummaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionSummaryList);
  }

  @override
  final int currentPage;
  @override
  final bool hasNext;
  @override
  final HomeState state;

  @override
  String toString() {
    return 'HomeUiState(userInfo: $userInfo, wallets: $wallets, transactionSummaryList: $transactionSummaryList, currentPage: $currentPage, hasNext: $hasNext, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeUiStateImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            const DeepCollectionEquality().equals(other._wallets, _wallets) &&
            const DeepCollectionEquality().equals(
                other._transactionSummaryList, _transactionSummaryList) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userInfo,
      const DeepCollectionEquality().hash(_wallets),
      const DeepCollectionEquality().hash(_transactionSummaryList),
      currentPage,
      hasNext,
      state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeUiStateImplCopyWith<_$HomeUiStateImpl> get copyWith =>
      __$$HomeUiStateImplCopyWithImpl<_$HomeUiStateImpl>(this, _$identity);
}

abstract class _HomeUiState implements HomeUiState {
  const factory _HomeUiState(
      {required final User? userInfo,
      required final List<Wallet> wallets,
      required final List<TransactionSummary> transactionSummaryList,
      required final int currentPage,
      required final bool hasNext,
      required final HomeState state}) = _$HomeUiStateImpl;

  @override
  User? get userInfo;
  @override
  List<Wallet> get wallets;
  @override
  List<TransactionSummary> get transactionSummaryList;
  @override
  int get currentPage;
  @override
  bool get hasNext;
  @override
  HomeState get state;
  @override
  @JsonKey(ignore: true)
  _$$HomeUiStateImplCopyWith<_$HomeUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
