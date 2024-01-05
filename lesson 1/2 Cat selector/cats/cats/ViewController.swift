//
//  ViewController.swift
//  cats
//
//  Created by Nika on 1/4/24.
//

import UIKit
import CoreImage


class ViewController: UIViewController {
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var sliderSize: UISlider!
    @IBOutlet weak var filterMode: UISegmentedControl!
    
//    var currentImage: UIImage?
    var currentSize: CGFloat = 1.0
    var currentImage = UIImage(named: "cat_working")!
    var currentFilter = "None"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        первоначальная позиция слайдера, чтобы была реалистичная
        sliderSize.value = Float(currentSize)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func catDidChange(_ sender: Any) {
        // для безопасности
        guard let segmentedControl = sender as? UISegmentedControl else {
                return
            }
        switch (sender as AnyObject).selectedSegmentIndex{
        case 0:
            catImageView.image = UIImage(named: "cat_working")!
            quote.text = "I'm working"
            currentImage = UIImage(named: "cat_working")!
            currentSize = catImageView.frame.size.width
            applyFilter(currentFilter)
        case 1:
            catImageView.image = UIImage(named: "cat_bread")!
            quote.text = "I'm eating"
            currentImage = UIImage(named: "cat_bread")!
            currentSize = catImageView.frame.size.width
            applyFilter(currentFilter)
        case 2:
            catImageView.image = UIImage(named: "cat_sleep")!
            quote.text = "I'm sleeping"
            currentImage = UIImage(named: "cat_sleep")!
            currentSize = catImageView.frame.size.width
            applyFilter(currentFilter)
        default:
            break
        }
    }
    
    //    slider - change size
    @IBAction func sliderChangeSize(_ sender: Any) {
        let scale = CGFloat(sliderSize.value)
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        currentSize = currentSize * scale
        catImageView.transform = transform
    }
    
    //    filter
    @IBAction func filterChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            catImageView.image = currentImage
            currentFilter = "None"
        case 1:
            applyFilter("CICMYKHalftone")
            currentFilter = "CICMYKHalftone"
        case 2:
            applyFilter("CIColorInvert")
            currentFilter = "CIColorInvert"
        default:
            break
        }
    }
    
    func applyFilter(_ filterName: String){
        guard filterName != "None" else {
            return
        }
        let filter = CIFilter(name: filterName)
        let beginImage = CIImage(image:currentImage)
        filter?.setValue(beginImage, forKey: kCIInputImageKey)
        let newImage = UIImage(ciImage: (filter?.outputImage)!)
        catImageView.image = newImage
        catImageView.frame.size.width = currentSize
    }
    
}
