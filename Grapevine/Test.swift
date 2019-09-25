//
//  Test.swift
//  Grapevine
//
//  Created by asto_vn2 on 9/23/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  GridViewExampleApp
//
//  Created by Chandimal, Sameera on 12/22/17.
//  Copyright © 2017 Pearson. All rights reserved.
//

import UIKit

class Test : UIViewController{
  
  
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  let dataArray = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG"]
  
  var estimateWidth = 160.0
  var cellMarginSize = 16.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set Delegates
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    
    // Register cells
    self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
//    self.collectionView.register(NotifyCell.self, forCellWithReuseIdentifier: "NotifyCell")
    self.collectionView.register(UINib(nibName: "NotifyCell", bundle: nil), forCellWithReuseIdentifier: "NotifyCell")

    // SetupGrid view
    self.setupGridView()
    
//    self.collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")

//    self.collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
    self.collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forSupplementaryViewOfKind : UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryCell")
     self.collectionView.register(UINib(nibName: "LoadMoreCell", bundle: nil), forSupplementaryViewOfKind : UICollectionElementKindSectionFooter, withReuseIdentifier: "LoadMoreCell")
//     self.collectionView.register(Footer.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
    
    //set padding content in colectionView
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    let width = UIScreen.main.bounds.width
//    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    layout.itemSize = CGSize(width: width / 2, height: width / 2)
//    layout.minimumInteritemSpacing = 0
//    layout.minimumLineSpacing = 0
//    collectionView!.collectionViewLayout = layout
      collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    self.setupGridView()
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  
  func setupGridView() {
    let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
    flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
    flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
  }
}

extension Test: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    }else if section == 1 || section == 2 {
      return 4
    }else {
      return 3
    }
  }
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let defaultcell : UICollectionViewCell!
    if indexPath.section == 0 ||   indexPath.section == 1 ||   indexPath.section == 2 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
      cell.setData(text: self.dataArray[indexPath.row])
      cell.layer.borderColor = UIColor.gray.cgColor
      cell.layer.borderWidth = 1
      return cell
    }else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotifyCell", for: indexPath) as! NotifyCell
      cell.layer.borderColor = UIColor.gray.cgColor
      cell.layer.borderWidth = 1
      cell.dateLabel.text = "支払い方法の件について、要確認が必要ですね支払い方法の件について、要確認が必要ですね支払い方法の件について、要確認が必要ですね。"
      
//      cell.view.backgroundColor = UIColor.black

      return cell
    }
  }

//  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! SectionHeader
//    header.label.text = "Test title SEction"
//
//    return header
//  }
}

extension Test: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if indexPath.section == 0 {
      return CGSize(width: self.view.frame.size.width - 20 , height: self.view.frame.size.width - 20)
    }else if indexPath.section == 1 || indexPath.section == 2 {
      let width = self.calculateWith()
      return CGSize(width: width, height: width)
    }else {
      
      
      let width = UIScreen.main.bounds.width
      return CGSize(width: width - 20, height: 100)
    }
    
//    let width = self.calculateWith()
//    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 50)

  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width:  self.view.frame.size.width, height: 50)
  }
//padding cell
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    if section != 2 {
      return 5

    }else {
      return 0
    }
  }
  
  func addBorderBottom (parentView : UIView ) {
    let borderBottom = UIView()
    borderBottom.backgroundColor = UIColor(red: 211/255, green: 215/255, blue: 215/255, alpha: 1.0)
    borderBottom.translatesAutoresizingMaskIntoConstraints = false
    parentView.addSubview(borderBottom)
    borderBottom.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0).isActive = true
    borderBottom.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: 0).isActive = true
    borderBottom.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 0).isActive = true
    borderBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }

  func calculateWith() -> CGFloat {
    let estimatedWidth = CGFloat(estimateWidth)
    let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
    
    let margin = CGFloat(cellMarginSize * 2)
    let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
    
    return width
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    switch kind {
    case UICollectionElementKindSectionHeader:
      let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
//      reusableview.label.text = "SectionHeader"
      if indexPath.section == 2 {
        reusableview.name.text = "History"
      }else if indexPath.section == 1 {
        reusableview.name.text = "Recomended"
      }else if indexPath.section == 3 {
        reusableview.name.text = "Notification"
      }
      
//      reusableview.name.textColor = UIColor.red

      
//      let dateLabel : UILabel = {
//        let label = UILabel()
//        label.text = "2019.10.20"
//        label.font = UIFont.systemFont(ofSize: 15)
//        label.numberOfLines = 1
//        label.textColor = UIColor.darkGray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//      }()
//      reusableview.addSubview(dateLabel)
      //do other header related calls or settups
      return reusableview
      
    case UICollectionElementKindSectionFooter:
      let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "LoadMoreCell", for: indexPath) as! LoadMoreCell
      footerView.backgroundColor = UIColor.green
      return footerView
      
    default:  fatalError("Unexpected element kind")
    }
  }
  
  //padding content
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//    return UIEdgeInsets(top: 0, left: 20, bottom: 0 , right: 20)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//    return 0
//  }
}

