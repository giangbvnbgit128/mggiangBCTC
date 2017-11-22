//
//  AVLoginRouter.swift
//  AnViet
//
//  Created by Bui Giang on 5/31/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit
import Alamofire



enum LoginEndPoint {
    case direction
}

class AVLoginRouter: AVBaseRouter {
   
    var endpoint: LoginEndPoint
    
    init(endpoint: LoginEndPoint) {
        self.endpoint = endpoint
    }
    
    override var method: HTTPMethod{
        switch endpoint {
        case .direction: return .get
        }
    }
    override var path: String {
        
        switch endpoint {
        case .direction(): return "frontApi/getAboutUs?appid=\(DataConfig.APPLEID)"
        }
    }
    override var parameters: APIParams {
        return nil
    }
    
    override var encoding: Alamofire.ParameterEncoding? {
        return URLEncoding()
    }
}
