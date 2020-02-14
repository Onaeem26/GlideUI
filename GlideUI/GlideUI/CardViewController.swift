//
//  CardViewController.swift
//  GlideUI
//
//  Created by Osama Naeem on 24/10/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, Glideable {
    var headerHeight: CGFloat = 0
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        tableView.topAnchor.constraint(equalTo:  view.topAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomConstraint.priority = UILayoutPriority(rawValue: 750)
        bottomConstraint.isActive = true
        
    }
    
}

extension CardViewController: UITableViewDataSource, UITableViewDelegate {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
      }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "😀 \(indexPath.row + 1)"
        return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
