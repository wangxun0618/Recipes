//
//  IAskProgressHUD.swift
//  IAskDoctorNew
//
//  Created by xun wang on 2020/6/2.
//  Copyright © 2020 IAsk. All rights reserved.
//

import UIKit

enum IAskProgressHUDType {
    case text(text: String)
    case loading(text: String? = nil, indicatorColor: UIColor? = UIColor.white)
    case image
}
private var HUDs = [IAskProgressHUD]()

class IAskProgressHUD: UIView {
    
    open var contentInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    open var contentPadding = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    
    open var cornerRadius: CGFloat = 0 {
        didSet {
            containerView.layer.cornerRadius = cornerRadius
            containerView.layer.masksToBounds = true
        }
    }
    open var blurEffect: UIBlurEffect? {
        didSet {
            visualEffectView?.effect = blurEffect
            visualEffectView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            
        }
    }
    
    private var containerView: UIView!
    private var textLabel: UILabel?
    private var activityView: UIActivityIndicatorView?
    private var visualEffectView: UIVisualEffectView?
    
    private var inView: UIView?
    private var delay: Double = 2
    private var type: IAskProgressHUDType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView = UIView()
        self.addSubview(containerView)
        
        containerView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.greaterThanOrEqualTo(contentInsets.left)
            make.top.greaterThanOrEqualTo(contentInsets.top)
            make.right.lessThanOrEqualTo(-contentInsets.right)
            make.bottom.lessThanOrEqualTo(-contentInsets.bottom)
        }
        
        blurEffect = UIBlurEffect(style: .dark)
        visualEffectView = UIVisualEffectView(effect: blurEffect)
        containerView.addSubview(visualEffectView!)
        visualEffectView?.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 显示文字提示
    /// - Parameters:
    ///   - text: 文字提示
    ///   - delay: 延迟时间
    ///   - inView: 添加到某个View中
    ///   - completion: 完成回调
    /// - Returns: 返回HUD对象
    @discardableResult
    open class func showText(text: String,
                             delay: Double? = 2,
                             inView: UIView? = nil,
                             completion: ((Bool) ->Void)? = nil) -> IAskProgressHUD? {
        
        return showContent(type: .text(text: text),
                           delay: delay,
                           inView: inView)
    }
    
    
    /// Loading 加载视图
    /// - Parameters:
    ///   - text: 文字
    ///   - delay: 延迟隐藏时间
    ///   - inView: 添加到某个View
    ///   - completion: 完成回调
    /// - Returns: 返回HUD对象
    @discardableResult
    open class func showLoading(text: String? = nil,
                                indicatorColor: UIColor? = .white,
                                delay: Double? = Double.infinity,
                                inView: UIView? = nil,
                                completion:((Bool) ->Void)? = nil) -> IAskProgressHUD {
        
        return showContent(type: .loading(text: text, indicatorColor: indicatorColor),
                           delay: delay,
                           inView: inView)
    }
    
    private class func showContent(type: IAskProgressHUDType,
                                   delay: Double?,
                                   inView: UIView?) -> IAskProgressHUD {
        
        let hud = IAskProgressHUD(frame: CGRect.zero)
        hud.cornerRadius = 6
        hud.inView = inView ?? UIApplication.shared.keyWindow
        hud.delay = delay ?? 2
        hud.type = type
        hud.inView?.addSubview(hud)
        hud.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        HUDs.append(hud)
        switch type {
        case .text(let text):
            hud.setTextHUD(text: text)
            break
        case .loading(let text, let color):
            hud.setLoading(text: text, indicatorColor: color)
            break
        case .image:
            break
        }
        
        
        // 是否自动隐藏HUD afterDelay > 1000 默认不自动隐藏
        if let afterDelay = delay, afterDelay <= 1000 {
            hud.hide(afterDelay: afterDelay)
        }
        
        hud.showAnimate()
        
        return hud
    }
    
    
    /// 文字提示视图
    /// - Parameter text: 文字
    private func setTextHUD(text: String) {
        textLabel = UILabel()
        textLabel?.textAlignment = .center
        textLabel?.textColor = .white
        textLabel?.numberOfLines = 0
        self.containerView.addSubview(textLabel!)
        textLabel?.text = text
        textLabel?.snp.makeConstraints({ (make) in
            make.top.right.bottom.left.equalTo(contentPadding)
        })
        textLabel?.adjustsFontSizeToFitWidth
    }
    
    
    /// 创建Loading 视图
    /// - Parameter text: 文字
    private func setLoading(text: String?,
                            indicatorColor: UIColor? = .white) {
        
        activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        self.containerView.addSubview(activityView!)
        activityView?.startAnimating()
        activityView?.color = indicatorColor
        
        if let text = text {
            setTextHUD(text: text)
            textLabel?.snp.remakeConstraints({ (make) in
                make.top.equalTo(activityView!.snp.bottom).offset(0)
                make.left.greaterThanOrEqualTo(contentPadding.left)
                make.right.lessThanOrEqualTo(-contentPadding.right)
                make.bottom.equalTo(-contentPadding.bottom)
            })
        }
        
        activityView?.snp.makeConstraints({ (make) in
            make.top.equalTo(contentPadding.top)
            make.width.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualTo(contentPadding.left)
            make.right.lessThanOrEqualTo(-contentPadding.right)
            if text == nil {             make.bottom.equalTo(-contentPadding.bottom) }
        })
    }
    
    /// 显示动画
    private func showAnimate() {
        self.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        }) { (isFinish) in
            
        }
    }
    
    /// 隐藏HUD
    /// - Parameter afterDelay: 延迟隐藏时间
    open func hide(afterDelay: Double? = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + (afterDelay ?? 0)) {
            UIView.animate(withDuration: 0.3, animations: {
                self.alpha = 0
            }) { (isFinish) in
                self.removeFromSuperview()
                HUDs = HUDs.filter{ $0 != self }
            }
        }
    }
    
    
    /// 类方法隐藏HUD
    /// - Parameter afterDelay: 延迟时间
    open class func hide(afterDelay: Double? = 0) {
        HUDs.forEach{
            $0.hide(afterDelay: afterDelay)
        }
    }
    
}
