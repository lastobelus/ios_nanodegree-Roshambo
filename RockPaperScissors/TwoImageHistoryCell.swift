//
//  TwoImageHistoryCell.swift
//  RockPaperScissors
//
//  Created by Michael Johnston on 24.09.2015.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class TwoImageHistoryCell: UITableViewCell {

  struct Preferences {
    let winnerImageOverlap:CGFloat = -10
    let tieImageMargin:CGFloat = 2

    let winnerLeft:CGFloat = 1
    let winnerRight:CGFloat = -1

    let winnerImageMargin:CGFloat = -5
    let loserImageMargin:CGFloat = 0

    let winnerImageShadowX:CGFloat = 3.5
    let winnerImageShadowY:CGFloat = 1.5
    let winnerImageShadowOpacity:Float = 0.7
    let winnerImageShadowRadius:CGFloat = 3

    let winnerImageAlpha:CGFloat = 1.0
    let loserImageAlpha:CGFloat = 0.85

    let playerOneWinColor = UIColor(red: 0.05, green: 0.7, blue: 0.2, alpha: 1.0)
    let playerTwoWinColor = UIColor.redColor()
    let tieColor = UIColor.darkGrayColor()

    static let i = Preferences()
  }

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
        playerImageSpacing.constant = Preferences.i.winnerImageOverlap
        winner.textColor = Preferences.i.playerOneWinColor
        winnerize(playerOneImage, direction: Preferences.i.winnerLeft, margin: playerOneMargin)
        loserize(playerTwoImage, margin: playerTwoMargin)
      case .PlayerTwo:
        playerImageSpacing.constant = Preferences.i.winnerImageOverlap
        winner.textColor = Preferences.i.playerTwoWinColor
        loserize(playerOneImage, margin: playerOneMargin)
        winnerize(playerTwoImage, direction: Preferences.i.winnerRight, margin: playerTwoMargin)
      case .Tie:
        playerImageSpacing.constant = Preferences.i.tieImageMargin
        winner.textColor = Preferences.i.tieColor
        loserize(playerOneImage, margin: playerOneMargin)
        loserize(playerTwoImage, margin: playerTwoMargin)
      }
    }
  }

  func loserize(view: UIView, margin: NSLayoutConstraint) {
    self.contentView.sendSubviewToBack(view)
    let layer = view.layer
    layer.shadowOpacity = 0.0;
    margin.constant = Preferences.i.loserImageMargin
    view.alpha = Preferences.i.loserImageAlpha
  }

  func winnerize(view: UIView, direction: CGFloat, margin: NSLayoutConstraint) {
    self.contentView.bringSubviewToFront(view)
    let layer = view.layer
    layer.shadowColor = UIColor.blackColor().CGColor
    layer.shadowOffset = CGSize(width: Preferences.i.winnerImageShadowX*direction, height: Preferences.i.winnerImageShadowY)
    layer.shadowOpacity = Preferences.i.winnerImageShadowOpacity
    layer.shadowRadius = Preferences.i.winnerImageShadowRadius
    margin.constant = Preferences.i.winnerImageMargin
    view.alpha = Preferences.i.winnerImageAlpha
  }
}
