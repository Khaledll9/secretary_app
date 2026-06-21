import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/api/api_provider.dart';
import '../../data/repositories/add_course_repository_impl.dart';
import '../../domain/entities/add_course_entity.dart';
import '../../domain/repositories/add_course_repository.dart';
import '../../domain/usecases/add_course_usecase.dart';

final addCourseRepositoryProvider = Provider<AddCourseRepository>((ref) {
  final api = ref.watch(apiConsumerProvider);
  return AddCourseRepositoryImpl(api: api);
});

final addCourseUseCaseProvider = Provider<AddCourseUseCase>((ref) {
  final repository = ref.watch(addCourseRepositoryProvider);
  return AddCourseUseCase(repository);
});

final addCourseProvider =
    StateNotifierProvider<AddCourseNotifier, AddCourseState>((ref) {
  final addCourseUseCase = ref.watch(addCourseUseCaseProvider);
  return AddCourseNotifier(addCourseUseCase);
});

class AddCourseNotifier extends StateNotifier<AddCourseState> {
  final AddCourseUseCase _addCourseUseCase;

  AddCourseNotifier(this._addCourseUseCase) : super(const AddCourseState());

  void setTitleAr(String value) {
    state = state.copyWith(titleAr: value, validation: null);
  }

  void setNameAr(String value) {
    state = state.copyWith(nameAr: value, validation: null);
  }

  void setDescriptionAr(String value) {
    state = state.copyWith(descriptionAr: value);
  }

  void setPrice(String value) {
    state = state.copyWith(price: value, validation: null);
  }

  void setDuration(String value) {
    state = state.copyWith(duration: value, validation: null);
  }

  void setStartDate(String value) {
    state = state.copyWith(startDate: value, validation: null);
  }

  void setEndDate(String value) {
    state = state.copyWith(endDate: value, validation: null);
  }

  void setDepartmentId(int value) {
    state = state.copyWith(departmentId: value, validation: null);
  }

  Future<void> submit() async {
    final entity = AddCourseEntity(
      titleAr: state.titleAr,
      nameAr: state.nameAr,
      descriptionAr: state.descriptionAr.isEmpty ? null : state.descriptionAr,
      price: double.tryParse(state.price) ?? 0,
      duration: state.duration,
      startDate: state.startDate,
      endDate: state.endDate,
      departmentId: state.departmentId,
    );

    final validation = validateAddCourse(entity);
    if (validation != null) {
      state = state.copyWith(
        authState: const AddCourseIdle(),
        validation: validation,
      );
      return;
    }

    state = state.copyWith(authState: const AddCourseLoading());

    try {
      final result = await _addCourseUseCase(entity);
      state = state.copyWith(authState: AddCourseSuccess(result));
    } catch (error, _) {
      final message = error is Exception
          ? error.toString().replaceFirst('Exception: ', '')
          : 'حدث خطأ أثناء إضافة الكورس';
      state = state.copyWith(
        authState: AddCourseError(message),
      );
    }
  }

  void reset() {
    state = const AddCourseState();
  }
}

sealed class AddCourseStatus {
  const AddCourseStatus();
}

class AddCourseIdle extends AddCourseStatus {
  const AddCourseIdle();
}

class AddCourseLoading extends AddCourseStatus {
  const AddCourseLoading();
}

class AddCourseSuccess extends AddCourseStatus {
  final CreatedCourse course;
  const AddCourseSuccess(this.course);
}

class AddCourseError extends AddCourseStatus {
  final String message;
  const AddCourseError(this.message);
}

class AddCourseState {
  final String titleAr;
  final String nameAr;
  final String descriptionAr;
  final String price;
  final String duration;
  final String startDate;
  final String endDate;
  final int departmentId;
  final AddCourseStatus authState;
  final AddCourseValidation? validation;

  const AddCourseState({
    this.titleAr = '',
    this.nameAr = '',
    this.descriptionAr = '',
    this.price = '',
    this.duration = '',
    this.startDate = '',
    this.endDate = '',
    this.departmentId = 0,
    this.authState = const AddCourseIdle(),
    this.validation,
  });

  AddCourseState copyWith({
    String? titleAr,
    String? nameAr,
    String? descriptionAr,
    String? price,
    String? duration,
    String? startDate,
    String? endDate,
    int? departmentId,
    AddCourseStatus? authState,
    AddCourseValidation? validation,
  }) {
    return AddCourseState(
      titleAr: titleAr ?? this.titleAr,
      nameAr: nameAr ?? this.nameAr,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      departmentId: departmentId ?? this.departmentId,
      authState: authState ?? this.authState,
      validation: validation,
    );
  }
}