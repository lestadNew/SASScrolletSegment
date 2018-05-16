//
//  ViewController.swift
//  SASScrolletSegment
//
//  Created by lestadNew on 05/16/2018.
//  Copyright (c) 2018 lestadNew. All rights reserved.
//

import UIKit
import SASScrolletSegment

class ViewController: UIViewController {

    @IBOutlet weak var segmentsScrollView: SASSegmentsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change fonts
        segmentsScrollView.fontsText = UIFont.systemFont(ofSize: 15.0)
        //Inserts segments
        segmentsScrollView.insertToScrollSegments(title: "TEst11111311423412341234", index: 0, animated: true)
        segmentsScrollView.insertToScrollSegments(title: "TEst1232315125", index: 1, animated: true)
        segmentsScrollView.insertToScrollSegments(title: "TEst13463146", index: 2, animated: true)
        segmentsScrollView.insertToScrollSegments(title: "TEst1451435134613613461346316", index: 3, animated: true)
        segmentsScrollView.insertToScrollSegments(title: "TEst1341361346", index: 4, animated: true)
        //Selector know when change index in segments controller
        segmentsScrollView.segment.addTarget(self, action: #selector(self.segmentSelected(sender:)), for: .valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func segmentSelected(sender:SASSegmentsView) {
        print("\(segmentsScrollView.segment.selectedSegmentIndex)")
    }

}

