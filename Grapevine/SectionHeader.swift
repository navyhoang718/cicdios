//
//  SectionHeader.swift
//  Grapevine
//
//  Created by asto_vn2 on 9/23/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import Foundation
import UIKit
class SectionHeader : UICollectionReusableView {
  var label: UILabel = {
    let label: UILabel = UILabel()
    label.textColor = .red
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.sizeToFit()
    return label
  }()
 
  //when create layout via xib
//  override func awakeFromNib() {
//    super.awakeFromNib()
//    // Initialization code
//  }
  
//  
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//
//    addSubview(label)
//
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.centerXAnchor.constraint(equalTo: self.pa).isActive = true
//    label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
//    label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
}
