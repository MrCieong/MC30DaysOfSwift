/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class ArtistDetailViewController: UIViewController {
  
  var selectedArtist: Artist!
  
  let moreInfoText = "Select For More Info >"
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = selectedArtist.name
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 300
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    NSNotificationCenter.defaultCenter().addObserverForName(UIContentSizeCategoryDidChangeNotification, object: nil, queue: NSOperationQueue.mainQueue()) { [weak self] _ in
      self?.tableView.reloadData()
    }
  }
}

extension ArtistDetailViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedArtist.works.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! WorkTableViewCell
    
    
    let work = selectedArtist.works[indexPath.row]
    cell.workTitleLabel.text = work.title
    cell.workImageView.image = work.image
    cell.workTitleLabel.backgroundColor = UIColor(red: 204 / 255, green: 204 / 255, blue: 204 / 255, alpha: 1.0)
    cell.workTitleLabel.textAlignment = .Center
    cell.moreInfoTextView.textColor = UIColor(red: 114 / 255, green: 114 / 255, blue: 114 / 255, alpha: 1.0)
    cell.selectionStyle = .None
    
    cell.moreInfoTextView.textAlignment = work.isExpanded ? .Left : .Center
    cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
    
    
    cell.workTitleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    cell.moreInfoTextView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
    
    return cell
  }
}

extension ArtistDetailViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    guard let cell = tableView.cellForRowAtIndexPath(indexPath) as? WorkTableViewCell else { return }
    
    var work = selectedArtist.works[indexPath.row]
    work.isExpanded = !work.isExpanded
    selectedArtist.works[indexPath.row] = work
    
    cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
    cell.moreInfoTextView.textAlignment = work.isExpanded ? .Left : .Center
    
    UIView.animateWithDuration(0.3) { 
      cell.contentView.layoutIfNeeded()
    }
    
    tableView.beginUpdates()
    tableView.endUpdates()
    
    tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
    
  }
}


