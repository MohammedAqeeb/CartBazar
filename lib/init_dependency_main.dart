part of 'init_dependency.dart';

final serviceLocator = GetIt.instance;

Future<void> initalizedDependency() async {
  _signUpDependency();
  _categoryDependecy();
  _topSellingProducts();
  _addToCart();
  _getCartItems();
  _orderPlaced();
}

void _signUpDependency() {
  // data source Dependency
  serviceLocator
    ..registerSingleton<AuthDataSourceService>(
      AuthDataSourceServiceImpl(),
    )
    // authRepository Dependency
    ..registerSingleton<AuthRepository>(
      AuthRepositoryImpl(
        authDataSourceService: serviceLocator(),
      ),
    )
    // SignUp Use Case Dependency
    ..registerSingleton(
      SignupUseCase(
        authRepository: serviceLocator(),
      ),
    ) // SignIn Use Case Dependency
    ..registerSingleton(
      SignInUsecase(
        authRepository: serviceLocator(),
      ),
    ) // reset password Use Case Dependency
    ..registerSingleton(
      ResetPasswordUseCase(
        authRepository: serviceLocator(),
      ),
    ) // usecase for checking user logged in or not
    ..registerSingleton<LoggedInUserUseCase>(
      LoggedInUserUseCase(
        authRepository: serviceLocator(),
      ),
    ) // usecase for fetching userdata to display on homescreen
    ..registerSingleton<GetUserInfoUsecase>(
      GetUserInfoUsecase(
        authRepository: serviceLocator(),
      ),
    ) // cubit for fetching userdata to display on homescreen
    ..registerSingleton<GetUserInfoCubit>(
      GetUserInfoCubit(
        getUserInfoUsecase: serviceLocator(),
      ),
    )
    // Get Age Use Case Dependency
    ..registerSingleton<AgeRangeUseCase>(
      AgeRangeUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerSingleton<GetAgeCubit>(
      GetAgeCubit(ageUseCase: serviceLocator()),
    );
}

void _categoryDependecy() {
  // data source
  serviceLocator
    ..registerSingleton<CategoriesDataSource>(
      CategoriesDataSourceImp(),
    )
    // repository
    ..registerSingleton<CategoryRepository>(
      CategoryRepositoryImp(
        categoriesDataSource: serviceLocator(),
      ),
    )
    // usecase
    ..registerSingleton(
      CategoryUseCase(
        categoryRepository: serviceLocator(),
      ),
    )
    // cubit
    ..registerSingleton(
      CategoriesListCubit(
        useCase: serviceLocator(),
      ),
    );
}

void _topSellingProducts() {
  serviceLocator
    ..registerSingleton<ProductDataSource>(
      ProductDataSourceImp(),
    )
    ..registerSingleton<GetProductsRepository>(
      GetProductsRepoImpl(
        productDataSource: serviceLocator(),
      ),
    )
    ..registerSingleton<GetTopSellingProductsUseCase>(
      GetTopSellingProductsUseCase(
        productsRepository: serviceLocator(),
      ),
    )
    ..registerSingleton<NewProductsUseCase>(
      NewProductsUseCase(
        productsRepository: serviceLocator(),
      ),
    )
    ..registerSingleton(
      ProductByCategoryUsecase(
        productsRepository: serviceLocator(),
      ),
    )
    ..registerSingleton(
      SearchProductUseCase(
        repository: serviceLocator(),
      ),
    );
}

void _addToCart() {
  serviceLocator
    ..registerSingleton<OrderDataSource>(
      AddToCartDataSourceImpl(),
    )
    ..registerSingleton<OrderRepository>(
      OrderRepoImplementation(
        orderDataSource: serviceLocator(),
      ),
    )
    ..registerSingleton(
      AddToCartUsecase(
        orderRepository: serviceLocator(),
      ),
    );
}

void _getCartItems() {
  serviceLocator
    ..registerSingleton<ProductCartsDataSource>(
      ProductCartsDataSourceImpl(),
    )
    ..registerSingleton<ProductCartRepo>(
      ProductCartRepoImpl(
        productCartsDataSource: serviceLocator(),
      ),
    )
    ..registerSingleton<GetCartProductUseCase>(
      GetCartProductUseCase(
        productCartRepo: serviceLocator(),
      ),
    )
    ..registerSingleton<RemoveCartProductUseCase>(
      RemoveCartProductUseCase(
        productCartRepo: serviceLocator(),
      ),
    )
    ..registerSingleton<ProductCartCubit>(
      ProductCartCubit(
        useCase: serviceLocator(),
        removeUsecase: serviceLocator(),
      ),
    );
}

void _orderPlaced() {
  serviceLocator.registerSingleton(
    OrderPlaceUsecase(
      orderRepository: serviceLocator(),
    ),
  );
}
