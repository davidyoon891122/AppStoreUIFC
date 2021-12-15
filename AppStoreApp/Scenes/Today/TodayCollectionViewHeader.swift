//
//  TodayCollectionViewHeader.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import UIKit
import SnapKit

final class TodayCollectionViewHeaedr: UICollectionReusableView {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "6월 28일 월요일"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "투데이"
        label.font = .systemFont(ofSize: 36, weight: .black)
        label.textColor = .label
        return label
    }()
    
    
    func setupViews() {
        [self.dateLabel, self.titleLabel].forEach{
            addSubview($0)
        }
        
        self.dateLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32)
        }
        
        self.titleLabel.snp.makeConstraints{
            $0.left.equalTo(self.dateLabel)
            $0.top.equalTo(self.dateLabel.snp.bottom).offset(8)
        }
    }
}
