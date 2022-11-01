//
//  File.swift
//  
//
//  Created by Xiangyu Sun on 1/11/22.
//

import ChineseAstrologyCalendar

public enum 五臟: String {
    case 心
    case 肝
    case 脾
    case 肺
    case 腎
    
    public var wuxing: Wuxing {
        switch self {
        case .心:
            return .huo
        case .肝:
            return .mu
        case .脾:
            return .huo
        case .肺:
            return .jin
        case .腎:
            return .shui
        }
    }
}
