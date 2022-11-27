//
//  DetailViewController.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import UIKit

// MARK: - Constants

fileprivate enum Constants {
    static let spacing: CGFloat = 16
    static let inset = UIEdgeInsets(all: 8)
    static let subtitleSize: CGFloat = 12
    static let classNameSize: CGFloat = 10
    static let lineLimit: Int = 5
}

final class DetailViewController<T: Model>: UIViewController {
    
    // MARK: - Properties
    
    private let item: T
    
    // MARK: - Init
    
    init(item: T) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        buildUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func buildUI() {
        let content = UIStackView.vertical.addArrangedSubviews(
            UILabel().update{
                $0.text = item.title
            },
            UILabel().update{
                $0.text = item.subtitle
                $0.font = UIFont.systemFont(ofSize: Constants.subtitleSize, weight: .light)
                $0.numberOfLines = Constants.lineLimit
            },
            UILabel().update {
                $0.text = String(describing: type(of:item))
                $0.font = UIFont.systemFont(ofSize: Constants.classNameSize, weight: .light)
                $0.numberOfLines = Constants.lineLimit
            }
        )
        
        content.distribution = .fillProportionally
        content.spacing = Constants.spacing
        
        NSLayoutConstraint.addWithSafeArea(content,
                                           to: view,
                                           inset: Constants.inset)
    }
}
