//
//  StackViewCell.swift
//  ExpandableCellScrollView
//
//  Created by Vamshi Krishna on 27/04/17.
//  Copyright © 2017 VamshiKrishna. All rights reserved.
//

import UIKit

class StackViewCell: UITableViewCell {
    
    var cellExists:Bool = false
    @IBOutlet weak var openView: UIView!
    @IBOutlet weak var stuffView: UIView!{
        didSet{
            stuffView.isHidden = true
            stuffView.alpha = 0
        }
    }
    
    @IBOutlet weak var open: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func animate(duration:Double, c: @escaping () -> Void){
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModePaced, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: duration, animations: {
                self.stuffView.isHidden = !self.stuffView.isHidden
                if(self.stuffView.alpha == 1){
                    self.stuffView.alpha = 0.5
                }
                else{
                    self.stuffView.alpha = 1
                }
            })
        }, completion: { (finished: Bool) in
            print("Animation Finished")
            c()
        })
    }
    
}
