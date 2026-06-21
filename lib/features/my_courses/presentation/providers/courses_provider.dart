import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/fake_course_repository_impl.dart';
import '../../domain/entities/course.dart';
import '../../domain/repositories/course_repository.dart';
import '../../domain/usecases/get_courses.dart';

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  return FakeCourseRepositoryImpl();
});

final getCoursesUseCaseProvider = Provider<GetCourses>((ref) {
  final repository = ref.watch(courseRepositoryProvider);
  return GetCourses(repository);
});

final coursesProvider =
    StateNotifierProvider<CoursesNotifier, CoursesState>((ref) {
      final getCourses = ref.watch(getCoursesUseCaseProvider);
      return CoursesNotifier(getCourses);
    });

enum CourseFilter { all, courses, diplomas }

enum CourseCategory { all, programming, design, development, entrepreneurship, skills }

class CoursesNotifier extends StateNotifier<CoursesState> {
  final GetCourses _getCourses;

  CoursesNotifier(this._getCourses) : super(const CoursesState()) {
    loadCourses();
  }

  Future<void> loadCourses() async {
    state = state.copyWith(
      courses: const AsyncValue.loading(),
      filteredCourses: const [],
    );

    try {
      final courses = await _getCourses();
      final filtered = _applyFilters(courses);
      state = state.copyWith(
        courses: AsyncValue.data(courses),
        filteredCourses: filtered,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        courses: AsyncValue.error(error, stackTrace),
        filteredCourses: const [],
      );
    }
  }

  void selectFilter(CourseFilter filter) {
    final allCourses = state.courses.asData?.value ?? [];
    state = state.copyWith(
      selectedFilter: filter,
      filteredCourses: _applyFilters(allCourses, newFilter: filter),
    );
  }

  void selectCategory(CourseCategory category) {
    final allCourses = state.courses.asData?.value ?? [];
    state = state.copyWith(
      selectedCategory: category,
      filteredCourses: _applyFilters(allCourses, newCategory: category),
    );
  }

  void toggleLike(int courseId) {
    final currentCourses = state.courses.asData?.value ?? [];
    final updated = currentCourses.map((course) {
      if (course.id == courseId) {
        return Course(
          id: course.id,
          title: course.title,
          description: course.description,
          category: course.category,
          tag: course.tag,
          price: course.price,
          duration: course.duration,
          startDate: course.startDate,
          endDate: course.endDate,
          photoUrl: course.photoUrl,
          sessionsCount: course.sessionsCount,
          durationHours: course.durationHours,
          isActive: course.isActive,
          isAvailable: course.isAvailable,
          isLiked: !(course.isLiked ?? false),
          departmentName: course.departmentName,
          instituteName: course.instituteName,
        );
      }
      return course;
    }).toList();
    final filtered = _applyFilters(updated);
    state = state.copyWith(
      courses: AsyncValue.data(updated),
      filteredCourses: filtered,
    );
  }

  List<Course> _applyFilters(
    List<Course> courses, {
    CourseFilter? newFilter,
    CourseCategory? newCategory,
  }) {
    final filter = newFilter ?? state.selectedFilter;
    final category = newCategory ?? state.selectedCategory;
    var filtered = courses;

    if (filter == CourseFilter.courses) {
      filtered = filtered.where((c) => c.category == 'دورة').toList();
    } else if (filter == CourseFilter.diplomas) {
      filtered = filtered.where((c) => c.category == 'دبلوم').toList();
    }

    if (category != CourseCategory.all) {
      final tagMap = {
        CourseCategory.programming: ['برمجة', 'تقنية معلومات'],
        CourseCategory.design: ['تصميم', 'تصميم جرافيك'],
        CourseCategory.development: ['تطوير', 'تطوير ويب'],
        CourseCategory.entrepreneurship: ['ريادة أعمال', 'إدارة أعمال'],
        CourseCategory.skills: ['مهارات', 'لغات', 'تسويق'],
      };
      final allowedTags = tagMap[category] ?? [];
      filtered = filtered.where((c) => allowedTags.contains(c.tag)).toList();
    }

    return filtered;
  }
}

class CoursesState {
  final CourseFilter selectedFilter;
  final CourseCategory selectedCategory;
  final AsyncValue<List<Course>> courses;
  final List<Course> filteredCourses;

  const CoursesState({
    this.selectedFilter = CourseFilter.all,
    this.selectedCategory = CourseCategory.all,
    this.courses = const AsyncValue.loading(),
    this.filteredCourses = const [],
  });

  CoursesState copyWith({
    CourseFilter? selectedFilter,
    CourseCategory? selectedCategory,
    AsyncValue<List<Course>>? courses,
    List<Course>? filteredCourses,
  }) {
    return CoursesState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      courses: courses ?? this.courses,
      filteredCourses: filteredCourses ?? this.filteredCourses,
    );
  }
}
