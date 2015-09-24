//
//  BasicHistoryRPSResultPresenter.swift
//  RockPaperScissors
//
//  Created by Michael Johnston on 24.09.2015.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation

class BasicHistoryRPSResultPresenter: InPlayRPSResultPresenter {
  override func messageForMatch() -> String {
    // Handle the tie
    switch match.result {
    case .PlayerOne:
      return "Player"
    case .PlayerTwo:
      return "Computer"
    case .Tie:
      return "Tie"
    }
  }
}