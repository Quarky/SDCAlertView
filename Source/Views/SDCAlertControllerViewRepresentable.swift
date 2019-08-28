import UIKit

protocol SDCAlertControllerViewRepresentable: class {
    var title: NSAttributedString? { get set }
    var message: NSAttributedString? { get set }

    var actions: [SDCAlertAction] { get set }
    var actionTappedHandler: ((SDCAlertAction) -> Void)? { get set }

    var contentView: UIView! { get }
    var visualStyle: AlertVisualStyle! { get set }

    var topView: UIView { get }

    var titleLabel: SDCAlertLabel! { get }
    var messageLabel: SDCAlertLabel! { get }
    var actionsCollectionView: SDCActionsCollectionView! { get }

    func add(_ behaviors: AlertBehaviors)
    func addDragTapBehavior()
    func prepareLayout()
}

extension SDCAlertControllerViewRepresentable where Self: UIView {
    var title: NSAttributedString? {
        get { return self.titleLabel.attributedText }
        set { self.titleLabel.attributedText = newValue }
    }

    var message: NSAttributedString? {
        get { return self.messageLabel.attributedText }
        set { self.messageLabel.attributedText = newValue }
    }

    var topView: UIView { return self }

    func add(_ behaviors: AlertBehaviors) {
        if behaviors.contains(.dragTap) {
            self.addDragTapBehavior()
        }
    }
}
