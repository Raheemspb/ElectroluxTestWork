//
//  CollectionViewCell.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    static let reuseId = "CollectionViewCell"

    let image = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
    }

    private func setupImage() {
        contentView.addSubview(image)
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
            make.center.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
