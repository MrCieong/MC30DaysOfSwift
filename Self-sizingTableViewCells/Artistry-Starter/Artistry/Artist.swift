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

struct Artist {
  let name: String
  let bio: String
  let image: UIImage
  var works: [Work]
  
  init(name: String, bio: String, image: UIImage, works: [Work]) {
    self.name = name
    self.bio = bio
    self.image = image
    self.works = works
  }
  
  static func artistsFromBundle() -> [Artist] {
    
    var artists = [Artist]()
    
    guard let path = NSBundle.mainBundle().pathForResource("artists", ofType: "json"),
      data = NSData(contentsOfFile: path) else {
        return artists
    }
    
    do {
      let rootObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
      
      guard let artistObjects = rootObject["artists"] as? [[String: AnyObject]] else {
        return artists
      }
      
      for artistObject in artistObjects {
        if let name = artistObject["name"] as? String,
          bio = artistObject["bio"]  as? String,
          imageName = artistObject["image"] as? String,
          image = UIImage(named: imageName),
          worksObject = artistObject["works"] as? [[String : String]]{
          var works = [Work]()
          for workObject in worksObject {
            if let workTitle = workObject["title"],
              workImageName = workObject["image"],
              workImage = UIImage(named: workImageName + ".jpg"),
              info = workObject["info"] {
              works.append(Work(title: workTitle,image: workImage,info: info, isExpanded: false))
            }
          }
          
          let artist = Artist(name: name, bio: bio, image: image, works: works)
          artists.append(artist)
        }
      }
      
    } catch {
      return artists
    }
    
    return artists
  }
  
}