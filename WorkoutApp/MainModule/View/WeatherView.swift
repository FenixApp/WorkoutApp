//
//  WeatherView.swift
//  WorkoutApp
//
//  Created by Dmitriy Starozhilov on 15.03.2023.
//

import UIKit

class WeatherView: UIView {
    
    private let sunImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.textColor = #colorLiteral(red: 0.3176470588, green: 0.3176470588, blue: 0.3137254902, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(sunImageView)
        addSubview(weatherLabel)
        addSubview(descriptionLabel)
    }
}

extension WeatherView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            sunImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            sunImageView.heightAnchor.constraint(equalToConstant: 62),
            sunImageView.widthAnchor.constraint(equalToConstant: 62),
            sunImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabel.trailingAnchor.constraint(equalTo: sunImageView.leadingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: sunImageView.leadingAnchor, constant: -10)
        ])
    }
}
