import UIKit

final class SpikeViewController: ViewController {

    override func viewDidLoad() {

        let buttonTest = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        buttonTest.setTitle("Test", for: .normal)
        buttonTest.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(buttonTest)
    }

    override func viewDidAppear(_ animated: Bool) {

        let bottomVC = BottomSheetViewController()
        bottomVC.view.backgroundColor = .red
        bottomVC.isModalInPresentation = true
        if let sheet = bottomVC.sheetPresentationController {
            sheet.detents = [ .medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersGrabberVisible = true
        }

        navigationController?.present(bottomVC, animated: false)
    }

    @objc func buttonAction() {
        let vc = ViewController()

    }

}

class BottomSheetViewController: ViewController {

}
