//
//  ViewController.swift
//  HW 12 ScrollView
//
//  Created by Игорь Крысин on 08.05.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var unknownNum = Int(arc4random_uniform(10)) + 1
    
    lazy var scrolView: UIScrollView = {
        $0.addSubview(scrollContentView)
        $0.backgroundColor = .gray
        return $0
    } (UIScrollView(frame: view.frame))
    
    lazy var scrollContentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray
        $0.addSubview(myImageView)
        $0.addSubview(textLAbel)
        $0.addSubview(segmentedContr)
        $0.addSubview(textLAbel2)
        $0.addSubview(slider)
        $0.addSubview(labelUnderSlider)
        $0.addSubview(labelForValueSlider)
        $0.addSubview(sliderValueBtn)
        return $0
    }(UIView())
    
    lazy var textLAbel: UILabel = {
        $0.text = "fsgsd dsf ыва  выа ываыв ыва sf ыва sd gsdg fsddfsd  fdsfsd fds а вы ва вы авы fdsfsffds dfs dfsdfs dfs ыва авы sd dfs df df ыва dfs fds ыва ва ыва ва авы dfs df dsf sdffsd"
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var textLAbel2: UILabel = {
        $0.text = "fsgsd dsf ыва  выа ываыв ыва sf ыва sd gsdg fsddfsd  fdsfsd fds а вы ва вы авы fdsfsffds dfs dfsdfs dfs ыва авы sd dfs df df ыва dfs fds ыва ва ыва ва авы dfs df dsf sdffsd"
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var myImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        //$0.backgroundColor = .blue
        $0.image = .image2
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var segmentedContr: UISegmentedControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
        
        
        return $0
    }(UISegmentedControl(items: ["1", "2"]))
    
    lazy var slider: UISlider = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.minimumTrackTintColor = .blue
        $0.maximumTrackTintColor = .red
        $0.minimumValue = 1
        $0.maximumValue = 10
        if let image = UIImage(systemName: "01.square") {
            let coloredImage = image.withTintColor(.blue, renderingMode: .alwaysOriginal)
            $0.minimumValueImage = coloredImage
        }
        if let image = UIImage(systemName: "10.square") {
            let coloredImage = image.withTintColor(.red, renderingMode: .alwaysOriginal)
            $0.maximumValueImage = coloredImage
        }
        $0.value = 5
        $0.isContinuous = false
        $0.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
        return $0
    }(UISlider())
    
    lazy var labelUnderSlider: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "я загадал число, угадаешь?"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var labelForValueSlider: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "сейчас ползунок на \(Int(slider.value))"
        $0.textAlignment = .center
        $0.textColor = .green
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return $0
    }(UILabel())
    
    lazy var winnerLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Congrat!!! передвинь ползунок"
        $0.textAlignment = .center
        $0.textColor = .green
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return $0
    }(UILabel())
    
    lazy var sliderValueBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Да", for: .normal)
        $0.addAction(sliderBtnAction, for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var mySwitch: UISwitch = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.onTintColor = .blue
        //$0.backgroundColor = .lightGray
        //$0.center.x = view.center.x
       
        return $0
    }(UISwitch())
    
    private lazy var sliderBtnAction = UIAction { [weak self] action in
        guard let self = self else { return }
        
        if unknownNum == Int(slider.value) {
            self.view.addSubview(self.mySwitch)
            self.view.addSubview(self.winnerLabel)
            
            mySwitch.topAnchor.constraint(equalTo: sliderValueBtn.bottomAnchor, constant: 40).isActive = true
            mySwitch.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: scrollContentView.frame.width / 2 - 20).isActive = true
            mySwitch.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20).isActive = true
            
            winnerLabel.topAnchor.constraint(equalTo: mySwitch.bottomAnchor, constant: 10).isActive = true
            winnerLabel.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20).isActive = true
            winnerLabel.trailingAnchor.constraint(equalTo: mySwitch.trailingAnchor, constant: 20).isActive = true
            
            //winnerLabel.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: -100).isActive = true
        }
       
        //mySwitch.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: -100).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrolView)
        print(unknownNum)
        NSLayoutConstraint.activate([
            scrollContentView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrolView.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrolView.trailingAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrolView.widthAnchor),
            
            myImageView.topAnchor.constraint(equalTo: scrollContentView.topAnchor, constant: 30),
            myImageView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            myImageView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
            myImageView.heightAnchor.constraint(equalToConstant:  400),
            textLAbel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
            textLAbel.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            textLAbel.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
            textLAbel2.topAnchor.constraint(equalTo: textLAbel.bottomAnchor, constant: 20),
            textLAbel2.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            textLAbel2.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
            segmentedContr.topAnchor.constraint(equalTo: textLAbel2.bottomAnchor, constant: 20),
            segmentedContr.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            segmentedContr.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
           
            slider.topAnchor.constraint(equalTo: labelForValueSlider.bottomAnchor, constant: 20),
            slider.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
            labelUnderSlider.topAnchor.constraint(equalTo: segmentedContr.bottomAnchor, constant: 80),
            labelUnderSlider.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            labelUnderSlider.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
            labelForValueSlider.topAnchor.constraint(equalTo: labelUnderSlider.bottomAnchor, constant: 30),
            labelForValueSlider.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            labelForValueSlider.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
            sliderValueBtn.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
            sliderValueBtn.leadingAnchor.constraint(equalTo: slider.leadingAnchor, constant: 20),
            sliderValueBtn.trailingAnchor.constraint(equalTo: slider.trailingAnchor, constant: -20),
            
            
            
            sliderValueBtn.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: -300)
        
        ])
    }
    
    @objc func segmentControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            myImageView.image = .image1
        } else {
            myImageView.image = .image2
        }
    }
    
    
    @objc func sliderAction(_ sender: UISlider) {
        labelForValueSlider.text = "ты думаешь это число \(Int(sender.value)) ?"
    }
}

