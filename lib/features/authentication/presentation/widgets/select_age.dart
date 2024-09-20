import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/get_age_cubit.dart';
import 'package:cart_bazar/features/authentication/presentation/bloc/cubit/selected_age_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/age_range.dart';

class SelectAgeBottomSheet extends StatelessWidget {
  const SelectAgeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: BlocBuilder<GetAgeCubit, dynamic>(
        builder: (context, state) {
          if (state is GetAgeLoading) {
            return const Center(child: Text('Loading data...'));
          } else if (state is GetAgeListSuccess) {
            return _buildAgesPreviewList(context, state.ages);
          } else if (state is GetAgeFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildAgesPreviewList(BuildContext context, List<AgeRange> agesList) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      itemBuilder: (context, index) {
        final age = agesList[index];
        return GestureDetector(
          onTap: () {
            context.read<SelectedAgeCubit>().selectedAge(age.range);
            Navigator.pop(context);
          },
          child: Text(
            age.range,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: agesList.length,
    );
  }
}
