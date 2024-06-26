//
//  SponsorDateViewController.swift
//  ConneCo
//
//  Created by jaegu park on 6/22/24.
//

import UIKit

protocol SampleProtocol5:AnyObject {
    func timeSend(data: String)
}

class SponsorDateViewController: UIViewController {
    
    @IBOutlet weak var SponsorDateView: UIView!
    @IBOutlet weak var SponsorDatePicker: UIPickerView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var timeLabel2: UILabel!
    @IBOutlet weak var timeLabel3: UILabel!
    
    weak var delegate: SampleProtocol5?
    
    var year = "2024"
    var month = "01"
    var day = "01"
    var year2 = "2024"
    var month2 = "01"
    var day2 = "01"
    
    var pickerYear = ["2030", "2029", "2028", "2027", "2026", "2025", "2024"]
    var pickerMonth = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    var pickerDay = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SponsorDateView.layer.cornerRadius = 10
        SponsorDateView.clipsToBounds = true
        
        cancelButton.layer.cornerRadius = 0
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.black.cgColor
        
        SponsorDatePicker.delegate = self
        SponsorDatePicker.dataSource = self
    }
    
    @IBAction func ok_Button(_ sender: Any) {
        if let text = timeLabel3.text {
            delegate?.timeSend(data: text)
        }
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func back_Button(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

extension SponsorDateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return pickerYear.count
        case 1:
            return pickerMonth.count
        case 2:
            return pickerDay.count
        case 3:
            return pickerYear.count
        case 4:
            return pickerMonth.count
        case 5:
            return pickerDay.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0:
            return "\(pickerYear[row])"
        case 1:
            return "\(pickerMonth[row])"
        case 2:
            return "\(pickerDay[row])"
        case 3:
            return "\(pickerYear[row])"
        case 4:
            return "\(pickerMonth[row])"
        case 5:
            return "\(pickerDay[row])"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label = view as! UILabel?
        if label == nil {
            label = UILabel()
            label?.textColor = UIColor.black
            label?.textAlignment = .center
        }
        switch component {
        case 0:
            label?.text = pickerYear[row] + "년"
            label?.font = UIFont(name:"AppleSDGothicNeo-Bold", size:20)
            return label!
        case 1:
            label?.text = pickerMonth[row] + "월"
            label?.font = UIFont(name:"AppleSDGothicNeo-Bold", size:20)
            return label!
        case 2:
            label?.text = pickerDay[row] + "일"
            label?.font = UIFont(name:"AppleSDGothicNeo-Bold", size:20)
            return label!
        case 3:
            label?.text = pickerYear[row] + "년"
            label?.font = UIFont(name:"AppleSDGothicNeo-Bold", size:20)
            return label!
        case 4:
            label?.text = pickerMonth[row] + "월"
            label?.font = UIFont(name:"AppleSDGothicNeo-Bold", size:20)
            return label!
        case 5:
            label?.text = pickerDay[row] + "일"
            label?.font = UIFont(name:"AppleSDGothicNeo-Bold", size:20)
            return label!
        default:
            return label!
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            year = pickerYear[row]
        case 1:
            month = pickerMonth[row]
        case 2:
            day = pickerDay[row]
        case 3:
            year2 = pickerYear[row]
        case 4:
            month2 = pickerMonth[row]
        case 5:
            day2 = pickerDay[row]
        default:
            timeLabel2.text = "2024 년 01 월 01 일"
            timeLabel3.text = "2024/01/01 - 2024/01/01"
        }
        
        timeLabel3.text = "\(year)/\(month)/\(day) - \(year2)/\(month2)/\(day2)"
        timeLabel2.text = "\(year) 년 \(month) 월 \(day) 일"
    }
}
