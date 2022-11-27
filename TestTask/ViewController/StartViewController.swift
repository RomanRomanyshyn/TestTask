//
//  StartViewController.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import UIKit

// MARK: - Constants

fileprivate enum Constants {
    static let inset: UIEdgeInsets = .init(all: 16)
}

final class StartViewController: UIViewController {
    
    // MARK: - Properties
    
    let usersLoader = RandomUsersLoader(urlSession: URLSession.shared)
    let sportsLoader = SportsLoader(urlSession: URLSession.shared)
    
    
    let sportsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sports", for: .normal)
        return button
    }()
    
    let usersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Users", for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        buildUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        sportsButton.addTarget(self, action: #selector(sportsButtonDidTap), for: .touchUpInside)
        usersButton.addTarget(self, action: #selector(usersButtonDidTap), for: .touchUpInside)
    }
    
    private func buildUI() {
        let content = UIStackView.vertical.addArrangedSubviews(sportsButton, usersButton)
        content.distribution = .fillEqually
        NSLayoutConstraint.add(content, to: view, inset: Constants.inset)
    }
    
    @objc private func usersButtonDidTap() {
        Task {
            do {
                showLoader()
                let response = try await usersLoader.loadUsers()
                show(items: response.results)
            } catch {
                showAlert(error)
            }
        }
    }
    
    @objc private func sportsButtonDidTap() {
        Task {
            do {
                showLoader()
                let response = try await sportsLoader.loadSports()
                show(items: response.data)
            } catch {
                showAlert(error)
            }
        }
    }
    
    private func show<T: Model>(items: [T]) {
        presentedViewController?.dismiss(animated: false) { [weak self] in
            let vc = MainViewController(dataSource: items)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func showAlert(_ error: Error) {
        let alert = UIAlertController(title: "Something went wrong",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        presentedViewController?.dismiss(animated: false) { [weak self] in
            self?.present(alert, animated: true)
        }
    }
    
    private func showLoader() {
        let alert = UIAlertController(title: "Loading..",
                                      message: nil,
                                      preferredStyle: .alert)
        present(alert, animated: true)
    }
}
