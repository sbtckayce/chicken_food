import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emax/models/category_model.dart';
import 'package:emax/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>((event, emit) {
      _categorySubscription?.cancel();
      _categorySubscription = _categoryRepository
          .getAllCategories()
          .listen((categories) => add(UpdateCategories(categories)));
    });

    on<UpdateCategories>((event, emit) {
      emit(CategoryLoaded(categories: event.categories));
    });
  }
}
