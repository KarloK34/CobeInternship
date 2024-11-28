import 'package:dio/dio.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/data_service.g.dart';

@Singleton()
@RestApi(baseUrl: "https://cope-hive-wtsg6fob5q-ew.a.run.app/hive")
abstract class DataService {
  @factoryMethod
  factory DataService(Dio dio) = _DataService;

  @GET("/users/{id}")
  Future<User> getUser(@Path("id") String id);

  @GET("/users")
  Future<List<User>> getAllUsers();

  @GET("/requests/{id}")
  Future<LeaveRequest> getRequest(@Path("id") String id);

  @GET("/requests")
  Future<List<LeaveRequest>> getRequests({@Query("userId") String? userId, @Query("status") LeaveRequestStatus? status});

  @POST("/create_request")
  Future<void> createRequest(@Body() Map<String, dynamic> request);

  @POST("/requests/{id}/status")
  Future<void> updateStatus(@Path("id") String id, @Body() Map<String, dynamic> status);
}
