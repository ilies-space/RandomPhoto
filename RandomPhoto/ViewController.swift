//
//  ViewController.swift
//  RandomPhoto
//
//  Created by ilies on 28/8/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let colors : [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemGray,
        .systemGreen,
        .systemPurple,
        .systemYellow
    ]
    
    private let imageView : UIImageView = {
        let imageView  = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    private let button : UIButton = {
        let button  = UIButton()
        button.backgroundColor = .white
        button.setTitle("Get another image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height-200-view.safeAreaInsets.bottom, width: view.frame.width-40, height: 50)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        Change background color
        view.backgroundColor = .systemBlue
//        add image view to the screen
        view.addSubview(imageView)
        
        
        imageView.frame = CGRect(x:0,y:0,width: 300,height: 300)
        imageView.center = view.center
        getRandomImage()
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton),
                         for: .touchUpInside)
        
    
    }
    
    func getRandomImage () {
        let urlString = "https://source.unsplash.com/random"
        
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf:url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    @objc func didTapButton()  {
        getRandomImage()
        view.backgroundColor = colors.randomElement()
    }


}

