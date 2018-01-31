//
//  ViewController.swift
//  TextPreviewIOS
//
//  Created by Seongwan Park on 2018. 1. 31..
//  Copyright © 2018년 Seongwan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mFontSizeLabel: UILabel!
    @IBOutlet weak var mFontSizeSlider: UISlider!
    @IBOutlet weak var mLineSpacingLabel: UILabel!
    @IBOutlet weak var mLineSpacingSlider: UISlider!
    @IBOutlet weak var mLatinSingle: UILabel!
    @IBOutlet weak var mLatinSingleHeight: UILabel!
    @IBOutlet weak var mLatinMultiple: UILabel!
    @IBOutlet weak var mLatinMultipleHeight: UILabel!
    @IBOutlet weak var mCJKSingle: UILabel!
    @IBOutlet weak var mCJKSingleHeight: UILabel!
    @IBOutlet weak var mCJKMultiple: UILabel!
    @IBOutlet weak var mCJKMultipleHeight: UILabel!
    
    
    var mFontSize: Int?
    var mLineSpacing: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mFontSize = Int(floor(mFontSizeSlider.value))
        mLineSpacing = Int(floor(mLineSpacingSlider.value))
        
        refreshViews()
    }
    
    func refreshViews() {
        mFontSizeLabel.text = "\(mFontSize!)pt"
        mLineSpacingLabel.text = "\(mLineSpacing!)pt"
        
        // Latin setup
        let engString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis lobortis erat."
        let engAttrString = NSMutableAttributedString(string: engString)
        
        let engStyle = NSMutableParagraphStyle()
        engStyle.lineSpacing = CGFloat(mLineSpacing!) // change line spacing between paragraph like 36 or 48
        
        engAttrString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: CGFloat(mFontSize!)), range: NSRange(location: 0, length: engAttrString.length))
        engAttrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: engStyle, range: NSRange(location: 0, length: engAttrString.length))
        
        mLatinSingle.attributedText = engAttrString
        mLatinMultiple.attributedText = engAttrString
        
        
        // CJK Setup
        let cjkString = "때에, 방황하여도, 안고, 반짝이는 있음으로써 것은 튼튼하며, 것은 것이다. 거선의 열락의 역사를 것이 인생의 황금시대의 청춘을 것이다. 열락의 방황하여도, 끝에 보이는 말이다. 싸인 그들은 붙잡아 끓는 수 청춘의 뼈 이것이다. 무엇을 미인을 커다란 이성은 것이다. 그림자는 얼음에 수 방황하였으며, 할지니, 때문이다. 황금시대를 내는 이성은 들어 간에 창공에 피다. 어디 더운지라 같이, 시들어 작고 발휘하기 생명을 피는 들어 교향악이다. 끓는 새 수 사는가 그들의 스며들어 내는 봄바람이다. 피고 긴지라 돋고, 피다. 행복스럽고 장식하는 피는 그들은 아름다우냐?"
        let cjkAttrString = NSMutableAttributedString(string: cjkString)
        
        let cjkStyle = NSMutableParagraphStyle()
        cjkStyle.lineSpacing = CGFloat(mLineSpacing!) // change line spacing between paragraph like 36 or 48
        
        cjkAttrString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: CGFloat(mFontSize!)), range: NSRange(location: 0, length: cjkAttrString.length))
        cjkAttrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: cjkStyle, range: NSRange(location: 0, length: cjkAttrString.length))
        
        mCJKSingle.attributedText = cjkAttrString
        mCJKMultiple.attributedText = cjkAttrString
        
        // 변형된 각 UILabel 뷰 높이를 찍어줌
        mLatinSingleHeight.text = "\(mLatinSingle.frame.height)pt"
        mLatinMultipleHeight.text = "\(mLatinMultiple.frame.height)pt"
        
        mCJKSingleHeight.text = "\(mCJKSingle.frame.height)pt"
        mCJKMultipleHeight.text = "\(mCJKMultiple.frame.height)pt"
    }
    
    @IBAction func fontSizeChanged(_ sender: UISlider) {
        mFontSize = Int(floor(sender.value))
        refreshViews()
    }
    
    @IBAction func lineSpacingChanged(_ sender: UISlider) {
        mLineSpacing = Int(floor(sender.value))
        refreshViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

