

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderTarget: UISlider!
    
    
    @IBOutlet weak var mySlider: UISlider!
   
    @IBOutlet weak var labScore: UILabel!
    
    @IBOutlet weak var labRound: UILabel!
    
    
    var tarValue :Int = 0
    
    var currValue :Int = 0
    
    var theScore :Int32 = 0
    
    var theRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onCreateSlider()
        
        onUpdate();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderChange(sender: AnyObject) {
        
        currValue = lroundf(mySlider!.value)
        
    }
    
    @IBAction func onAlert(sender: AnyObject) {
        
        var diff :Int = currValue - tarValue
        
        if diff < 0 {
            diff *= -1
        }
        
        let score = 100 - diff
        
        theScore += score
        var message:String
        switch(score){
        
        case 100:
            message = "最高だ，スコアは：\(score)"
        
        case 90..<100:
            message = "惜しいな、スコアは：\(score)"
        
        case 80..<90:
            message = "スコアは：\(score)、まだまだ"
        default:
            message = "残念，スコアはただの \(score) "
            
        }
        let alert = UIAlertView(title: "", message: message, delegate: self, cancelButtonTitle: "続き")
        alert.show()
    }
    
    func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int) {
        onUpdate()
        
    }
    
    @IBAction func reSet(sender: AnyObject) {
        
        currValue = 50
        
        theRound = 0
        theScore = 0
        
        onUpdate()
    }
    
    @IBAction func onShowInfo(sender: AnyObject) {
        
        let controller = InfoViewController (nibName: "InfoViewController", bundle: nil)
        
        controller.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    func onUpdate(){
        
        tarValue = Int(1 + arc4random()%100)
        
        sliderTarget!.value = Float(tarValue)
      
        labScore!.text = String(self.theScore)
        
        theRound++
        
        labRound!.text = String(self.theRound)
        
        mySlider!.value = 50
    }
    
    func onCreateSlider(){
        
        let imgThumNormal = UIImage(named: "SliderThumb-Normal")
        self.mySlider!.setThumbImage(imgThumNormal, forState: UIControlState.Normal)
        self.sliderTarget!.setThumbImage(imgThumNormal, forState: UIControlState.Normal)
        
        
        let imgThumbHighlighter = UIImage(named: "SliderThumb-Highlighted")
        self.mySlider!.setThumbImage(imgThumbHighlighter, forState: UIControlState.Highlighted)
        self.sliderTarget!.setThumbImage(imgThumbHighlighter, forState: UIControlState.Highlighted)
        
        
        let imgTrackLeft = UIImage(named: "SliderTrackLeft")
        
        let imgLeft = imgTrackLeft!.stretchableImageWithLeftCapWidth(14, topCapHeight: 0)
        self.mySlider!.setMinimumTrackImage(imgLeft, forState: UIControlState.Normal)
        self.sliderTarget!.setMinimumTrackImage(imgLeft, forState: UIControlState.Normal)
        
      
        let imgTrackRight = UIImage(named: "SliderTrackRight")
      
        let imgRight = imgTrackRight!.stretchableImageWithLeftCapWidth(14, topCapHeight: 0)
        self.mySlider!.setMaximumTrackImage(imgRight, forState: UIControlState.Normal)
        self.sliderTarget!.setMaximumTrackImage(imgRight, forState: UIControlState.Normal)
    }

}

