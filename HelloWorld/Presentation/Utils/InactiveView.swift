import Foundation
import UIKit

class InactiveView {
    
    internal static var containerView: UIView?
    internal static let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.contentMode = .scaleToFill
        
        imageView.image = UIImage(named: "SplashIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    internal static let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()

    
    static func show() {
        DispatchQueue.main.async {
            if containerView == nil, let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first {
                let frame = UIScreen.main.bounds
                containerView = UIView(frame: frame)
                containerView!.backgroundColor = UIColor.clear
                containerView!.insertSubview(blurView, at: 0)
                containerView?.insertSubview(imageView, at: 1)
                
                imageView.centerXAnchor.constraint(equalTo: containerView!.centerXAnchor).isActive = true
                imageView.centerYAnchor.constraint(equalTo: containerView!.centerYAnchor).isActive = true

                NSLayoutConstraint.activate([
                  blurView.topAnchor.constraint(equalTo: containerView!.topAnchor),
                  blurView.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor),
                  blurView.heightAnchor.constraint(equalTo: containerView!.heightAnchor),
                  blurView.widthAnchor.constraint(equalTo: containerView!.widthAnchor)
                ])
                containerView?.alpha = 0
                window.addSubview(containerView!)
                UIView.animate(withDuration: 0.1, animations: {
                    containerView?.alpha = 1
                })
            }
        }
    }
    
    static func hide() {
        DispatchQueue.main.async {
            guard let containerView = containerView else {
                return
            }
            UIView.animate(withDuration: 0.1, animations: {
                containerView.alpha = 0
            }, completion: {finised in
                containerView.removeFromSuperview()
                self.containerView = nil
            })
            
        }
    }
}
