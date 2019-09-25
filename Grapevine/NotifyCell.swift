//
//  NotifyCell.swift
//  Grapevine
//
//  Created by asto_vn2 on 9/24/19.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import UIKit

class NotifyCell: UICollectionViewCell {
//when create layout via xib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  
  
  
  private var allConstraints: [NSLayoutConstraint] = []
  private enum Metrics {
    static let padding: CGFloat = 15.0
    static let iconImageViewWidth: CGFloat = 30.0
  }
    @IBOutlet weak var view: UIView!
    
  //When create  layput via code
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    setupViews()
//  }
  
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
  let dateLabel : UILabel = {
    let label = UILabel()
    label.text = "2019.10.20"
    label.font = UIFont.systemFont(ofSize: 15)
    label.numberOfLines = 1
    label.textColor = UIColor.darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let titleLabel : UILabel = {
    let label = UILabel()
    label.text = "Disney Build It: Frozen,Disney Build It: Frozen,Disney Build It: Frozen,Disney Build It: Frozen Testtt"
    label.font = UIFont.systemFont(ofSize: 15)
    label.numberOfLines = 2
    label.textColor = UIColor.darkGray
    label.translatesAutoresizingMaskIntoConstraints = false

    return label
  }()
  let nextButton : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(named: "next-button"), for: .normal)
    bt.backgroundColor = UIColor.red
    bt.translatesAutoresizingMaskIntoConstraints = false
    return bt
  }()
  
  func setupViews() {
    addSubview(dateLabel)
    addSubview(titleLabel)
    addSubview(nextButton)
    //auto layout
    
    
    let metrics = [
      "horizontalPadding": Metrics.padding,
      "iconImageViewWidth": Metrics.iconImageViewWidth,
      "topMargin": 5,
      "bottomMargin": 5,
      "leftMargin": 5,
      "rightMargin": 5]
    
    let views: [String: Any] = [
      "dateLabel": dateLabel,
      "titleLabel": titleLabel,
      "nextButton": nextButton
    ]
    
      allConstraints += NSLayoutConstraint.constraints(
        withVisualFormat: "H:|-leftMargin-[dateLabel]-rightMargin-[nextButton(40)]-rightMargin-|",
        metrics: metrics,
        views: views)
    
      allConstraints += NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-leftMargin-[titleLabel]-rightMargin-[nextButton(40)]-rightMargin-|",
      metrics: metrics,
      views: views)
    allConstraints += NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-[dateLabel]-[titleLabel(>=40)]-|",
      options: [.alignAllLeading,.alignAllTrailing],
      metrics: metrics,
      views: views)
    allConstraints += NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-[nextButton(40)]-|",
      options: [.alignAllCenterY],
      metrics: metrics,
      views: views)
//    allConstraints += NSLayoutConstraint.constraints(
//      withVisualFormat: "H:[titleLabel(>=30)]-[nextButton]-|",
//      metrics: metrics,
//      views: views)
    
    NSLayoutConstraint.activate(allConstraints)
    
    
  }
  
  
  
}




