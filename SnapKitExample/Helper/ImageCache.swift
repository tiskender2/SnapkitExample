//
//  ImageCache.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import Kingfisher

func setImg(image: UIImageView?, imgLink: String) -> (){
    let url = URL(string: imgLink)
   
    image!.kf.indicatorType = .activity
    image!.kf.setImage(
        with: url,
        placeholder: UIImage(named: "placeholder"),
        options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
    ])
}
