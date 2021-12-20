//
//  ChartViewController.swift
//  Time Visualizer (Charts)
//
//  Created by R on 16/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_ :)))
        gesture.direction = .right
        self.view.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
