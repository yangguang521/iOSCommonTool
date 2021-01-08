//
//  HomeConfigurationCell.swift
//  iOSCommonTool
//
//  Created by Joe on 2021/1/5.
//

import UIKit

class HomeConfigurationCell: UITableViewCell {
    public let centerView = UIView()
    private let titleNameLabel = UILabel()
    
    var titleName: String? {
        didSet {
            titleNameLabel.text = titleName
        }
    }
    
    var isHideCenterView: Bool = false {
        didSet {
            centerView.isHidden = isHideCenterView
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews() {
        self.selectionStyle = .none
        contentView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        centerView.backgroundColor = .white
        centerView.layer.masksToBounds = true
        centerView.layer.cornerRadius = 5
        contentView.addSubview(centerView)
        centerView.snp.makeConstraints { (maker) in
            maker.left.equalTo(contentView.snp_left).offset(20)
            maker.center.equalTo(contentView.snp_center)
            maker.top.equalTo(contentView.snp_top).offset(5)
            //maker.top.equalTo(contentView.snp_top).offset(15)
            //maker.bottom.equalTo(contentView.snp_bottom)
        }
        
        let leftImageView = UIImageView(image: UIImage(named: "home_configuration_left_sort"))
        centerView.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { (maker) in
            maker.left.equalTo(centerView.snp_left).offset(15)
            maker.centerY.equalTo(centerView.snp_centerY)
            maker.width.height.equalTo(16)
        }
        
        titleNameLabel.textAlignment = .left
        titleNameLabel.textColor = UIColor.hexColor(0x333333)
        titleNameLabel.font = UIFont.pingFangSCFont(fontStyle: .Regular, fontSize: 16)
        centerView.addSubview(titleNameLabel)
        titleNameLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(leftImageView.snp_right).offset(15)
            maker.centerY.equalTo(centerView.snp_centerY)
            maker.width.greaterThanOrEqualTo(30)
            maker.height.equalTo(30)
        }
        
        let rightSwitch = UISwitch()
        rightSwitch.onTintColor = .green
        rightSwitch.thumbTintColor = UIColor.lightText
        centerView.addSubview(rightSwitch)
        rightSwitch.snp.makeConstraints { (maker) in
            maker.right.equalTo(centerView.snp_right).offset(-20)
            maker.centerY.equalTo(centerView.snp_centerY)
            maker.width.equalTo(45)
            maker.height.equalTo(30)
        }
        
        /*
         @available(iOS 6.0, *)
         open var onImage: UIImage?
         
         @available(iOS 6.0, *)
         open var offImage: UIImage?
         
         
         /// The switch's display style. This property always returns a concrete, resolved style (never UISwitchStyleAutomatic).
         @available(iOS 14.0, *)
         open var style: UISwitch.Style { get }
         
         
         /// Request a style for the switch. If the style changed, then the switch may resize.
         @available(iOS 14.0, *)
         open var preferredStyle: UISwitch.Style
         
         
         open var isOn: Bool
         
         
         public init(frame: CGRect) // This class enforces a size appropriate for the control, and so the frame size is ignored.
         
         
         public init?(coder: NSCoder)
         
         
         open func setOn(_ on: Bool, animated: Bool) // does not send action
         */
        
        
        
    }
    
}
