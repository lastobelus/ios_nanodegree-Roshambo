//
//  RockPaperScissorsViewController.swift
//  RockPaperScissors
//
//  Created by Gabrielle Miller-Messner on 10/30/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {

  @IBOutlet weak var rockButton: UIButton!
  @IBOutlet weak var paperButton: UIButton!
  @IBOutlet weak var scissorsButton: UIButton!

  enum SegueMode {
    case Manual, Triggered, Auto
  }
  let segueMode:SegueMode = .Auto

  var match: RPSMatch!

  // Here is the history array which will hold the results of each match that is played in a session.
  var history = [RPSMatch]()

  @IBAction func makeYourMove(sender: UIButton) {

    // The RPS enum holds a player's move
    switch (sender) {
    case self.rockButton:
      throwDown(RPS.Rock)

    case self.paperButton:
      throwDown(RPS.Paper)

    case self.scissorsButton:
      throwDown(RPS.Scissors)

    default:
      assert(false, "An unknown button is invoking makeYourMove()")
    }
  }

  func throwDown(playersMove: RPS)
  {
    // The RPS enum generates the opponent's move
    let computersMove = RPS()

    // The RPSMatch struct stores the results of a match
    self.match = RPSMatch(p1: playersMove, p2: computersMove)

    // Here we add a match to the history array.
    history.append(match)

    //Here are the 3 ways of presenting a View Controller

    // 1st Way: Programmatic View Controller Presentation
    if (playersMove == RPS.Rock) {
      // Get the storyboard and ResultViewController
      let storyboard = UIStoryboard (name: "Main", bundle: nil)
      let resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
      resultVC.match = self.match
      if let navigationController = self.navigationController {
        navigationController.pushViewController(resultVC, animated: true)
      }
    }

      // 2nd Way: Code plus Segue
    else if (playersMove == RPS.Paper) {
      performSegueWithIdentifier("throwDownPaper", sender: self)
    }

    // 3rd Way: Segue Only, No code!
    // But don't forget to implement prepareForSegue.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    switch segue.identifier! {
    case "TriggeredHistorySegue", "AutoHistorySegue":
      let navigationController = segue.destinationViewController as! UINavigationController
      let historyController = navigationController.topViewController as! HistoryViewController
      historyController.history = history
    default:
      let controller = segue.destinationViewController as! ResultViewController
      controller.match = self.match
    }
    //Notice that this code works for both Scissors and Paper
  }

  @IBAction func showHistory(sender: AnyObject) {
    //TODO: Present HistoryViewController
    switch segueMode {
    case .Manual:
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let historyViewController = storyboard.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
      historyViewController.history = history
      let navigationController = UINavigationController(rootViewController: historyViewController)
      presentViewController(navigationController, animated: true, completion: nil)
    case .Triggered:
      print("Triggered Segue")
      performSegueWithIdentifier("TriggeredHistorySegue", sender: self)
    case .Auto:
      print("Auto Segue")
    }
  }

}