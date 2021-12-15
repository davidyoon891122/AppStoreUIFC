//
//  AppDetailViewController.swift
//  AppStoreApp
//
//  Created by David Yoon on 2021/12/15.
//

import UIKit
import SnapKit
import Kingfisher

final class AppDetailViewController: UIViewController {
    private let today: Today
    private lazy var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        return button
    }()
    
    
    init(today: Today) {
        self.today = today
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.appIconImageView.kf.setImage(with: today.image)
        self.titleLabel.text = today.title
        self.subTitleLabel.text = today.subTitle
        self.view.backgroundColor = .systemBackground
    }
    
    
    
}


private extension AppDetailViewController {
    func setupViews() {
        [
            self.appIconImageView,
            self.titleLabel,
            self.subTitleLabel,
            self.downloadButton,
            self.shareButton
        ].forEach{
            self.view.addSubview($0)
        }
        
        self.appIconImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(32)
            $0.height.equalTo(100)
            $0.width.equalTo(self.appIconImageView.snp.height)
        }
        
        self.titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.appIconImageView.snp.top)
            $0.leading.equalTo(self.appIconImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        self.subTitleLabel.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(self.titleLabel.snp.leading)
        }
        
        self.downloadButton.snp.makeConstraints{
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.bottom.equalTo(self.appIconImageView.snp.bottom)
            $0.height.equalTo(24)
            $0.width.equalTo(60)
        }
        
        self.shareButton.snp.makeConstraints{
            $0.trailing.equalTo(self.titleLabel.snp.trailing)
            $0.bottom.equalTo(self.appIconImageView.snp.bottom)
            $0.height.equalTo(32)
            $0.width.equalTo(32)
        }
        
        
        
    }
    
    @objc func didTapShareButton() {
        print("Share")
        let activityItems: [Any] = [today.title]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}
