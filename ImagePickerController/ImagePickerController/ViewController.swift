//
//  ViewController.swift
//  ImagePickerController
//
//  Created by zhangjing on 16/7/11.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickCamerItem(sender: AnyObject) {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
//        imagePickerVC.allowsEditing = true
        imagePickerVC.sourceType = .PhotoLibrary
        
        presentViewController(imagePickerVC, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        photoImageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
}
