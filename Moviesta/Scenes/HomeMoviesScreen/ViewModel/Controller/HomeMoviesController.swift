//
//  HomeMoviesController.swift
//  Moviesta
//
//  Created by SODA on 22/01/2022.
//

import UIKit
import RxCocoa
import RxSwift

class HomeMoviesController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var menuCollection: UICollectionView! {
        didSet {
            menuCollection.register(UINib(nibName: MenuCollectionViewCell.cellID, bundle: nil), forCellWithReuseIdentifier:  MenuCollectionViewCell.cellID)
        }
    }
    
    //MARK: ->Properties
    private let disposBag = DisposeBag()
    private let viewModel = HomeViewModel()
    private var selectedIndex = 0
    private var indicatorView = UIView()
    private let indicatorHeight : CGFloat = 5
    private var selectedIndexPath = IndexPath(item: 0, section: 0)
    
    //MARK: ->Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindMenuCollection()
        addBarButton()
    }
    
    //MARK: ->Class Methods
    func bindMenuCollection() {
        menuCollection.delegate = self
        viewModel.menuData.asObservable().bind(to: self.menuCollection.rx.items(
            cellIdentifier: MenuCollectionViewCell.cellID,
            cellType: MenuCollectionViewCell.self)) { index , element, cell in
                print(element.count)
                cell.menuNameLabel.text = element
            }.disposed(by: disposBag)
        menuCollection.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
    }
    
    func addBarButton() {
        
        self.navigationController?.navigationBar.tintColor = AppColor.fontColor.Color
        navigationItem.leftBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonAction))
    }
  
    @objc func searchButtonAction() {
        
    }
    @objc func refreshButtonAction() {
        
    }
}
extension HomeMoviesController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: menuCollection.frame.width / 2.5, height: 100 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

