//
//  ProfileViewController.swift
//  AutoLayoutExercise
//
//  Created by Marissa Moore on 3/29/19.
//  Copyright © 2019 Marissa Moore. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private enum Constants {
        static let nameLabelSize: CGFloat = 23.0
        static let statusStackViewSpacing: CGFloat = 47.0
        static let hometownStackViewSpacing: CGFloat = 12.0
        static let bioStackViewSpacing: CGFloat = 50.0
        static let mainStackViewSpacing: CGFloat = 8.0
        static let profilePicAspectRatio: CGFloat = 1.0
        static let profilePicHeightRatio: CGFloat = 0.30
        static let profilePicToNameLabelSpacing: CGFloat = 20.0
        static let nameLabelToMainStackViewSpacing: CGFloat = 20.0
        static let mainStackViewLeadingSpacing: CGFloat = 30.0
        static let mainStackViewTrailingSpacing: CGFloat = -30.0
        static let mainStackViewBottomSpacing: CGFloat = 20.0
        static let labelFontSize: CGFloat = 17.0
    }
    
    private var profilePic: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile_pic"))
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "John Doe"
        label.font = UIFont.systemFont(ofSize: Constants.nameLabelSize, weight: .semibold)
        return label
    }()
    
    private var statusStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = Constants.statusStackViewSpacing
        return stackView
    }()
    
    private var hometownStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = Constants.hometownStackViewSpacing
        return stackView
    }()
    
    private var bioStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .top
        stackView.spacing = Constants.bioStackViewSpacing
        return stackView
    }()
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = Constants.mainStackViewSpacing
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
        view.addSubview(nameLabel)
        view.addSubview(mainStackView)
        
        //StackView setup
        setupStatusStackView()
        setupHometownStackView()
        setupBioStackView()
        
        mainStackView.addArrangedSubview(statusStackView)
        mainStackView.addArrangedSubview(hometownStackView)
        mainStackView.addArrangedSubview(bioStackView)
        
        //Add constraints
        NSLayoutConstraint.activate([
            //Profile Pic Constraints
            profilePic.widthAnchor.constraint(equalTo: profilePic.heightAnchor, multiplier: Constants.profilePicAspectRatio),
            profilePic.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: Constants.profilePicHeightRatio),
            profilePic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Name Label Constraints
            nameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: Constants.profilePicToNameLabelSpacing),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Main StackView Constraints
            mainStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.nameLabelToMainStackViewSpacing),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.mainStackViewLeadingSpacing),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.mainStackViewTrailingSpacing),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.mainStackViewBottomSpacing)
        ])
    }
    
    func setupStatusStackView() {
        let statusLabel = UILabel(frame: .zero)
        statusLabel.text = "Status"
        statusLabel.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .medium)
        statusLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        statusLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        let userStatusLabel = UILabel(frame: .zero)
        userStatusLabel.text = "Living the dream"
        userStatusLabel.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .light)
        userStatusLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        userStatusLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        statusStackView.addArrangedSubview(statusLabel)
        statusStackView.addArrangedSubview(userStatusLabel)
    }
    
    func setupHometownStackView() {
        let hometownLabel = UILabel(frame: .zero)
        hometownLabel.text = "Hometown"
        hometownLabel.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .medium)
        hometownLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        hometownLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let userHometownLabel = UILabel(frame: .zero)
        userHometownLabel.text = "Atlanta, GA"
        userHometownLabel.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .light)
        userHometownLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        userHometownLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        hometownStackView.addArrangedSubview(hometownLabel)
        hometownStackView.addArrangedSubview(userHometownLabel)
    }
    
    func setupBioStackView() {
        let bioLabel = UILabel(frame: .zero)
        bioLabel.text = "About"
        bioLabel.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .medium)
        bioLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        bioLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let userBioLabel = UILabel(frame: .zero)
        userBioLabel.text = "I love to travel and see amazing places! I have been to London, Tokyo, Sydney, and Rome. Check out the photos I have taken in my albums!"
        userBioLabel.font = UIFont.systemFont(ofSize: Constants.labelFontSize, weight: .light)
        userBioLabel.numberOfLines = 0
        userBioLabel.lineBreakMode = .byWordWrapping //default is .byTruncatingTail
        userBioLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        userBioLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        bioStackView.addArrangedSubview(bioLabel)
        bioStackView.addArrangedSubview(userBioLabel)
    }
}

