//
//  HomeCell2.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class XibCell: UITableViewCell {

    @IBOutlet weak var descMovie: UILabel!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(model:Result){
          print(Constant.shared.imageUrl+(model.posterPath ?? ""))
          setImg(image: imageMovie, imgLink: Constant.shared.imageUrl+(model.posterPath ?? ""))
          titleMovie.text = model.title
          descMovie.text = model.overview
      }
}
