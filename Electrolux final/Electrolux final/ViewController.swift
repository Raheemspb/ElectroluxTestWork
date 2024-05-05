//
//  ViewController.swift
//  Electrolux final
//
//  Created by Рахим Габибли on 05.05.2024.
//

import UIKit
import SnapKit
import PureLayout

final class FirstTabViewController: UIViewController {

    private var searchBar: UISearchBar!
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
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
        //        collectionView.backgroundColor = .magenta
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
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension FirstTabViewController: UICollectionViewDelegate {
    
}

