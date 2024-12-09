import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tast_managger/config/app/app.dart';
import 'package:tast_managger/core/api/api_client.dart';
import 'package:tast_managger/data/endpoints/endpoints.dart';
import 'package:tast_managger/data/repositories/tasks_repository_impl.dart';
import 'package:tast_managger/domain/repositories/tasks_repositorie.dart';



class ServiceLocator {
  const ServiceLocator._();

  static final sl = GetIt.instance;

  static void setupServiceLocator(AppConfig appConfig) {
    sl
          ..registerSingleton(appConfig)
          // Dio & API Client
          ..registerSingleton(Dio())
          ..registerSingleton(
            ApiClient(sl<Dio>(), sl<AppConfig>().apiUrl),
          )

          // APIs
          ..registerSingleton(
            GetTasks(
              apiClient: sl<ApiClient>(),
            ),
          ) 
          ..registerSingleton(
            GetTaskId(
              apiClient: sl<ApiClient>(),
            ),
          ) 
          ..registerSingleton(
            AddTask(
              apiClient: sl<ApiClient>(),
            ),
          ) 
          ..registerSingleton(
            EditTask(
              apiClient: sl<ApiClient>(),
            ),
          ) 
          ..registerSingleton(
            DeleteTask(
              apiClient: sl<ApiClient>(),
            ),
          ) 
         

          //repositories
          ..registerLazySingleton<TasksRepository>(
            () => TasksRepositoryImpl(
              sl<AddTask>(),
              sl<GetTasks>(),
              sl<GetTaskId>(),
              sl<EditTask>(),
              sl<DeleteTask>(),
            ),
          )
        ;
  }
}
