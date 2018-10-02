//
//  ReposCell.swift
//  hiddenfounders_Mobile_Challenge
//
//  Created by Yassine EL HALAOUI on 02/10/2018.
//

import UIKit


class ReposCell: UITableViewCell {

    var reposItmes: ReposItmes? {
        didSet {
            titleLabel.text = reposItmes?.name
            descLabel.text = reposItmes?.description
            ownerNameLabel.text = reposItmes?.owner?.login
            if let urlString = reposItmes?.owner?.avatar_url {
                avatar.loadImageUsingCachWith(urlString)
            }
            if let numOfStars = reposItmes?.stargazers_count {
                if numOfStars > 999 {
                    numberOfStarsLabel.text = String(numOfStars / 1000) + "K"
                } else {
                    numberOfStarsLabel.text = String(numOfStars)
                }
            }
        }
    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    let descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let numberOfStarsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()

    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "star")
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(avatar)
        addSubview(ownerNameLabel)
        addSubview(numberOfStarsLabel)
        addSubview(starImage)

        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),

            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            descLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),

            avatar.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 12),
            avatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatar.widthAnchor.constraint(equalToConstant: 40),
            avatar.heightAnchor.constraint(equalToConstant: 40),

            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),

            ownerNameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 8),
            ownerNameLabel.centerYAnchor.constraint(equalTo: avatar.centerYAnchor),

            numberOfStarsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            numberOfStarsLabel.centerYAnchor.constraint(equalTo: avatar.centerYAnchor),

            starImage.widthAnchor.constraint(equalToConstant: 25),
            starImage.heightAnchor.constraint(equalToConstant: 25),
            starImage.rightAnchor.constraint(equalTo: numberOfStarsLabel.leftAnchor, constant: -2),
            starImage.centerYAnchor.constraint(equalTo: avatar.centerYAnchor)

        ]
        NSLayoutConstraint.activate(constraints)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
