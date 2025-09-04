import 'dart:async';
import 'dart:convert';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/core/services/app_storage.dart';
import 'package:breach_assessment/network/net_utils/api_path.dart';
import 'package:breach_assessment/widgets/utility_widgets/snackbar/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

bool showSocketLogs = false;

class WebSocketService {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _reconnectTimer;

  int _reconnectAttempts = 0;
  final int _maxReconnectAttempts = 5;
  final List<int> _reconnectDelays = [1, 2, 4, 8, 16];

  /// seconds

  bool isConnecting = false;
  bool _shouldReconnect = true;

  /// Callbacks
  Function(dynamic data)? onMessage;
  Function(String error)? onError;
  Function()? onConnected;
  Function()? onDisconnected;

  ///Check if socket is connected
  Function(bool connection)? isConnected;

  /// Connect to WebSocket
  Future<void> connect({required BuildContext context}) async {
    if (isConnecting) return;

    isConnecting = true;
    _shouldReconnect = true;

    try {
      final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);

      /// Close existing connection if any
      await _closeConnection();

      /// Create new connection
      _channel = WebSocketChannel.connect(
        Uri.parse(ApiPath.websocketUrl(authToken)),
      );
      isConnected?.call(true);

      await _channel!.ready;

      /// Reset reconnect attempts on successful connection
      _reconnectAttempts = 0;
      isConnecting = false;

      /// Notify connection success
      onConnected?.call();

      /// Listen to stream
      _subscription = _channel!.stream.listen(
        (data) {
          showSocketLogs ? print('WebSocket data received: $data') : null;
          isConnected?.call(true);
          onMessage?.call(data);
        },
        onDone: () {
          showSocketLogs ? print('WebSocket connection closed') : null;
          onDisconnected?.call();
          isConnected?.call(false);
          _handleDisconnection(context);
        },
        onError: (error) {
          showSocketLogs ? print('WebSocket error: $error') : null;
          onError?.call(error.toString());
          isConnected?.call(false);
          _handleError(error, context);
        },
      );
    } catch (e) {
      isConnecting = false;
      isConnected?.call(false);
      showSocketLogs ? print('Failed to connect to WebSocket: $e') : null;
      _handleError(e, context);
    }
  }

  /// Handle disconnection and retry
  void _handleDisconnection(BuildContext context) {
    if (!_shouldReconnect) return;

    _scheduleReconnect(context);
  }

  /// Handle errors and retry
  void _handleError(dynamic error, BuildContext context) {
    if (!_shouldReconnect) return;

    if (error is WebSocketChannelException) {
      showSocketLogs ? print('WebSocket error: ${error.message}') : null;
      if (error.inner != null) {
        final err = error.inner as dynamic;
        showSocketLogs ? print('Inner error: ${err.toString()}') : null;
      }
    }

    _scheduleReconnect(context);
  }

  /// Schedule reconnection with exponential backoff
  void _scheduleReconnect(BuildContext context) {
    if (_reconnectAttempts >= _maxReconnectAttempts) {
      showSocketLogs
          ? print('Max reconnection attempts reached. Stopping reconnection.')
          : null;
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: 'Connection lost. Please restart the app.',
        );
      }
      return;
    }

    final delay =
        _reconnectDelays[_reconnectAttempts.clamp(
          0,
          _reconnectDelays.length - 1,
        )];
    showSocketLogs
        ? print(
            'Scheduling reconnect in $delay seconds (attempt ${_reconnectAttempts + 1})',
          )
        : null;

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(Duration(seconds: delay), () {
      _reconnectAttempts++;
      showSocketLogs
          ? print(
              'Attempting to reconnect... ($_reconnectAttempts/$_maxReconnectAttempts)',
            )
          : null;
      connect(context: context);
    });
  }

  /// Send message through WebSocket
  void sendMessage(dynamic message) {
    if (_channel?.sink != null) {
      _channel!.sink.add(jsonEncode(message));
    } else {
      showSocketLogs
          ? print('WebSocket not connected. Cannot send message.')
          : null;
    }
  }

  /// Manual reconnect
  Future<void> reconnect(BuildContext context) async {
    _reconnectAttempts = 0;
    await connect(context: context);
  }

  /// Close connection
  Future<void> _closeConnection() async {
    await _subscription?.cancel();
    await _channel?.sink.close();
    _subscription = null;
    _channel = null;
  }

  /// Disconnect and stop auto-reconnect
  Future<void> disconnect() async {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    await _closeConnection();
  }

  void dispose() {
    disconnect();
  }
}
