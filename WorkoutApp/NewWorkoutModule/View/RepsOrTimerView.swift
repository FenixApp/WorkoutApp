//
//  RepsOrTimerView.swift
//  WorkoutApp
//
//  Created by Dmitriy Starozhilov on 14.05.2023.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let setsView = SliderView(name: "Sets", minValue: 0, maxValue: 10, type: .sets)
    private let repsView = SliderView(name: "Reps", minValue: 0, maxValue: 50, type: .reps)
    private let timerView = SliderView(name: "Timer", minValue: 0, maxValue: 600, type: .timer)
    
    private let repeatOrTimerLabel = UILabel(text: "Choose repeat or timer")
    
    private var stackView = UIStackView()
    
    public var (sets, reps, timer) = (0, 0, 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        repeatOrTimerLabel.textAlignment = .center
        
        addSubview(repsOrTimerLabel)
        addSubview(backgroundView)
        
        stackView = UIStackView(arrangedSubviews: [setsView,
                                                   repeatOrTimerLabel,
                                                   repsView,
                                                   timerView],
                                axis: .vertical,
                                spacing: 20)
        backgroundView.addSubview(stackView)
    }
    
    private func setDelegates() {
        setsView.delegate = self
        repsView.delegate = self
        timerView.delegate = self
    }
}

extension RepsOrTimerView: SliderViewProtocol {
    func changeValue(type: SliderType, value: Int) {
        switch type {
        case .sets:
            sets = value
        case .reps:
            reps = value
            repsView.isActive = true
            timerView.isActive = false
            timer = 0
        case .timer:
            timer = value
            timerView.isActive = true
            repsView.isActive = false
            reps = 0
        }
    }
}

extension RepsOrTimerView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            backgroundView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 3),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15)
        ])
    }
}
