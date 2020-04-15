//
//  ViewController.swift
//  Play
//
//  Created by kevin chiang on 2020/3/5.
//  Copyright © 2020 Kvn CCCC. All rights reserved.
//
//  參考: https://medium.com/modernnerd-code/how-to-make-a-custom-image-cropper-with-swift-3-c0ec8c9c7884

import UIKit

class ViewController: UIViewController {
    
    // Properties
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var cropAreaView: UIView!
    
    var cropArea: CGRect {
        get{
            let factor = imgView.image!.size.width/view.frame.width
            let scale = 1/scrollView.zoomScale
            let imageFrame = imgView.imageFrame()
            let x = (scrollView.contentOffset.x + cropAreaView.frame.origin.x - imageFrame.origin.x) * scale * factor
            let y = (scrollView.contentOffset.y + cropAreaView.frame.origin.y - imageFrame.origin.y) * scale * factor
            let width = cropAreaView.frame.size.width * scale * factor
            let height = cropAreaView.frame.size.height * scale * factor
            return CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    // UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue", let vc = segue.destination as? CroppedImageVC {
            
            let croppedCGImage = imgView.image?.cgImage?.cropping(to: cropArea)
            let croppedImage = UIImage(cgImage: croppedCGImage!)
            vc.image = croppedImage
        }
    }
    
    // Actions
    
    @IBAction func onClickBtnCrop(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: nil)
    }
    
}

extension ViewController: UIScrollViewDelegate {
    
    // UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
    
}
