//
//  RankingFeatureCollectionViewCell.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import SnapKit
import UIKit

final class RankingFeatureCollectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 70.0 }
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12
        return button
    }()
    
    private var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    func setup(rankingFeature: RankingFeature) {
        self.setupLayout()
        
        titleLabel.text = rankingFeature.title
        descriptionLabel.text = rankingFeature.description
        inAppPurchaseInfoLabel.isHidden = !rankingFeature.isInPurchaseApp
    }
    
}


private extension RankingFeatureCollectionViewCell {
    func setupLayout() {
        [
            self.imageView,
            self.titleLabel,
            self.descriptionLabel,
            self.downloadButton,
            self.inAppPurchaseInfoLabel
        ].forEach{
            addSubview($0)
        }
        
        self.imageView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(4)
            $0.bottom.equalToSuperview().inset(4)
            $0.width.equalTo(self.imageView.snp.height)
        }
        
        self.downloadButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(50)
        }
        
        self.inAppPurchaseInfoLabel.snp.makeConstraints{
            $0.centerX.equalTo(self.downloadButton.snp.centerX)
            $0.top.equalTo(self.downloadButton.snp.bottom).offset(4)
        }
        
        self.titleLabel.snp.makeConstraints{
            $0.leading.equalTo(self.imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(self.downloadButton.snp.leading)
            $0.top.equalTo(self.imageView.snp.top).inset(8)
        }
        
        self.descriptionLabel.snp.makeConstraints{
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.trailing.equalTo(self.titleLabel.snp.trailing)
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            
        }
    }
}
