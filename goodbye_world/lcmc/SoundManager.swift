//
//  SoundManager.swift
//  goodbye_world
//
//  Created by Lucas campos de morais cavalcanti on 13/10/22.
//

import Foundation
import AVFoundation

class SoundManager {
    static let Instance = SoundManager(); // Singleton
    
    var musicPlayer : AVAudioPlayer?;
    var sfxPlayer : AVAudioPlayer?;
    
    func playMusic(file_name:String , type:String="mp3") {
        if let bundle = Bundle.main.path(forResource: file_name, ofType: type) {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                musicPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let musicPlayer = musicPlayer else { return }
                musicPlayer.numberOfLoops = -1
                musicPlayer.prepareToPlay()
                musicPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopMusic() {
        guard let musicPlayer = musicPlayer else { return }
        musicPlayer.stop()
    }
    
    func playSfx(_ file_name:String , _ type:String="mp3", _ loop:Int=1) {
        if let bundle = Bundle.main.path(forResource: file_name, ofType: type) {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                sfxPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let sfxPlayer = sfxPlayer else { return }
                sfxPlayer.numberOfLoops = loop //-1 == infinite
                sfxPlayer.prepareToPlay()
                sfxPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}

