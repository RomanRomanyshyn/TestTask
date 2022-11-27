//
//  MainViewController.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import UIKit

final class MainViewController<T: Model>: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    private let dataSource: [T]
    private lazy var tableView = makeTableView()
    
    // MARK: - Init
    
    init(dataSource: [T]) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
    }
    
    // MARK: - Private
    
    private func buildUI() {
        NSLayoutConstraint.add(tableView,
                               to: view,
                               inset: .zero)
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.registerCell(UITableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }
    
    // MARK: - Table View DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(class: UITableViewCell.self, for: indexPath) else { return UITableViewCell() }
        
        var content = cell.defaultContentConfiguration()
        let item = dataSource[indexPath.row]
        content.text = item.title
        content.secondaryText = item.subtitle
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource[indexPath.row]
        let vc = DetailViewController(item: item)
        navigationController?.pushViewController(vc, animated: true)
    }
}
