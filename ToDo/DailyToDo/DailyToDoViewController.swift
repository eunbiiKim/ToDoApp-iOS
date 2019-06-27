//
//  ViewController.swift
//  ToDo
//
//  Created by 진재명 on 6/15/19.
//  Copyright © 2019 Busan iOS. All rights reserved.
//

import UIKit

class DailyToDoViewController: UIViewController {

    @IBOutlet var dailyToDoTableView: UITableView!
    var dailyToDoList = [DailyToDoData]()
    let addingButtonTagValue = 100
    
    @objc func addDailyToDo() { }
    
    @objc func checkDailyToDo(_ sender: UIButton) {
  
        print(sender.tag)
        dailyToDoList[sender.tag - addingButtonTagValue].isCheck = !dailyToDoList[sender.tag - addingButtonTagValue].isCheck
        
        sender.checkLabelColor(isCheck: dailyToDoList[sender.tag - addingButtonTagValue].isCheck)
    }
    
    func makeNavigationDefault() {
        self.navigationItem.title = "DailyToDo"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addDailyToDo))
    }
    
    func insertWeekDataInDateLabel() {
        
        guard let thisWeekInfomation = DateTool().findWeek() else {
            return
        }
        
        for index in 1 ... 7 {
            
            if let dateLabel = self.view.viewWithTag(index) as? UILabel {
                dateLabel.text = thisWeekInfomation[index]?.date
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertWeekDataInDateLabel()
        makeNavigationDefault()
        dailyToDoTableView.registerCell()
        dailyToDoTableView.addFooterView()
        dailyToDoTableView.dataSource = self
        dailyToDoTableView.delegate = self
    }
}
extension DailyToDoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyToDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dailyCell = tableView.dequeueReusableCell(withIdentifier: "DailyToDoCell") as? DailyToDoCell  else {
            return UITableViewCell()
        }
        
        dailyCell.checkButton.makeDefaultShape()
        dailyCell.dailyTitle.text = dailyToDoList[indexPath.row].title
        dailyCell.checkButton.tag = indexPath.row + 100
        dailyCell.checkButton.checkLabelColor(isCheck: dailyToDoList[indexPath.row].isCheck)
        dailyCell.checkButton.addTarget(self, action: #selector(checkDailyToDo(_:)), for: .touchUpInside)
        return dailyCell
    }

}
extension DailyToDoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제", handler: {_,_,_ in
            self.dailyToDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        })
   
        return UISwipeActionsConfiguration(actions:[deleteAction])
    }
}
extension UIButton {
    
    func makeDefaultShape() {
        self.layer.cornerRadius = self.bounds.height * 0.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func checkLabelColor(isCheck: Bool) {
        
        if isCheck {
            self.backgroundColor = UIColor(named: "AppleBlue")
        }else{
            self.backgroundColor = .white
        }
    }
    
}
extension UITableView {
    
    func registerCell() {
        let dailyNib = UINib(nibName: "DailyToDoCell", bundle: nil)
        self.register(dailyNib, forCellReuseIdentifier: "DailyToDoCell")
    }
    
    func addFooterView() {
        self.tableFooterView = UIView()
    }
}
