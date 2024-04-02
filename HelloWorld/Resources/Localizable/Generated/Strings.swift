// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum S10n {
  internal enum Home {
    /// Home
    internal static var tabTitle: String { return S10n.tr("Localizable", "home.tabTitle", fallback: "Home") }
  }
  internal enum Login {
    /// Email
    internal static var email: String { return S10n.tr("Localizable", "login.email", fallback: "Email") }
    /// Password
    internal static var password: String { return S10n.tr("Localizable", "login.password", fallback: "Password") }
    internal enum Email {
      /// Email is Invalid!
      internal static var invalid: String { return S10n.tr("Localizable", "login.email.invalid", fallback: "Email is Invalid!") }
      /// Email is required!
      internal static var `required`: String { return S10n.tr("Localizable", "login.email.required", fallback: "Email is required!") }
    }
    internal enum Password {
      /// Password is Invalid!
      internal static var invalid: String { return S10n.tr("Localizable", "login.password.invalid", fallback: "Password is Invalid!") }
      /// Password is reauired!
      internal static var `required`: String { return S10n.tr("Localizable", "login.password.required", fallback: "Password is reauired!") }
    }
  }
  internal enum Profile {
    /// Profile
    internal static var tabTitle: String { return S10n.tr("Localizable", "profile.tabTitle", fallback: "Profile") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension S10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = localized(key, table, value)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
