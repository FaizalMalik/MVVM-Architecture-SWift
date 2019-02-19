//
//  TopStoryDetailViewController.swift
//  CodingTest
//
//  Created by faizal on 07/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

class TopStoryDetailViewController: UIViewController {
    
    var topStoryViewModel : TopStoryDetailsViewModel?
    
    @IBOutlet weak var imageTopstory: UIImageView!
    
    
    @IBOutlet weak var lblDate: UILabel!
    
    
    @IBOutlet weak var lblTittle: UILabel!
    
    @IBOutlet weak var lblAuthor: UILabel!
    
    @IBOutlet weak var ldlDescription: UILabel!
    
    
    @IBOutlet weak var btnSeeMore: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        //updateUI
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI()  {
        self.btnSeeMore.layer.cornerRadius = 5
        self.navigationController?.navigationBar.topItem?.title = ""
        
        imageTopstory.imageFromServerURL((topStoryViewModel?.imageUrl)!,placeHolder: UIImage(named: "placeholder"))
        self.navigationItem.title = topStoryViewModel?.subSection
        self.lblTittle.text = topStoryViewModel?.titleText
        self.ldlDescription.text = topStoryViewModel?.detailsText
        self.lblAuthor.text = topStoryViewModel?.authorText
        self.lblDate.text = topStoryViewModel?.dateText
        
        
    }
    
    @IBAction func seeMoreAction(_ sender: Any) {
        
    self.performSegue(withIdentifier: SegueIdentifier.seeMoreSegue, sender: nil)

    }
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == SegueIdentifier.seeMoreSegue {
            
            let destinationVc = segue.destination as! WebViewController
            destinationVc.url = topStoryViewModel?.seeMoreLink
            
        }
     }
    
    
}
