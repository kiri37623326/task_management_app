import 'package:freezed_annotation/freezed_annotation.dart';
part '../../_generated/core/exception/network_exception.freezed.dart';

@freezed
abstract class NetworkException implements Exception, _$NetworkException {
  const NetworkException._();
  const factory NetworkException.badRequest() = BadRequest;
  const factory NetworkException.unauthorized() = Unauthorized;
  const factory NetworkException.paymentRequired() = PaymentRequired;
  const factory NetworkException.forbidden() = Forbidden;
  const factory NetworkException.notFound() = NotFound;
  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkException.notAcceptable() = NotAcceptable;
  const factory NetworkException.proxyAuthenticationRequired() =
      ProxyAuthenticationRequired;
  const factory NetworkException.request() = Request;
  const factory NetworkException.conflict() = Conflict;
  const factory NetworkException.payloadTooLarge() = PayloadTooLarge;
  const factory NetworkException.preconditionFailed() = PreconditionFailed;
  const factory NetworkException.lengthRequired() = LengthRequired;
  const factory NetworkException.gone() = Gone;
  const factory NetworkException.notExtended() = NotExtended;
  const factory NetworkException.loopDetected() = LoopDetected;
  const factory NetworkException.insufficientStorage() = InsufficientStorage;
  const factory NetworkException.variantAlsoNegotiates() =
      VariantAlsoNegotiates;
  const factory NetworkException.hTTPVersion() = HTTPVersion;
  const factory NetworkException.gatewayTimeout() = GatewayTimeout;
  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;
  const factory NetworkException.badGateway() = BadGateway;
  const factory NetworkException.notImplemented() = NotImplemented;
  const factory NetworkException.internalServerError() = InternalServerError;
  const factory NetworkException.requestHeaderFieldsTooLarge() =
      RequestHeaderFieldsTooLarge;
  const factory NetworkException.tooManyRequests() = TooManyRequests;
  const factory NetworkException.upgradeRequired() = UpgradeRequired;
  const factory NetworkException.tooEarly() = TooEarly;
  const factory NetworkException.locked() = Locked;
  const factory NetworkException.unprocessableEntity() = UnprocessableEntity;
  const factory NetworkException.expectationFailed() = ExpectationFailed;
  const factory NetworkException.rangeNotSatisfiable() = RangeNotSatisfiable;
  const factory NetworkException.unsupportedMediaType() = UnsupportedMediaType;
  const factory NetworkException.uRITooLong() = URITooLong;
  const factory NetworkException.networkAuthenticationRequired() =
      NetworkAuthenticationRequired;
  const factory NetworkException.unexpectedException() = UnexpectedException;

  factory NetworkException.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return const BadRequest();
      case 401:
        return const Unauthorized();
      case 402:
        return const PaymentRequired();
      case 403:
        return const Forbidden();
      case 404:
        return const NotFound();
      case 405:
        return const MethodNotAllowed();
      case 406:
        return const NotAcceptable();
      case 407:
        return const ProxyAuthenticationRequired();
      case 408:
        return const Request();
      case 409:
        return const Conflict();
      case 413:
        return const PayloadTooLarge();
      case 412:
        return const PreconditionFailed();
      case 411:
        return const LengthRequired();
      case 410:
        return const Gone();
      case 510:
        return const NotExtended();
      case 508:
        return const LoopDetected();
      case 507:
        return const InsufficientStorage();
      case 506:
        return const VariantAlsoNegotiates();
      case 505:
        return const HTTPVersion();
      case 504:
        return const GatewayTimeout();
      case 503:
        return const ServiceUnavailable();
      case 502:
        return const BadGateway();
      case 501:
        return const NotImplemented();
      case 500:
        return const InternalServerError();
      case 431:
        return const RequestHeaderFieldsTooLarge();
      case 429:
        return const TooManyRequests();
      case 426:
        return const UpgradeRequired();
      case 425:
        return const TooEarly();
      case 423:
        return const Locked();
      case 422:
        return const UnprocessableEntity();
      case 417:
        return const ExpectationFailed();
      case 416:
        return const RangeNotSatisfiable();
      case 415:
        return const UnsupportedMediaType();
      case 414:
        return const URITooLong();
      case 511:
        return const NetworkAuthenticationRequired();
      default:
        return const UnexpectedException();
    }
  }

  int toStatusCode(NetworkException e) {
    switch (e.runtimeType) {
      case BadRequest:
        return 400;
      case Unauthorized:
        return 401;
      case PaymentRequired:
        return 402;
      case Forbidden:
        return 403;
      case NotFound:
        return 404;
      case MethodNotAllowed:
        return 405;
      case NotAcceptable:
        return 406;
      case ProxyAuthenticationRequired:
        return 407;
      case Request:
        return 408;
      case Conflict:
        return 409;
      case PayloadTooLarge:
        return 413;
      case PreconditionFailed:
        return 412;
      case LengthRequired:
        return 411;
      case Gone:
        return 410;
      case NotExtended:
        return 510;
      case LoopDetected:
        return 508;
      case InsufficientStorage:
        return 507;
      case VariantAlsoNegotiates:
        return 506;
      case HTTPVersion:
        return 505;
      case GatewayTimeout:
        return 504;
      case ServiceUnavailable:
        return 503;
      case BadGateway:
        return 502;
      case NotImplemented:
        return 501;
      case InternalServerError:
        return 500;
      case RequestHeaderFieldsTooLarge:
        return 431;
      case TooManyRequests:
        return 429;
      case UpgradeRequired:
        return 426;
      case TooEarly:
        return 425;
      case Locked:
        return 423;
      case UnprocessableEntity:
        return 422;
      case ExpectationFailed:
        return 417;
      case RangeNotSatisfiable:
        return 416;
      case UnsupportedMediaType:
        return 415;
      case URITooLong:
        return 414;
      case NetworkAuthenticationRequired:
        return 511;
      default:
        throw Exception("Unexpected NetworkException");
    }
  }
}
