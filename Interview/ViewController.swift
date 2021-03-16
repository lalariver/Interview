//
//  ViewController.swift
//  Interview
//
//  Created by lawliet on 2021/3/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        
        setCollectionViewUI()
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    // MARK: - CollectionViewUI
    private func setCollectionViewUI() {
        collectionView.backgroundColor = .clear
        
        let layout = createLayout()
        collectionView.collectionViewLayout = layout
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
}

// MARK: - CollectionViewDelegate, DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 49
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.button.setTitle("\(indexPath.row + 1)", for: .normal)
        cell.button.tag = indexPath.row
        
        let color = viewModel.getColor(row: indexPath.row)
        cell.updateWithModel(model: color)
        cell.button.addTarget(self, action: #selector(buttonPress(button:)), for: .touchUpInside)

        return cell
    }
    
    @objc private func buttonPress(button: UIButton) {
        button.isSelected.toggle()
        if button.isSelected {
            let color = viewModel.getColor(row: button.tag)
            button.backgroundColor = color.selectColor
            button.tintColor = .clear
        } else {
            let color = viewModel.getColor(row: button.tag)
            button.setTitleColor(color.titleColor, for: .normal)
            button.backgroundColor = color.backgroundColor
        }
    }
}
