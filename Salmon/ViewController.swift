//
//  ViewController.swift
//  Salmon
//
//  Created by Нюргун on 04.09.2024.
//

import UIKit

struct AdvantagesData {
    struct Data {
        let image: UIImage?
        let title: String
        let subtitle: String
    }
    let items: [Data]
}

class ViewController: UIViewController {
    
    private var dataSource: [AdvantagesData] = []
    
    private let headerView = HeaderView()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let aboutButton = UIButton()
    
    private let continueButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        dummyData()
    }
}

extension ViewController {
    
    private func style() {
        view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        aboutButton.configuration = .plain()
        aboutButton.setTitle("More about the Credit line", for: .normal)
        aboutButton.setTitleColor(UIColor(named: "buttoncolor"), for: .normal)
        aboutButton.titleLabel?.shadowColor = UIColor(named: "shadowcolor")
        aboutButton.titleLabel?.shadowOffset = CGSize(width: 0, height: 3)
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        
        continueButton.configuration = .filled()
        continueButton.tintColor = UIColor(named: "buttoncolor")
        continueButton.setTitle("Continue", for: .normal)
        continueButton.layer.cornerRadius = 15
        continueButton.clipsToBounds = true
        continueButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(headerView)
        view.addSubview(collectionView)
        view.addSubview(aboutButton)
        view.addSubview(continueButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 302),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: aboutButton.topAnchor),
            
            aboutButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            aboutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aboutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            aboutButton.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.topAnchor.constraint(equalTo: aboutButton.bottomAnchor, constant: 10),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func dummyData() {
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataSource = [
            .init(
                items: [
                    .init(
                        image: UIImage(named: "cash"),
                        title: "Credit limit ₱10,000.00",
                        subtitle: "Revolving amount is ready to use over and over"
                    ),
                    .init(
                        image: UIImage(named: "percent"),
                        title: "Free forever",
                        subtitle: "No annual fee. If you don’t use it, you don’t pay"
                    ),
                    .init(
                        image: UIImage(named: "calendar"),
                        title: "30 days interest-free period",
                        subtitle: "Pay the minimum payment in a month"
                    ),
                    .init(
                        image: UIImage(named: "qr"),
                        title: "Easy to use",
                        subtitle: "Send money, pay bills, make daily purchases via QR Ph with ease"
                    )
                ])
        ]
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        
        let item = dataSource[indexPath.section].items[indexPath.row]
        
        cell.configure(image: item.image!, title: item.title, subtitle: item.subtitle)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


