extension SDCAlertController {
    /// Convenience method to quickly display a basic alert.
    ///
    /// - parameter title:       An optional title for the alert.
    /// - parameter message:     An optional message for the alert.
    /// - parameter actionTitle: An optional action for the alert.
    /// - parameter customView:  An optional view that will be displayed in the alert's `contentView`.
    ///
    /// - returns: The alert that was presented.
    @objc
    @discardableResult
    public static func alert(withTitle title: String? = nil, message: String? = nil,
                             actionTitle: String? = nil, customView: UIView? = nil) -> SDCAlertController {
        let alertController = SDCAlertController(title: title, message: message)
        alertController.addAction(SDCAlertAction(title: actionTitle, style: .preferred))

        if let customView = customView {
            alertController.contentView.addSubview(customView)
        }

        alertController.present()
        return alertController
    }

    /// Convenience method to quickly display a basic action sheet.
    ///
    /// - parameter title:   An optional title for the action sheet.
    /// - parameter message: An optional message for the action sheet.
    /// - parameter actions: The titles of the actions in the action sheet.
    ///
    /// - returns: The action sheet that was presented.
    @objc
    @discardableResult
    public static func sheet(withTitle title: String? = nil, message: String? = nil, actions: [String])
        -> SDCAlertController {
        let alertController = SDCAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { alertController.addAction(SDCAlertAction(title: $0, style: .normal)) }
        alertController.present()
        return alertController
    }

    /// Convenience method to quickly display an action sheet with custom view.
    ///
    /// - parameter view:    The view that should be displayed in the action sheet.
    /// - parameter actions: The titles of the actions in the action sheet.
    ///
    /// - returns: The action sheet that was presented.
    @objc
    public static func sheet(with view: UIView, actions: [String]) -> SDCAlertController {
        let alertController = SDCAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actions.forEach { alertController.addAction(SDCAlertAction(title: $0, style: .normal)) }
        alertController.contentView.addSubview(view)
        alertController.present()
        return alertController
    }
}
