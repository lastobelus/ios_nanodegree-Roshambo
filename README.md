![Alt text](/screenshot.png?raw=true "Screen Shot")

I learned a few extra things along the way:

* I used a custom subclass of UITableViewCell with a nib file, to make it easier to layout the cell. This requires doing:
```Swift
    let twoImageHistoryNib = UINib(nibName: "TwoImageHistoryCell", bundle: nil)
    tableView.registerNib(twoImageHistoryNib, forCellReuseIdentifier: "TwoImageHistory")
```
I put that in `HistoryViewController.viewDidLoad`

* I extracted a `RPSResultPresenter` protocol, and an enum to switch between presenters, so I can switch between cell types using a variable. This also allowed me to remove all display<=>game logic from `ResultViewController` and `HistoryViewController`, leaving only view wiring in those classes.

* To change the size of the image without using hardcoded sizes, I constrained "center vertically", "aspect ratio", and "top space" and bound the top space constraint to an `IBOutlet`. Then I can vary the constant of that constraint programmatically to change the image size as a factor of the row height. I ran on different phone and ipad sizes to check that the rows looked good on all of them.

* to adjust the z-index of winning/losing images, I used `self.contentView.bringSubviewToFront(view)` and `self.contentView.sendSubviewToBack(view)`

* I embedded the `HistoryViewController` in a `UINavigationController` so that the top nav would be canonical.