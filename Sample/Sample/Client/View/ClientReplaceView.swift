//
//  ClientReplaceView.swift
//  Sample
//
//  Created by Sarawoot Khunsri on 1/7/2563 BE.
//  Copyright © 2563 Eko. All rights reserved.
//

import UIKit

class ClientReplaceView: UIView {
    var actionHandler: (() -> Void)?
    private var containerView: UIView = UIView()
    private var actionButton: UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        initial()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initial()
    }
    
    private func initial() {
        containerView.backgroundColor = .systemPink
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 768)
            
        ])
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(actionButton)
        actionButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        actionButton.setTitle("Action from client", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = .black
        actionButton.layer.cornerRadius = 6
        actionButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        actionButton.addTarget(self, action: #selector(actionTapped), for: .touchUpInside)
    }
    
    @objc func actionTapped() {
        actionHandler?()
    }
    
}


class ClientSecondReplaceView: UIView {
    var actionHandler: (() -> Void)?
    private var containerView: UIView = UIView()
    private var actionButton: UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        initial()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initial()
    }
    
    private func initial() {
        containerView.backgroundColor = UIColor.systemBlue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 150)
            
        ])
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(actionButton)
        actionButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        actionButton.setTitle("Second action from client", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = .black
        actionButton.layer.cornerRadius = 6
        actionButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        actionButton.addTarget(self, action: #selector(actionTapped), for: .touchUpInside)
    }
    
    @objc func actionTapped() {
        actionHandler?()
    }
    
}
