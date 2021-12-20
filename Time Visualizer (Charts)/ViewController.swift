//
//  ViewController.swift
//  Time Visualizer (Charts)
//
//  Created by R on 16/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var hour = [String]()
    
    var dailyTask = [Task]()
    var task = [String]()
    
    var weaklyTask = [WeaklyTask]()
    
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    var dayes = ["Sat","Sun","Mon","Tue","Wed","Thu","Fri"]
    var row = [String]()
    
    var dayActive = true


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task"
        navigationController?.navigationBar.prefersLargeTitles = true

        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_ :)))
        gesture.direction = .left
        self.view.addGestureRecognizer(gesture)

        
        for i in 0...23{
            hour.append("\(i):00")
            task.append("")
            
        }
        
         read()
         row = hour

       // print(dailyTask[2].id)
        
    }
    
    
    @IBAction func changeTime(_ sender: UIBarButtonItem) {
        let sement = sender as! UISegmentedControl
        print(sement.selectedSegmentIndex)
        if sender.tag == 0{
            dayActive = !dayActive
          row = hour
            read()
          
        }else{
            dayActive = !dayActive
          row = dayes
          readweak()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        let svc = storyboard?.instantiateViewController(identifier: "ChartViewController") as! ChartViewController
        navigationController?.pushViewController(svc, animated: true)
        

    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! TableViewCell
        cell.label.text = row[indexPath.row]
        cell.label.textColor = .lightGray
        cell.taskTF.text = task[indexPath.row]
        cell.taskTF.tag = indexPath.row
        cell.taskTF.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: .editingDidEnd)
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func textFieldDidChange(_ TextField:UITextField) {
        let holla = TextField.text!
        print("change",holla,TextField.tag)
        if dayActive{
        create(title: holla, int: TextField.tag)
        }else{
            createweak(title: holla, int: TextField.tag)
        }
    }

}

//Add in ViewDidLoad

//Add New Method



extension ViewController{
    
    func create(title:String,int:Int){
        let taskItem = Task(context: context) // important
        taskItem.dailyTask = title
        taskItem.id = Double(int)
            do {
                try context.save()
                print("create() Success")
                read()
            } catch {
                print("\(error)")
        }
    }
    
    func read(){
        do {
            dailyTask = try context.fetch(Task.fetchRequest())
            for i in dailyTask{
                if !i.dailyTask!.isEmpty{
                 task[Int(i.id)] = i.dailyTask!
                }}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("getTask() Success")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createweak(title:String,int:Int){
        let taskItem = WeaklyTask(context: context) // important
        taskItem.task = title
        taskItem.id = Double(int)
            do {
                try context.save()
                print("create() Success")
                read()
            } catch {
                print("\(error)")
        }
    }
    
    func readweak(){
        do {
            weaklyTask = try context.fetch(WeaklyTask.fetchRequest())
            for i in dailyTask{
                if !i.dailyTask!.isEmpty{
                 task[Int(i.id)] = i.dailyTask!
                }}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("getTask() Success")
        } catch {
            print(error.localizedDescription)
        }
    }
    


    

    
}

