import 'package:flutter_calendar/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnection>()])
void main() {
  MockInternetConnection mockInternetConnection = MockInternetConnection();
  NetworkInfoImpl networkInfo = NetworkInfoImpl(mockInternetConnection);

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        when(mockInternetConnection.hasInternetAccess)
            .thenAnswer((_) => tHasConnectionFuture);
        final result = networkInfo.isConnected;
        verify(mockInternetConnection.hasInternetAccess);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
