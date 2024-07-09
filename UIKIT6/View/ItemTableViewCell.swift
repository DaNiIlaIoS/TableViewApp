//
//  ItemTableViewCell.swift
//  UIKIT6
//
//  Created by Даниил Сивожелезов on 09.07.2024.
//

import UIKit
import SnapKit

final class ItemTableViewCell: UITableViewCell {
    
    private lazy var cellView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 30
        return view
    }()
    
    private var mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var photosStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    private lazy var showDetailButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            self?.completion?()
        }))
        button.setTitle("Show Details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 30
        return button
    }()
    
    var completion: (() -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        print("reuse")
        mainImage.image = nil
        descriptionLabel.text = nil
        nameLabel.text = nil
        photosStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func configure(with item: Item) {
        mainImage.image = UIImage(named: item.mainImage)
        nameLabel.text = item.title
        descriptionLabel.text = item.description
        
        for imageName in item.photos {
            let image = UIImageView()
            image.image = UIImage(named: imageName)
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            image.layer.cornerRadius = 20
            photosStackView.addArrangedSubview(image)
        }
    }
    
    private func setupUI() {
        contentView.addSubview(cellView)
        
        cellView.addSubview(mainImage)
        cellView.addSubview(photosStackView)
        cellView.addSubview(showDetailButton)
        
        mainImage.addSubview(nameLabel)
        mainImage.addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        cellView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        photosStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(10)
            make.leading.trailing.equalTo(mainImage)
            make.height.equalTo(100)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(descriptionLabel.snp.top)
            make.leading.trailing.equalTo(descriptionLabel)
        }
        
        showDetailButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(photosStackView)
            make.top.equalTo(photosStackView.snp.bottom).offset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
}
