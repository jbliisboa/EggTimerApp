

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    func playSound() {
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    
}
    //captura o click
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() //invalida toda vez que clik, pra n dar erro no tempo do cronometro
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
        
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            

            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
            
        }
        
        
    
}
}
