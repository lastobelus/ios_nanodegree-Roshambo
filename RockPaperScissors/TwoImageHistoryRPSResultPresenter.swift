//
//  TwoImageHistoryRPSResultPresenter.swift
//  RockPaperScissors
//
//  Created by Michael Johnston on 24.09.2015.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation

class TwoImageHistoryRPSResultPresenter: InPlayRPSResultPresenter {
  override func messageForMatch() -> String {
    // Handle the tie
    if match.p1 == match.p2 {
      return "Tie"
    } else {
      return match.p1.defeats(match.p2) ? "Player" : "Computer"
    }
  }
}