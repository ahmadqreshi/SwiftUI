//
//  ViewController.swift
//  CodeTest
//
//  Created by Ahmad Qureshi on 13/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let date1 = "2022-01-28T14:22:00.000Z"
        let date2 = "2020-06-18T06:50:00.000Z"
//        Optional("2022-01-28T14:22:00.000Z")
//        Optional("2020-06-18T06:50:00.000Z")
//        Optional("2020-09-18T06:49:00.000Z")
        let date3 = "2022-01-29T06:49:00.000Z"
        if date1 > date3 {
            debugPrint("working fine")
        } else if date1 < date3 {
            debugPrint("have to look")
        } else {
            debugPrint("Not working")
        }
    }


}

