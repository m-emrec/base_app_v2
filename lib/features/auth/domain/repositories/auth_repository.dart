import '../../../../core/resources/data_state.dart';
import '../entities/auth_entity.dart';

/// Abstract class [AuthRepository] is used to define the methods that will be used to interact with the data sources.
/// This class will be implemented by the data layer, using the [AuthRepositoryImpl] class.
/// This class will be used by the domain layer to interact with the data layer.
abstract class AuthRepository {
  /// This method will be used to sign in with email and password.
  Future<DataState<void>> signInWithEmailAndPassword(AuthEntity authEntity);
}
