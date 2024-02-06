import UIKit

final class SpikeViewController: ViewController {
    let bottomVC = BottomSheetViewController()

    override func viewDidLoad() {

        let buttonTest = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        buttonTest.setTitle("Test", for: .normal)
        buttonTest.backgroundColor = .blue
        buttonTest.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(buttonTest)
    }

    override func viewDidAppear(_ animated: Bool) {

        // test scrolling on the view behind
        bottomVC.view.backgroundColor = .gray
        bottomVC.isModalInPresentation = true
        bottomVC.navigationItem.title = "testtttttt"

        // show title
        if let sheet = bottomVC.sheetPresentationController {

            let id = UISheetPresentationController.Detent.Identifier(rawValue: "small")

            if #available(iOS 16, *) {
                // it always opens on the smaller size
                sheet.detents = [ .custom(identifier: id, resolver: { context in
                    60
                }), .medium(), .large()]
            } else {
                sheet.detents = [ .medium(), .large()]
            }
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 24.0
        }

        // popover on ipad? use detent

        navigationController?.present(bottomVC, animated: false)
    }

    @objc func buttonAction() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        // dismissing the bottom sheet is necessary to push another vc
        if let _ = bottomVC.sheetPresentationController {
            bottomVC.isModalInPresentation = false
        }
        bottomVC.dismiss(animated: true)

        navigationController?.push(vc, animated: true)

    }

}

class BottomSheetViewController: ViewController {

    override func viewDidLoad() {
        let buttonTest = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        buttonTest.setTitle("Test", for: .normal)
        buttonTest.backgroundColor = .blue
        buttonTest.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(buttonTest)
    }

    @objc func buttonAction() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        guard let presentingViewController else {
            return
        }
        presentingViewController.dismiss(animated: true) {
            presentingViewController.push(vc)
        }

    }

}
