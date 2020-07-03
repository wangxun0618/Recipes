//
//  IAskRequestManager.swift
//  IAskDoctorNew
//
//  Created by xun wang on 2020/5/19.
//  Copyright © 2020 IAsk. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

//成功
typealias IAskNetSuccessBlock<T> = (_ value: IAskBaseModel<T>?, [String: Any]) -> Void
//失败
typealias IAskNetFailedBlock = (IAskErrorInfo) -> Void
typealias IAskProgressBlock = (Double) -> Void

class IAskRequestManager: NSObject {
    
    private var session: Session?
    static let share = IAskRequestManager()
    
    @objc open class func sharedInstance() -> IAskRequestManager {
        return share
    }
    
    override init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
    
        session = Session(configuration: configuration,
                          delegate: SessionDelegate(),
                          serverTrustManager: nil)
    }
}

// MARK: 对外同一接口
extension IAskRequestManager {
    
    open func requestByTargetType<T>(targetType: IAskAPITargetType,
                             success: @escaping IAskNetSuccessBlock<T>,
                             failed: IAskNetFailedBlock? = nil) {
        
        let url = targetType.baseUrl ?? "" + (targetType.path ?? "")
        
        switch targetType.method {
        case .get:
            self.get(url: url, param: targetType.params, headers: targetType.headers, success: success, failed: failed)
            break
        case .post:
            self.post(url: url, param: targetType.params, headers: targetType.headers, success: success, failed: failed)
            break
        case .bodyPost:
            break
        default:
            break
        }
        
    }
    
}

//MARK: Get Post等请求
extension IAskRequestManager {
    
    fileprivate func get<T>(url: String,
                         param: Parameters?,
                         headers: HTTPHeaders?,
                         success: @escaping IAskNetSuccessBlock<T>,
                         failed: IAskNetFailedBlock? = nil) {
        self.session?.request(url, method: .get, parameters: param, encoding: URLEncoding.httpBody, headers: headers)
            .validate()
            .responseJSON(completionHandler: { (response) in
                
                self.handleResponse(response: response, success: success, failed: failed)
            })
 
    }
    
    fileprivate func post<T>(url: String,
                          param: Parameters?,
                          headers: HTTPHeaders?,
                          success: @escaping IAskNetSuccessBlock<T>,
                          failed: IAskNetFailedBlock? = nil) {
        self.session?.request(url, method: .post, parameters: param, encoding: URLEncoding.default, headers: headers)
            .validate()
            .responseJSON(completionHandler: { (response) in
                
                self.handleResponse(response: response, success: success, failed: failed)
            })
    }
    
    fileprivate func postBody<T>(url: String,
                              paramBody: Dictionary<String, Any>?,
                              headers: HTTPHeaders,
                              success: @escaping IAskNetSuccessBlock<T>,
                              failed: @escaping IAskNetFailedBlock) {
        
        let json = try? JSONSerialization.data(withJSONObject: paramBody as Any, options: [])
        
        let urlReqest = URL.init(string: url)
        var request = URLRequest.init(url: urlReqest!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json
        // http
        self.session?.request(request)
            .validate()
            .responseJSON(completionHandler: { (response) in
                
                self.handleResponse(response: response, success: success, failed: failed)
            })
        
        
    }
    
}


//MARK: 处理返回结果
extension IAskRequestManager {
    /** 处理服务器响应数据*/
    private func handleResponse<T>(response: AFDataResponse<Any>,
                                success:IAskNetSuccessBlock<T>,
                                failed: IAskNetFailedBlock? = nil) {
        //服务器为返回数据
        switch response.result {
        case let .success(result):
            //服务器返回数据
            self.handleRequestSuccess(value: result, successBlock: success, faliedBlock: failed)
            
        case let .failure(error):
            self.handleRequestError(error: error as NSError, faliedBlock: failed)
        }

        
    }
    
    /** 处理请求失败数据*/
    private func handleRequestError(error: NSError, faliedBlock: IAskNetFailedBlock? = nil){
        let errorInfo = IAskErrorInfo();
        errorInfo.code = error.code;
        errorInfo.error = error;
        if ( errorInfo.code == -1009 ) {
            errorInfo.message = "无网络连接";
        }else if ( errorInfo.code == -1001 ){
            errorInfo.message = "请求超时";
        }else if ( errorInfo.code == -1005 ){
            errorInfo.message = "网络连接丢失(服务器忙)";
        }else if ( errorInfo.code == -1004 ){
            errorInfo.message = "服务器没有启动";
        }else if ( errorInfo.code == 404 || errorInfo.code == 3) {
        }
        faliedBlock?(errorInfo)
    }
    
    /** 处理请求成功数据*/
    private func handleRequestSuccess<T>(value:Any,
                                      successBlock: IAskNetSuccessBlock<T>,
                                      faliedBlock: IAskNetFailedBlock? = nil) {
        
        if let result = value as? [String: Any] {
            let baseModel = IAskBaseModel<T>.deserialize(from: result)
            
            successBlock(baseModel, result)
        }
    }
    
    
    
    private func handleRequestSuccessWithFaliedBlcok(failed: IAskNetFailedBlock) {
        let errorInfo = IAskErrorInfo()
        errorInfo.code = -1
        errorInfo.message = "数据解析出错"
        
    }
    
}
