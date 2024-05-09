//
//  ViewController.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import UIKit
import SnapKit
import PureLayout
import SDWebImage

final class FirstTabViewController: UIViewController {

    private var searchBar: UISearchBar!
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchBar()
        setupCollectionView()
        getData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    private func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .white
        view.addSubview(searchBar)

        searchBar.autoSetDimension(.height, toSize: 50)
        searchBar.autoPinEdge(toSuperviewSafeArea: .top)
        searchBar.autoPinEdge(toSuperviewEdge: .leading)
        searchBar.autoPinEdge(toSuperviewEdge: .trailing)
    }

    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout:
                                            setupCollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.contentInset = .init(top: 20, left: 30, bottom: 0, right: 30)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier:
                                    CollectionViewCell.reuseId)
        collectionView.autoPinEdge(.top, to: .bottom, of: searchBar)
        collectionView.autoPinEdge(toSuperviewEdge: .leading)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing)
        collectionView.autoPinEdge(toSuperviewSafeArea: .bottom)
    }

    private func setupCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 120, height: 120)
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 50
        return layout
    }
}

extension FirstTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoArray.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.reuseId,
            for: indexPath
        ) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .clear
        guard let currentUrl = photoArray[indexPath.item].urlO else { return cell }
        cell.image.sd_setImage(with: URL(string: currentUrl), placeholderImage: nil, options: [.progressiveLoad])
return cell
    }
}

extension FirstTabViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select", indexPath.item)

        let productImageViewController = ProductImageViewController()

        navigationController?.pushViewController(productImageViewController, animated: true)
        guard let currentUrlString = photoArray[indexPath.item].urlO else { return }
        guard let currentUrl = URL(string: currentUrlString) else { return }
        DispatchQueue.global(qos: .utility).async {
            let imageData = try? Data(contentsOf: currentUrl)
            do {
                DispatchQueue.main.async {
                    guard let imageData = imageData else { return }
                    productImageViewController.productImage.image = UIImage(data: imageData)
                }
            }
        }
    }
}
