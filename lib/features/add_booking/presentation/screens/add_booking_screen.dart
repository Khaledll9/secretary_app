import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/add_booking_provider.dart';
import '../widgets/attendance_toggle.dart';
import '../widgets/auto_filled_section.dart';
import '../widgets/bottom_action_bar.dart';
import '../widgets/course_selection_field.dart';
import '../widgets/description_field.dart';
import '../widgets/image_upload_field.dart';
import '../widgets/manual_input_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/toggle_card.dart';

class AddBookingScreen extends ConsumerStatefulWidget {
  const AddBookingScreen({super.key});

  @override
  ConsumerState<AddBookingScreen> createState() => _AddBookingScreenState();
}

class _AddBookingScreenState extends ConsumerState<AddBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _courseNameController = TextEditingController();
  final _departmentController = TextEditingController();
  final _originalPriceController = TextEditingController();
  final _instructorNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();
  final _maxSeatsController = TextEditingController();
  final _discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addBookingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إضافة إعلان جديد',
          style: AppTextStyles.bold20
            ..copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: _buildBody(context, state, ref),
    );
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _departmentController.dispose();
    _originalPriceController.dispose();
    _instructorNameController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    _maxSeatsController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  Widget _buildBody(
    BuildContext outerContext,
    AddBookingState state,
    WidgetRef ref,
  ) {
    switch (state.status) {
      case AddBookingStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case AddBookingStatus.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage ?? 'حدث خطأ',
                  style: AppTextStyles.medium16.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(addBookingProvider.notifier).reset(),
                  child: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          ),
        );
      case AddBookingStatus.success:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 64,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              const SizedBox(height: 16.0),
              Text('تم إضافة الإعلان بنجاح', style: AppTextStyles.bold20),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () => ref.read(addBookingProvider.notifier).reset(),
                child: const Text('إضافة إعلان آخر'),
              ),
            ],
          ),
        );
      case AddBookingStatus.idle:
        return _buildForm(outerContext, state, ref);
    }
  }

  Widget _buildForm(
    BuildContext outerContext,
    AddBookingState state,
    WidgetRef ref,
  ) {
    final notifier = ref.read(addBookingProvider.notifier);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CourseSelectionField(
                          selectedCourse: state.selectedCourse.isEmpty
                              ? null
                              : state.selectedCourse,
                          onChanged: notifier.setSelectedCourse,
                        ),
                        const SizedBox(height: 16),
                        const ImageUploadField(),
                        const SizedBox(height: 16),
                        AutoFilledSection(
                          courseNameController: _courseNameController,
                          departmentController: _departmentController,
                          originalPriceController: _originalPriceController,
                          instructorNameController: _instructorNameController,
                          onCourseNameChanged: notifier.setCourseName,
                          onDepartmentChanged: notifier.setDepartment,
                          onOriginalPriceChanged: notifier.setOriginalPrice,
                          onInstructorNameChanged: notifier.setInstructorName,
                        ),
                        const SizedBox(height: 16),
                        DescriptionField(
                          controller: _descriptionController,
                          onChanged: notifier.setDescription,
                        ),
                        const SizedBox(height: 16),
                        ManualInputSection(
                          durationController: _durationController,
                          maxSeatsController: _maxSeatsController,
                          onDurationChanged: notifier.setDuration,
                          onMaxSeatsChanged: notifier.setMaxSeats,
                          selectedDate: state.endDate,
                          onDateTap: () => _pickDate(outerContext, ref),
                        ),
                        const SizedBox(height: 16),
                        AttendanceToggle(
                          selectedType: state.attendanceType,
                          onChanged: notifier.setAttendanceType,
                        ),
                        const SizedBox(height: 16),
                        ToggleCard(
                          isFree: state.isFree,
                          includesCertificate: state.includesCertificate,
                          onFreeChanged: (_) => notifier.toggleIsFree(),
                          onCertificateChanged: (_) =>
                              notifier.toggleIncludesCertificate(),
                        ),
                        const SizedBox(height: 16),
                        PricingSection(
                          discountController: _discountController,
                          onDiscountChanged: notifier.setDiscountAmount,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BottomActionBar(
          onPreview: () {},
          onAdd: () {
            if (_formKey.currentState!.validate()) {
              notifier.submit();
            }
          },
        ),
      ],
    );
  }

  Future<void> _pickDate(BuildContext context, WidgetRef ref) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      locale: const Locale('ar'),
    );
    if (date != null) {
      ref.read(addBookingProvider.notifier).setEndDate(date);
    }
  }
}
