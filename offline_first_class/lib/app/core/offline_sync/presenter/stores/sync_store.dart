// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/entities/sync_entity.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/usecases/get_not_synced_usecase.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/usecases/get_syncs_usecase.dart';

class SyncState {
  final List<SyncEntity> syncs;
  final List<SyncEntity> notSynchronized;

  SyncState(this.syncs, this.notSynchronized);

  SyncState copyWith({
    List<SyncEntity>? syncs,
    List<SyncEntity>? notSynchronized,
  }) {
    return SyncState(
      syncs ?? this.syncs,
      notSynchronized ?? this.notSynchronized,
    );
  }
}

class SyncStore extends ValueNotifier<SyncState> {
  final IGetSyncsUsecase _getSyncsUsecase;
  final IGetNotSynchronizedUsecase _getNotSynchronizedUsecase;

  SyncStore(
    this._getSyncsUsecase,
    this._getNotSynchronizedUsecase,
  ) : super(SyncState([], []));

  Future<void> _getSyncs() async {
    final result = await _getSyncsUsecase();

    result.fold(
      (l) => null,
      (r) => value = value.copyWith(syncs: r),
    );
  }

  Future<void> _getNotSynchronized() async {
    final result = await _getNotSynchronizedUsecase();

    result.fold(
      (l) => null,
      (r) => value = value.copyWith(notSynchronized: r),
    );
  }

  Future<void> loadSyncs() async {
    await _getSyncs();
    await _getNotSynchronized();

    await Future.delayed(const Duration(seconds: 3));

    loadSyncs();
  }
}
