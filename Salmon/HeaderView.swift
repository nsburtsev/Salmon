//
//  HeaderView.swift
//  Salmon
//
//  Created by Нюргун on 06.09.2024.
//

import UIKit

class HeaderView: UIView {
    
    private let imageView = UIImageView()
    private let closeButton = UIButton(type: .custom)
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
    
    private func style() {
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.backgroundColor = UIColor(named: "closebuttoncolor")
        closeButton.layer.cornerRadius = 15
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        title.text = "Salmon Credit line"
        title.font = UIFont(name: "ArchivoBlack-Regular", size: 32)
        title.textColor = UIColor(named: "titlecolor")
        title.layer.borderWidth = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        
//        title.layer.shadowColor = UIColor.black.cgColor // Цвет тени
//        title.layer.shadowOpacity = 0.25 // Прозрачность тени
//        title.layer.shadowOffset = CGSize(width: 0, height: 2) // Смещение тени
//        title.layer.shadowRadius = 4 // Радиус размытия
        
        subtitle.text = "Pay freely for any purchases with QR Ph"
        subtitle.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        subtitle.numberOfLines = 0
        subtitle.textColor = UIColor(named: "titlecolor")
        subtitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(closeButton)
        addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 204),
            
            closeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 65),
            closeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            stackView.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
