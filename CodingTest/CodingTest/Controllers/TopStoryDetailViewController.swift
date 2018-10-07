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
    
    var topStory : TopStoryDetailsViewModel?
    
    @IBOutlet weak var imageTopstory: UIImageView!
    
    
    @IBOutlet weak var lblDate: UILabel!
    
    
    @IBOutlet weak var lblTittle: UILabel!
    
    @IBOutlet weak var lblAuthor: UILabel!
    
    @IBOutlet weak var ldlDescription: UILabel!
    
    
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
        imageTopstory.imageFromServerURL((topStory?.imageUrl)!,placeHolder: UIImage(named: "placeholder"))
        self.navigationItem.title = topStory?.subSection
        self.lblTittle.text = topStory?.titleText
        self.ldlDescription.text = topStory?.detailsText
        self.lblAuthor.text = topStory?.authorText
        self.lblDate.text = topStory?.dateText
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
