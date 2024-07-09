//
//  ThirdViewController.swift
//  UIKIT6
//
//  Created by Даниил Сивожелезов on 09.07.2024.
//

import UIKit
import SnapKit

final class ThirdViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupZoom()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(1)
        }
    }
}

extension ThirdViewController: UIScrollViewDelegate {
    private func setupZoom() {
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 4
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
