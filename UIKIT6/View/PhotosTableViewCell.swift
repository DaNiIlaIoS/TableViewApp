//
//  PhotosTableViewCell.swift
//  UIKIT6
//
//  Created by Даниил Сивожелезов on 09.07.2024.
//

import UIKit
import SnapKit

final class PhotosTableViewCell: UITableViewCell {
    
    lazy var photo: UIImageView = {
       let image = UIImageView()
        image.image = .img1
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image name: String) {
        photo.image = UIImage(named: name)
    }
    
    private func setupUI() {
        addSubview(photo)
        setupConstraints()
    }
    
    private func setupConstraints() {
        photo.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
            
        }
    }
}
