import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/bottom_action_bar.dart';
import '../../../../core/widgets/description_field.dart';
import '../../../../core/widgets/image_upload_field.dart';
import '../../../../core/widgets/toggle_card.dart'
    show ToggleCard, ToggleRowItem;
import '../providers/add_booking_provider.dart';
import 'attendance_toggle.dart';
import 'auto_filled_section.dart';
import 'course_selection_field.dart';
import 'manual_input_section.dart';
import 'pricing_section.dart';

class BookingForm extends ConsumerStatefulWidget {
  const BookingForm({super.key});

  @override
  ConsumerState<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends ConsumerState<BookingForm> {
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
                          onDateTap: () => _pickDate(ref),
                        ),
                        const SizedBox(height: 16),
                        AttendanceToggle(
                          selectedType: state.attendanceType,
                          onChanged: notifier.setAttendanceType,
                        ),
                        const SizedBox(height: 16),
                        ToggleCard(
                          items: [
                            ToggleRowItem(
                              title: 'متاح مجانا',
                              subtitle: 'للطلاب التسجيل فوراً بدون رسوم',
                              value: state.isFree,
                              onChanged: (_) => notifier.toggleIsFree(),
                            ),
                            ToggleRowItem(
                              title: 'تتضمن شهادة',
                              subtitle: 'يمنح الطالب شهادة عند الإكمال',
                              value: state.includesCertificate,
                              onChanged: (_) =>
                                  notifier.toggleIncludesCertificate(),
                            ),
                          ],
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
          mainLabel: 'إضافة',
          secondaryLabel: 'معاينة',
          onMainPressed: () {
            if (_formKey.currentState!.validate()) {
              notifier.submit();
            }
          },
          onSecondaryPressed: () {},
        ),
      ],
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

  Future<void> _pickDate(WidgetRef ref) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (date != null) {
      ref.read(addBookingProvider.notifier).setEndDate(date);
    }
  }
}
