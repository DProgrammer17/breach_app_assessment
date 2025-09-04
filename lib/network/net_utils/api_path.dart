abstract class ApiPath{
  static const baseUrl = 'https://breach-api.qa.mvm-tech.xyz';
  static String websocketUrl(String token) => 'wss://breach-api-ws.qa.mvm-tech.xyz?token=$token';

  ///Auth
  static const signUp = '$baseUrl/api/auth/register';
  static const login = '$baseUrl/api/auth/login';

  ///Blog APIs
  static const getCategories = '$baseUrl/api/blog/categories';
  static const getPosts= '$baseUrl/api/blog/posts';

  ///Interests APIs
  static String getInterests(int userId) => '$baseUrl/api/users/$userId/interests';
  static String postInterests(int userId) => '$baseUrl/api/users/$userId/interests';

}