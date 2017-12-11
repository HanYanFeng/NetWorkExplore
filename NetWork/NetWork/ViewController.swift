//
//  ViewController.swift
//  NetWork
//
//  Created by 韩艳锋 on 2017/12/11.
//  Copyright © 2017年 韩艳锋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dataSource = [("Alamofire",AlamofireVC.self)]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let tv = UITableView(frame: self.view.bounds)
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tv)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let classs = dataSource[indexPath.row].1 as UIViewController.Type
        let vc = classs.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

