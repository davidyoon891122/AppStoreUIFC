//
//  AppViewController.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import UIKit
import SnapKit

final class AppViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCollectionView(frame: .zero)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints{
            $0.height.equalTo(50)
        }
        
        
        [
            featureSectionView,
            rankingFeatureSectionView,
            exchangeCodeButtonView,
            spacingView
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationController()
        self.setupLayout()
    }
    
}

private extension AppViewController {
    func setupNavigationController() {
        self.navigationItem.title = "앱"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func setupLayout() {
        self.view.addSubview(scrollView)
        self.scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        self.contentView.addSubview(self.stackView)
        self.stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
