//
//  SliderView.swift
//  WorkoutApp
//
//  Created by Dmitriy Starozhilov on 15.05.2023.
//

import UIKit

class SliderView: UIView {
    
    private let nameLabel = UILabel(text: "Name",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let numberLabel = UILabel(text: "0",
                                      font: .robotoMedium24(),
                                      textColor: .specialGray)
    
    private lazy var slider = GreenSlider()
    
    private var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(name: String, minValue: Float, maxValue: Float) {
        self.init(frame: .zero)
        nameLabel.text = name
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, numberLabel],
                                          axis: .horizontal,
                                          spacing: 10)
        labelsStackView.distribution = .equalSpacing
        stackView = UIStackView(arrangedSubviews: [labelsStackView, slider],
                                axis: .vertical,
                                spacing: 10)
        addSubview(stackView)
    }
}

extension SliderView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
