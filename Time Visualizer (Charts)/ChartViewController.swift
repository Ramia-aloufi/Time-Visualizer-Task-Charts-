//
//  ChartViewController.swift
//  Time Visualizer (Charts)
//
//  Created by R on 16/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController,ChartViewDelegate {

    var pieChart = PieChartView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .black
        pieChart.delegate = self
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height / 2)
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        for x in 0..<23{
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
            let set = PieChartDataSet(entries: entries)
            set.colors = ChartColorTemplates.liberty()
            let data = PieChartData(dataSet: set)
            pieChart.data = data
        }
        
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
