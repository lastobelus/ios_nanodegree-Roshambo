//
//  InPlayRPSResultPresenter.swift
//  RockPaperScissors
//
//  Created by Michael Johnston on 24.09.2015.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class InPlayRPSResultPresenter: RPSResultPresenter {
  var match: RPSMatch

  required init( match:RPSMatch) {
    self.match = match
  }

  func messageForMatch() -> String {

    // Handle the tie
    if match.p1 == match.p2 {
      return "It's a tie!"
    }

    // Here we build up the results message "RockCrushesScissors. You Win!" etc.
    return match.winner.description + " " + victoryModeString( match.winner ) + " " + match.loser.description + ". " + resultString()
  }

  func resultString() -> String {
    return match.p1.defeats( match.p2 ) ? "You Win!" : "You Lose!"
  }

  func victoryModeString( gesture: RPS ) -> String {
    switch ( gesture ) {
    case .Rock:
      return "crushes"
    case .Scissors:
      return "cuts"
    case .Paper:
      return "covers"
    }
  }

  func imageForMatch() -> UIImage {

    var name = ""

    switch ( match.winner ) {
    case .Rock:
      name = "RockCrushesScissors"
    case .Paper:
      name = "PaperCoversRock"
    case .Scissors:
      name = "ScissorsCutPaper"
    }

    if match.p1 == match.p2 {
      name = "itsATie"
    }
    return UIImage( named: name )!
  }

}
