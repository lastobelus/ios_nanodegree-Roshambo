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
    if match.result == .Tie {
      return "It's a tie!"
    }

    // Here we build up the results message "RockCrushesScissors. You Win!" etc.
    return match.winner.description + " " + victoryModeString( match.winner ) + " " + match.loser.description + ". " + resultString()
  }

  func resultString() -> String {
    switch match.result {
    case .PlayerOne:
      return "You Win!"
    case .PlayerTwo:
      return "You Lose!"
    case .Tie:
      return "It's a tie."
    }
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


    if match.result == .Tie {
      name = "itsATie"
    } else {
      switch ( match.winner ) {
      case .Rock:
        name = "RockCrushesScissors"
      case .Paper:
        name = "PaperCoversRock"
      case .Scissors:
        name = "ScissorsCutPaper"
      }
    }

    return UIImage( named: name )!
  }

  func imageForPlayerOne() -> UIImage {
    return UIImage( named: imageNameForGesture(match.p1) )!
  }

  func imageForPlayerTwo() -> UIImage {
    return UIImage( named: imageNameForGesture(match.p2) )!
  }

  func imageNameForGesture( gesture: RPS ) -> String {
    switch ( gesture ) {
    case .Rock:
      return "rock"
    case .Scissors:
      return "scissors"
    case .Paper:
      return "paper"
    }
  }

}
