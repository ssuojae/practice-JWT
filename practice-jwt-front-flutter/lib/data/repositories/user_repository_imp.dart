import 'package:portfolio/data/mapper/user_mapper.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repository_interfaces/user_repository.dart';
import '../local_data_source/local_data_source.dart';
import '../remote_data_source/remote_data_source.dart';

final class UserRepository implements IUserRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final UserMapper _mapper;

  UserRepository(this._remoteDataSource, this._localDataSource, this._mapper);

  @override
  Future<UserEntity> loginUser(String email, String password) async {
    final userDTO = await _remoteDataSource.registerUser(email, password);
    return _mapper.toEntityFromDTO(userDTO);
  }

  @override
  Future<void> logoutUser() async {
    await _localDataSource.clearUserInfo();
  }

  @override
  Future<String> refreshToken(String refreshToken) async {
    return await _remoteDataSource.refreshToken(refreshToken);
  }

  @override
  Future<UserEntity> registerUser(String email, String password) async {
    final userDTO = await _remoteDataSource.registerUser(email, password);
    return _mapper.toEntityFromDTO(userDTO);
  }
}
