//
//  RPSResultPresenter.swift
//  RockPaperScissors
//
//  Created by Michael Johnston on 24.09.2015.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

protocol RPSResultPresenter {
  init( match:RPSMatch )
  func messageForMatch() -> String
  func imageForMatch() -> UIImage
  func imageForPlayerOne() -> UIImage
  func imageForPlayerTwo() -> UIImage
}
