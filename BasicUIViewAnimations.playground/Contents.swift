import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let glowButton = UIButton()
    let winkButton = UIButton()
    let tongueButton = UIButton()

    let creeperView = UIView(frame: CGRect(x: 25, y: 315, width: 325, height: 310))
    let leftEye = UIView(frame: CGRect(x: 75, y: 350, width: 75, height: 75))
    let rightEye = UIView(frame: CGRect(x: 225, y: 350, width: 75, height: 75))
    let nose = UIView(frame: CGRect(x: 150, y: 425, width: 75, height: 37.5))
    let mouth = UIView(frame: CGRect(x: 110, y: 460, width: 150, height: 75))
    let leftTooth = UIView(frame: CGRect(x: 110, y: 535, width: 50, height: 50))
    let rightTooth = UIView(frame: CGRect(x: 210, y: 535, width: 50, height: 50))
    let toungh = UIView(frame: CGRect(x: 160, y: 535, width: 50, height: 0))

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view

        setupAnimateButtons()
        setupViews()
    }

    func setupAnimateButtons() {
        view.addSubview(glowButton)

        glowButton.translatesAutoresizingMaskIntoConstraints = false
        glowButton.setTitle("Toothless", for: .normal)
        glowButton.backgroundColor = .gray
        glowButton.layer.cornerRadius = 10
        glowButton.addTarget(self, action: #selector(animateToothless), for: .touchUpInside)

        glowButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        glowButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        glowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        glowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        view.addSubview(winkButton)

        winkButton.translatesAutoresizingMaskIntoConstraints = false
        winkButton.setTitle("Wink ;-)", for: .normal)
        winkButton.backgroundColor = .gray
        winkButton.layer.cornerRadius = 10
        winkButton.addTarget(self, action: #selector(animateWink), for: .touchUpInside)

        winkButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        winkButton.topAnchor.constraint(equalTo: glowButton.bottomAnchor, constant: 20).isActive = true
        winkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        winkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        view.addSubview(tongueButton)

        tongueButton.translatesAutoresizingMaskIntoConstraints = false
        tongueButton.setTitle("Tongue :-p", for: .normal)
        tongueButton.backgroundColor = .gray
        tongueButton.layer.cornerRadius = 10
        tongueButton.addTarget(self, action: #selector(animateToungh), for: .touchUpInside)

        tongueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        tongueButton.topAnchor.constraint(equalTo: winkButton.bottomAnchor, constant: 20).isActive = true
        tongueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tongueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }

    func setupViews() {
        view.addSubview(creeperView)
        creeperView.backgroundColor = .green

        view.addSubview(leftEye)
        leftEye.backgroundColor = .black

        view.addSubview(rightEye)
        rightEye.backgroundColor = .black

        view.addSubview(nose)
        nose.backgroundColor = .black

        view.addSubview(mouth)
        mouth.backgroundColor = .black

        view.addSubview(leftTooth)
        leftTooth.backgroundColor = .black

        view.addSubview(rightTooth)
        rightTooth.backgroundColor = .black

        view.addSubview(toungh)
        toungh.backgroundColor = .red
    }

    @objc func animateToothless() {
        // Animate with no completion callback
        UIView.animate(withDuration: 1) {
            self.leftTooth.alpha = 0
            self.rightTooth.alpha = 0
        }
    }

    @objc func animateWink() {
        let originalHeight = rightEye.frame.size.height
        let originalYPos = rightEye.center.y

        // Animate with with completion callback
        UIView.animate(withDuration: 0.3, animations: {
            self.rightEye.frame.size.height = 0
            self.rightEye.center.y = 400
        }) { (true) in
            self.rightEye.frame.size.height = originalHeight
            self.rightEye.center.y = originalYPos
        }
    }

    @objc func animateToungh() {
        let originaHeight = toungh.frame.size.height

        // Animate with sprint effect
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 5,
                       options: .curveEaseOut,
                       animations: {
            self.toungh.frame.size.height = 55
        }) { _ in
            self.toungh.frame.size.height = originaHeight
        }
    }
}

let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 375, height: 812)

PlaygroundPage.current.liveView = vc
