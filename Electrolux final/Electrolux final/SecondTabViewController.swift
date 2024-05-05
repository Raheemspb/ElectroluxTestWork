//
//  SecondTabViewController.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import UIKit

class SecondTabViewController: UIViewController {

    private let image = UIImageView()
    private let firstName = UILabel()
    private let lastName = UILabel()
    private let bioLabel = UILabel()
    private let biography = UILabel()
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSecondViewController()
        setupConstraints()
    }
    
    private func setupSecondViewController() {
        view.addSubview(scrollView)
        view.backgroundColor = .white
        scrollView.addSubview(image)
        scrollView.addSubview(firstName)
        scrollView.addSubview(lastName)
        scrollView.addSubview(bioLabel)
        scrollView.addSubview(biography)
        
        image.image = UIImage(named: "messi")
        image.contentMode = .scaleAspectFill
        
        firstName.text = "Lionel"
        firstName.numberOfLines = 0
        
        lastName.text = "Messi"
        lastName.numberOfLines = 0
        
        bioLabel.text = "BIO"
        bioLabel.font = UIFont.boldSystemFont(ofSize: 24)
        bioLabel.textAlignment = .center
        
        
        biography.text = messiBio
        
        biography.numberOfLines = 0
        scrollView.isScrollEnabled = true
    }
    
    private func setupConstraints() {
        scrollView.autoPinEdge(toSuperviewEdge: .leading)
        scrollView.autoPinEdge(toSuperviewEdge: .trailing)
        scrollView.autoPinEdge(toSuperviewSafeArea: .top)
        scrollView.autoPinEdge(toSuperviewSafeArea: .bottom)

        image.autoSetDimension(.height, toSize: 150)
        image.autoSetDimension(.width, toSize: 120)
        image.autoPinEdge(.top, to: .top, of: scrollView, withOffset: 30)
        image.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)

        firstName.autoPinEdge(.top, to: .top, of: image)
        firstName.autoPinEdge(.leading, to: .trailing, of: image, withOffset: 30)

        lastName.autoPinEdge(.top, to: .top, of: image)
        lastName.autoPinEdge(.leading, to: .trailing, of: firstName, withOffset: 30)
        lastName.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)

        bioLabel.autoPinEdge(.leading, to: .leading, of: view)
        bioLabel.autoPinEdge(.trailing, to: .trailing, of: view)
        bioLabel.autoPinEdge(.top, to: .bottom, of: image, withOffset: 60)

        biography.autoPinEdge(.top, to: .bottom, of: bioLabel, withOffset: 30)
        biography.autoPinEdge(.leading, to: .leading, of: view, withOffset: 30)
        biography.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -30)
        biography.autoPinEdge(.bottom, to: .bottom, of: biography.superview!)

    }

}
