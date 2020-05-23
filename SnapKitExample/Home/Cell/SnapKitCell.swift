//
//  HomeCell.swift
//  SnapKitExample
//
//  Created by Tolga İskender on 23.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class SnapKitCell: UITableViewCell {
    
    var stackView = UIStackView()
    var movieImage = UIImageView()
    var movieTitle = UILabel()
    var movieDesc = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        customizeCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder)")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setCell(model:Result){
        print(Constant.shared.imageUrl+(model.posterPath ?? ""))
        setImg(image: movieImage, imgLink: Constant.shared.imageUrl+(model.posterPath ?? ""))
        movieTitle.text = model.title
        movieDesc.text = model.overview
    }
    func customizeCell(){
        self.selectionStyle = .none
    }

}
extension SnapKitCell {
    func setupStackView(){
        contentView.addSubview(stackView)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(contentView)
            make.bottom.equalTo(contentView).inset(6)
        }
        addViewToStackView(stackView: stackView)
        
    }
    fileprivate func addViewToStackView(stackView:UIStackView) {
        stackView.addArrangedSubview(setupImageView())
        stackView.addArrangedSubview(setupTitleView())
        stackView.addArrangedSubview(setupDescView())
        stackView.addArrangedSubview(separatorView())
    }
    
   //MARK: StackViewElements
   fileprivate func setupImageView() -> UIView {
        let view = UIView()
        view.snp.makeConstraints() { (make) in
             make.height.equalTo(300)
        }
        movieImage.clipsToBounds = true
        view.addSubview(movieImage)
        movieImage.contentMode = .scaleAspectFill
        movieImage.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        return view
    }
   fileprivate func setupTitleView() -> UIView {
        let view = UIView()
        view.snp.makeConstraints() { (make) in
            make.height.greaterThanOrEqualTo(30)
        }
        view.addSubview(movieTitle)
        movieTitle.customizeLabel(textAligment: .center, numberofLine: 2, font: UIFont(name:"HelveticaNeue-Bold", size: 17.0))
        movieTitle.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        return view
    }
    fileprivate func setupDescView() -> UIView {
        let view = UIView()
        view.addSubview(movieDesc)
        movieDesc.customizeLabel(textAligment: .natural, numberofLine: 0, font: nil)
        movieDesc.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        return view
    }
    fileprivate func separatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.alpha = 0.5
        view.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
            make.height.equalTo(1)
        }
        return view
    }
}
extension UILabel {
    func customizeLabel(textAligment:NSTextAlignment,numberofLine:Int,font:UIFont?){
        self.font = font
        self.textAlignment = textAligment
        self.numberOfLines = numberofLine
    }
}

