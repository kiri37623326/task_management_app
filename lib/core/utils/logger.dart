import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as logger;

/// ログ出力用
class Logger {
  /// コンストラクタを隠蔽する
  Logger.init() {
    logger.Logger.root.level =
        kReleaseMode ? logger.Level.WARNING : logger.Level.ALL;
    logger.Logger.root.onRecord.listen((rec) {
      debugPrint(
          '[${rec.loggerName}] ${rec.level.name}: ${rec.time}: ${rec.message}');
    });
  }
  static final _logger = logger.Logger("Logger");

  /// 一般的なログ出力
  static void info(String message) {
    _logger.info(message);
  }

  /// 設定に関する出力
  static void config(String message) {
    _logger.config(message);
  }

  /// 詳細なログ出力
  static void fine(String message) {
    _logger.fine(message);
  }

  /// より詳細なログ出力
  static void finer(String message) {
    _logger.finer(message);
  }

  /// 最も詳細なログ出力
  static void finest(String message) {
    _logger.finest(message);
  }

  /// おおむね出力すべきログ
  static void warning(String message) {
    _logger.warning(message);
  }

  /// ほとんどの場合で出力すべきログ
  static void severe(String message) {
    _logger.severe(message);
  }

  /// 必ず出力するログ
  static void shout(String message) {
    _logger.shout(message);
  }

  /// ログレベルを設定して出力
  static void log(String message, logger.Level logLevel) {
    _logger.log(logLevel, message);
  }
}
