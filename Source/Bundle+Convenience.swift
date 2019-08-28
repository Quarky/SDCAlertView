import Foundation

extension Bundle {
    static var resourceBundle: Bundle {
        let sourceBundle = Bundle(for: SDCAlertController.self)
        let bundleURL = sourceBundle.url(forResource: "SDCAlertView", withExtension: "bundle")
        return bundleURL.flatMap(Bundle.init(url:)) ?? sourceBundle
    }
}
