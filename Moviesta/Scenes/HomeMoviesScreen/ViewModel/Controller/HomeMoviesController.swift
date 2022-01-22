//
//  HomeMoviesController.swift
//  Moviesta
//
//  Created by SODA on 22/01/2022.
//
import UIKit
import RxCocoa
import RxSwift
import AVFoundation


class HomeMoviesController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var menuCollection: UICollectionView! {
        didSet {
            menuCollection.register(UINib(nibName: MenuCollectionViewCell.cellID, bundle: nil), forCellWithReuseIdentifier:  MenuCollectionViewCell.cellID)
        }
    }
    
    @IBOutlet weak var catogeryCollection: UICollectionView!{
        didSet {
            catogeryCollection.register(UINib(nibName: CatogeryCell.cellID, bundle: nil), forCellWithReuseIdentifier:  CatogeryCell.cellID)
        }
    }
    
    @IBOutlet weak var moviesCollection: UICollectionView! {
        didSet{
            moviesCollection.register(UINib(nibName: MoviesCell.cellID, bundle: nil), forCellWithReuseIdentifier: MoviesCell.cellID)
        }
    }
    
    
    
    //MARK: ->Properties
    private let disposBag = DisposeBag()
    private let viewModel = HomeViewModel()
    private var selectedIndex = 0
    private var selectedIndexPath = IndexPath(item: 0, section: 0)
 
    
    //MARK: ->Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindMenuCollection()
        addBarButton()
        getCatogery()
        bindCatogeryColletion()
        
    }
    
    //MARK: ->Class Methods
    func bindMenuCollection() {
        menuCollection.delegate = self
        viewModel.menuData.asObservable().bind(to: self.menuCollection.rx.items(
            cellIdentifier: MenuCollectionViewCell.cellID,
            cellType: MenuCollectionViewCell.self)) { index , element, cell in
                cell.menuNameLabel.text = element
            }.disposed(by: disposBag)
        menuCollection.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
    }
    
    func bindCatogeryColletion(){
        catogeryCollection.delegate = self
        viewModel.catogeryPublishSubject.asObservable()
            .bind(to: catogeryCollection.rx.items(
                cellIdentifier: CatogeryCell.cellID,
                cellType: CatogeryCell.self)) { index , element , cell in
                    cell.setupCell(data: element)
                }.disposed(by: disposBag)
    }
    
    func addBarButton() {
        self.navigationController?.navigationBar.tintColor = AppColor.fontColor.Color
        navigationItem.leftBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "text.alignleft"), style:.done, target: self, action: #selector(listButtonAction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonAction))
    }
    
    func getCatogery() {
        viewModel.getCatogeryTitls()
    }
    
    
    @objc func searchButtonAction() {
        
    }
    @objc func listButtonAction() {
        
    }
}

extension HomeMoviesController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case menuCollection:
            return CGSize(width: menuCollection.frame.width / 2.5, height: 100 )
        case catogeryCollection:
            return CGSize(width: catogeryCollection.frame.width / 2.5, height: 100 )
        default:
            print("Error")
        }
        return CGSize()
    }

}
