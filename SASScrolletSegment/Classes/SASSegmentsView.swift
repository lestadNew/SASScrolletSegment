//
//  SASSegmentsView.swift
//  Test
//
//  Created by admin on 15.05.2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

@IBDesignable
public class SASSegmentsView: UIView {
    
    @IBOutlet private var contensView: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet public weak var segment: UISegmentedControl!
    
    @IBOutlet private weak var layoutUnderlineHeight: NSLayoutConstraint!
    @IBOutlet private weak var layoutHeghtSegmentsController: NSLayoutConstraint!
    @IBOutlet private weak var layoutLadingSpaseUnderlineView: NSLayoutConstraint!
    @IBOutlet private weak var layoutWidhtUnderlineView: NSLayoutConstraint!
    @IBOutlet private weak var underlineView: UIView!
    
    private var space:CGFloat = 0.0
    
    public var fontsText: UIFont = UIFont.systemFont(ofSize: 10.0){
        didSet{
            segment.setTitleTextAttributes([
                NSAttributedStringKey.font : fontsText,
                NSAttributedStringKey.foregroundColor: colorUnSelectedSegment
                ], for: .normal)
            segment.setTitleTextAttributes([
                NSAttributedStringKey.font : fontsText,
                NSAttributedStringKey.foregroundColor: colorSelectedSegment
                ], for: .selected)
            //self.layoutIfNeeded()
            updateUI()
        }
    }
    
    let nibName:String = "SASSegmentsView"
    var view: UIView!
    
    // MARK: Init
    public override func layoutSubviews() {
        super.layoutSubviews()
        //updateUI()
    }
    
    public override init(frame: CGRect){
        super.init(frame:frame)
        commonInit()
        self.segment.removeAllSegments()
        setupLayer()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        self.segment.removeAllSegments()
        setupLayer()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupLayer()
        updateUI()
    }
    
    /*public override func prepareForInterfaceBuilder() {
        setupLayer()
    }*/
    
    //MARK: Actions
    
    @IBAction private func actionChangeSegment(_ sender: Any) {
        var sizeAll:CGFloat = 0.0
        for index in 0..<self.segment.selectedSegmentIndex {
            let string = self.segment.titleForSegment(at: index)
            sizeAll = sizeAll + string!.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: fontsText]).width + space
        }
        
        let string = self.segment.titleForSegment(at: self.segment.selectedSegmentIndex)
        
        UIView.animate(withDuration: 0.3) {
            self.layoutLadingSpaseUnderlineView.constant = sizeAll
            
            self.layoutWidhtUnderlineView.constant =  string!.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: self.fontsText]).width + self.space
            
            self.layoutIfNeeded()
        }
        
        let thePosition = CGRect.init(x: sizeAll, y: 0, width: string!.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: fontsText]).width + space, height: 5.0)
        let container = CGRect.init(x:scrollView.contentOffset.x, y:scrollView.contentOffset.y, width:scrollView.frame.size.width, height:scrollView.frame.size.height);
        if(!container.contains(thePosition))
        {
            if sizeAll + scrollView.frame.size.width > segment.frame.size.width{
                let topOffset = CGPoint(x: segment.frame.size.width - scrollView.frame.size.width, y: 0)
                self.scrollView.setContentOffset(topOffset, animated: true)
            }else{
                let topOffset = CGPoint(x: sizeAll, y: 0)
                self.scrollView.setContentOffset(topOffset, animated: true)
            }
        }
    }
    
    //MARK: IBInspectable
    
    @IBInspectable var viewBackgroundColor: UIColor = UIColor.red {
        didSet {
            backgroundColor = viewBackgroundColor
        }
    }
    
    @IBInspectable var underlineViewBackgroundColor: UIColor = UIColor.red {
        didSet {
            backgroundColor = underlineViewBackgroundColor
        }
    }
    
    @IBInspectable var colorSelectedSegment: UIColor = UIColor.red {
        didSet {
            segment.setTitleTextAttributes([
                NSAttributedStringKey.font : fontsText,
                NSAttributedStringKey.foregroundColor: colorSelectedSegment
                ], for: .selected)
        }
    }
    
    @IBInspectable var colorUnSelectedSegment: UIColor = UIColor.red {
        didSet {
            segment.setTitleTextAttributes([
                NSAttributedStringKey.font : fontsText,
                NSAttributedStringKey.foregroundColor: colorUnSelectedSegment
                ], for: .normal)
        }
    }
    
    @IBInspectable var heightSegments: CGFloat = 40 {
        didSet {
            layoutHeghtSegmentsController.constant = heightSegments
        }
    }
    
    @IBInspectable var heightUnderlineLine: CGFloat = 3 {
        didSet {
            layoutUnderlineHeight.constant = heightUnderlineLine
        }
    }
}

extension SASSegmentsView{
    
    public func insertToScrollSegments(title:String,index:Int,animated:Bool){
        segment.insertSegment(withTitle: title, at: index, animated: animated)
        updateUI()
    }
    
    public func removeFromScrollSegments(index:Int,animated:Bool){
        segment.removeSegment(at: index, animated: animated)
        updateUI()
    }
    
    private func updateUI(){
        self.setNeedsLayout()
        
        if self.segment.numberOfSegments > 0{
            if segment.selectedSegmentIndex == -1 {
                segment.selectedSegmentIndex = 0
            }
            var sizeAll:CGFloat = 0.0
            for index in 0..<self.segment.numberOfSegments{
                let string = self.segment.titleForSegment(at: index)
                sizeAll = sizeAll + string!.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: fontsText]).width
            }
            
            space = (segment.frame.size.width - sizeAll) / CGFloat(self.segment.numberOfSegments)
            
            let string = segment.titleForSegment(at: segment.selectedSegmentIndex)
            layoutWidhtUnderlineView.constant =  string!.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: fontsText]).width + space
        }
    }
    
    private func setupLayer() {
        backgroundColor = viewBackgroundColor
        underlineView.backgroundColor = underlineViewBackgroundColor
        segment.setTitleTextAttributes([
            NSAttributedStringKey.font : fontsText,
            NSAttributedStringKey.foregroundColor: colorUnSelectedSegment
            ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedStringKey.font : fontsText,
            NSAttributedStringKey.foregroundColor: colorSelectedSegment
            ], for: .selected)
        
        layoutHeghtSegmentsController.constant = heightSegments
        layoutUnderlineHeight.constant = heightUnderlineLine
    }
    
    private func commonInit(){
        
        view = UINib(nibName: self.nibName, bundle:Bundle(for:type(of: self))).instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(self.view)
        
        //Bundle.main.loadNibNamed("SASSegmentsView", owner: SASSegmentsView.self, options: nil)
        //addSubview(contensView)
        
        segment.backgroundColor = .clear
        segment.tintColor = .clear
        
        segment.setTitleTextAttributes([
            NSAttributedStringKey.font : fontsText,
            NSAttributedStringKey.foregroundColor: colorUnSelectedSegment
            ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedStringKey.font : fontsText,
            NSAttributedStringKey.foregroundColor: colorSelectedSegment
            ], for: .selected)
        
        self.layoutIfNeeded()
    }
}

