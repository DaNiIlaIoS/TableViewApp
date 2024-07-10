//
//  ViewController.swift
//  UIKIT6
//
//  Created by Даниил Сивожелезов on 09.07.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var items = Item.mockObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        
        cell.configure(with: item)
        cell.selectionStyle = .none
        
        cell.completion = { [weak self] in
            let secondVC = SecondViewController()
            
            secondVC.title = item.title
            secondVC.titleLabel.text = item.title
            secondVC.mainImage.image = UIImage(named: item.mainImage)
            secondVC.descriptionLabel.text = item.description
            secondVC.photos = item.photos
            
            self?.navigationController?.pushViewController(secondVC, animated: true)
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        370
    }
}
