//
//  MovieCell.swift
//  MarujoMovieSearcher
//
//  Created by Daniel on 01/03/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID      = "MovieCell"
    
    let avatarImageView     = MSAvatarImageView(frame: .zero)
    let movieTitleLabel     = MSTitleLabel(textAlignment: .center, fontSize: 16)
    let descriptionLabel    = MSBodyLabel(textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: Movie) {
        movieTitleLabel.text = movie.title
        descriptionLabel.text = movie.overview
        descriptionLabel.numberOfLines = 4
        guard let posterPath = movie.posterPath else { return }
        avatarImageView.downloadImage(from: "https://www.themoviedb.org/t/p/w220_and_h330_face" + posterPath)
    }
    
    private func configure() {
        addSubview(movieTitleLabel)
        addSubview(avatarImageView)
        addSubview(descriptionLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            movieTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            avatarImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, constant: 70),
            
            descriptionLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
}
