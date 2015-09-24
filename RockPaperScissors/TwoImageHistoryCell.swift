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

  var result: RPSMatch.Result!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

  override func updateConstraints() {
    super.updateConstraints()
    if let result = result {
      switch result {
      case .PlayerOne:
        print("PlayerOne")
      case .PlayerTwo:
        print("PlayerTwo")
      case .Tie:
        print("Tie")
      }
    }
  }
}
