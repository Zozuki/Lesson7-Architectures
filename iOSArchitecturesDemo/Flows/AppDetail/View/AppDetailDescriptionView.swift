//
//  AppDescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by user on 02.09.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionView: UIView {

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var subTitleVersionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var subTitleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var versionHistoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var XDaysAgoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        self.addSubview(titleLabel)
        self.addSubview(subTitleVersionLabel)
        self.addSubview(subTitleDescriptionLabel)
        self.addSubview(versionHistoryLabel)
        self.addSubview(XDaysAgoLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
     
            subTitleVersionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleVersionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            
            subTitleDescriptionLabel.topAnchor.constraint(equalTo: subTitleVersionLabel.bottomAnchor, constant: 10),
            subTitleDescriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            subTitleDescriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            versionHistoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            versionHistoryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            XDaysAgoLabel.topAnchor.constraint(equalTo: versionHistoryLabel.bottomAnchor, constant: 10),
            XDaysAgoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        ])
    }
}
