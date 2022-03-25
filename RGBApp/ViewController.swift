//
//  ViewController.swift
//  RGBApp
//
//  Created by Murmachyov on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!

    @IBOutlet var redLable: UILabel!
    @IBOutlet var greenLable: UILabel!
    @IBOutlet var blueLable: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 15

        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green

        setColor()
        setValue(for: redLable, greenLable, blueLable)

    }
//    изменение цветов слайдера

    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider: setValue(for: redLable)
        case greenSlider: setValue(for: greenLable)
        default: setValue(for: blueLable)
    }

}

    // Цвет вью
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }

    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLable:
                label.text = string(from: redSlider)
            case greenLable:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }

    // Значения RGB
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
