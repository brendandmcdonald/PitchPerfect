//
//  PlaybackViewController.swift
//  PitchPerfect
//
//  Created by Brendan McDonald on 11/2/22.
//

import UIKit
import AVFoundation

class PlaybackViewController: UIViewController {
    
    // Outlets for basic controls
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // Outlets for play effects
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    // I probably should rename these to follow my convention and not the Udacity convention
    enum ButtonType: Int {
        case normal = 0, slow, fast, highPitch, lowPitch, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Action
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        // print("Play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
            case .normal: playSound(rate: 1.0)
            case .slow: playSound(rate: 0.5)
            case .fast: playSound(rate: 1.5)
            case .highPitch: playSound(pitch: 1000)
            case .lowPitch: playSound(pitch: -1000)
            case .echo: playSound(echo: true)
            case .reverb: playSound(reverb: true)
            }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        print("Stop button pressed")
        stopAudio()
    }
    
}
