//
//  ViewController.swift
//  UIPanGestureRecognizer
//
//  Created by Bilgihan Köse on 2.06.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView(image: UIImage(named: "swiftlogo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        imageView.isUserInteractionEnabled = true
    }
    
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        //  if gesture.state == .began {
        //  print("began")
        if gesture.state == .changed {
            // print("changed")
            let translation = gesture.translation(in: view)
            imageView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended {
            //  print("ended")
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.4,  options: .allowAnimatedContent, animations: {self.imageView.transform = .identity})
        }
    }
}

