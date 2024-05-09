//
//  ProductImageViewController.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import UIKit

final class ProductImageViewController: UIViewController {

    var productImage = UIImageView()
    var imageData = Data()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }

    private func setupImage() {
        view.addSubview(productImage)
        view.backgroundColor = .systemGray5
        productImage.contentMode = .scaleAspectFit

        productImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }

    }
}
