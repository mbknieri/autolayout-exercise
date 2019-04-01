//
//  ProfileViewController.swift
//  AutoLayoutExercise
//
//  Created by Marissa Moore on 3/29/19.
//  Copyright © 2019 Marissa Moore. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profilePic = UIImageView(image: UIImage(named: "profile_pic"))
    private var name = UILabel(frame: .zero)
    private var statusStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 47.0
        return stackView
    }()
    
    private var hometownStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 47.0
        return stackView
    }()
    
    private var bioStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .top
        stackView.spacing = 47.0
        return stackView
    }()
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
}

// MARK: Subview setup
private extension ProfileViewController {
    func setupSubviews() {
        //Add subviews
        view.addSubview(profilePic)
        view.addSubview(name)
        view.addSubview(mainStackView)
        
        //StackView setup
        setupStatusStackView()
        setupHometownStackView()
        setupBioStackView()
        
        mainStackView.addArrangedSubview(statusStackView)
        mainStackView.addArrangedSubview(hometownStackView)
        mainStackView.addArrangedSubview(bioStackView)
        
        //TODO: Add constraints
    }
    
    func setupStatusStackView() {
        let statusLabel = UILabel(frame: .zero)
        statusLabel.text = "Status"
        statusLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        
        let userStatusLabel = UILabel(frame: .zero)
        userStatusLabel.text = "Living the dream"
        userStatusLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        
        statusStackView.addArrangedSubview(statusLabel)
        statusStackView.addArrangedSubview(userStatusLabel)
    }
    
    func setupHometownStackView() {
        let hometownLabel = UILabel(frame: .zero)
        hometownLabel.text = "Status"
        hometownLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        
        let userHometownLabel = UILabel(frame: .zero)
        userHometownLabel.text = "Atlanta, GA"
        userHometownLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        
        statusStackView.addArrangedSubview(hometownLabel)
        statusStackView.addArrangedSubview(userHometownLabel)
    }
    
    func setupBioStackView() {
        let bioLabel = UILabel(frame: .zero)
        bioLabel.text = "About"
        bioLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        
        let userBioLabel = UILabel(frame: .zero)
        userBioLabel.text = "I love to travel and see amazing places! I have been to London, Tokyo, Sydney, and Rome. Check out the photos I have taken in my albums!"
        userBioLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        userBioLabel.numberOfLines = 0
        userBioLabel.lineBreakMode = .byWordWrapping //default is .byTruncatingTail
        
        statusStackView.addArrangedSubview(bioLabel)
        statusStackView.addArrangedSubview(userBioLabel)
    }
}

