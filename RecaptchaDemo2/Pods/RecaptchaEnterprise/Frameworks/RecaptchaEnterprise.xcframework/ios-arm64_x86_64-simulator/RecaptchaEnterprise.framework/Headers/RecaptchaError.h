#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** List of errors that can be returned from the SDK. */
typedef NS_ENUM(NSInteger, RecaptchaErrorCode) {
  /*
   * IMPORTANT: This list is add-only. Never change any existing value, since this class is
   * publicly visible and customers rely on these values to do error checking.
   */

  /** Unknown error occurred during the workflow. */
  RecaptchaErrorCodeUnknown = 0,

  /** reCAPTCHA cannot connect to Google servers, please make sure the app has network access. */
  RecaptchaErrorNetworkError = 1,

  /** The site key used to call reCAPTCHA is invalid. */
  RecaptchaErrorInvalidSiteKey = 2,

  /**
   * Cannot create a reCAPTCHA client because the key used cannot be used on iOS.
   *
   * Please register new site key with the key type set to "iOS App" via
   * [https://g.co/recaptcha/androidsignup](https://g.co/recaptcha/androidsignup).
   */
  RecaptchaErroInvalidKeyType = 3,

  /**
   * Cannot create a reCAPTCHA client because the site key used doesn't support the calling package.
   */
  RecaptchaErrorInvalidPackageName = 4,

  /** reCAPTCHA cannot accept the action used, see custom action guidelines */
  RecaptchaErrorInvalidAction = 5,

  /** reCAPTCHA has faced an internal error, please try again in a bit. */
  RecaptchaErrorCodeInternalError = 100,
};

/** Error class for reCAPTCHA Events. */
@interface RecaptchaError : NSError

@property(nonatomic, nullable) NSString *errorMessage;
@property(nonatomic) NSInteger errorCode;

/**
 * If the returned error code is of type `Aborted` you can use this key to
 * get the aborted token out of the `userInfo` property. The token is stored
 * inside an instance of `RecaptchaToken`.
 */
@property(class, nonatomic, readonly) NSString *workflowAbortedTokenKey;

/**
 * Builds a new reCAPTCHA Error object.
 */
- (instancetype)initWithDomain:(NSErrorDomain)domain
                          code:(RecaptchaErrorCode)code
                      userInfo:(NSDictionary<NSErrorUserInfoKey, id> *_Nullable)dict
                       message:(NSString *_Nullable)message;

- (instancetype)init NS_UNAVAILABLE;

/** For debug purposes, prints a human friendly description of the error. */
- (NSString *)description;

@end

NS_ASSUME_NONNULL_END
