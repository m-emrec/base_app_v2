import '../../../../core/resources/data_state.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_model.dart';
import '../services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authService});

  final AuthService authService;
  @override
  Future<DataState<void>> signInWithEmailAndPassword(AuthEntity authEntity) {
    return DataState.handleDataState(
      () => authService
          .signWithEmailAndPassword(AuthModel.fromEntity(authEntity)),
    );
  }
}
