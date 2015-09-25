//
//  TwoImageHistoryCell.swift
//  RockPaperScissors
//
//  Created by Michael Johnston on 24.09.2015.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class TwoImageHistoryCell: UITableViewCell {

  @IBOutlet weak var winner: UILabel!
  @IBOutlet weak var playerOneImage: UIImageView!
  @IBOutlet weak var playerTwoImage: UIImageView!

  @IBOutlet weak var playerImageSpacing: NSLayoutConstraint!
  @IBOutlet weak var playerOneMargin: NSLayoutConstraint!
  @IBOutlet weak var playerTwoMargin: NSLayoutConstraint!

  var result: RPSMatch.Result!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

  func arrangeViewForResult() {
    if let result = result {
      switch result {
      case .PlayerOne:
        print("PlayerOne")
        playerImageSpacing.constant = -10
        winnerize(playerOneImage, direction: 1, margin: playerOneMargin)
        loserize(playerTwoImage, margin: playerTwoMargin)
      case .PlayerTwo:
        playerImageSpacing.constant = -10
        loserize(playerOneImage, margin: playerOneMargin)
        winnerize(playerTwoImage, direction: -1, margin: playerTwoMargin)
      case .Tie:
        playerImageSpacing.constant = 2
        loserize(playerOneImage, margin: playerOneMargin)
        loserize(playerTwoImage, margin: playerTwoMargin)
      }
    }
  }

  func loserize(view: UIView, margin: NSLayoutConstraint) {
    self.contentView.sendSubviewToBack(view)
    let layer = view.layer
    layer.shadowOpacity = 0.0;
    margin.constant = 0
  }

  func winnerize(view: UIView, direction: Int, margin: NSLayoutConstraint) {
    self.contentView.bringSubviewToFront(view)
    let layer = view.layer
    layer.shadowColor = UIColor.blackColor().CGColor
    layer.shadowOffset = CGSize(width: 4*direction, height: 0)
    layer.shadowOpacity = 0.7
    layer.shadowRadius = 3
    margin.constant = -5
  }
}
