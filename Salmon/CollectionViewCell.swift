//
//  CollectionViewCell.swift
//  Salmon
//
//  Created by Нюргун on 11.09.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let id = "CollectionViewCell"
    
    private let imageView = UIImageView()
    private let stackView = UIStackView()
    private let title = UILabel()
    private let subtitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage, title: String, subtitle: String) {
        self.imageView.image = image
        self.title.text = title
        self.subtitle.text = subtitle
    }
    
    func style() {
        imageView.backgroundColor = UIColor(named: "iconbackground")
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .center
        imageView.layer.masksToBounds = true
        imageView.image?.resizableImage(withCapInsets: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        title.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        title.textColor = UIColor(named: "titlecolor")
        
        subtitle.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        subtitle.numberOfLines = 0
        subtitle.textColor = UIColor(named: "subtitlecolor")
    }
    
    func layout() {
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 48),
            imageView.widthAnchor.constraint(equalToConstant: 48),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
    }
}
