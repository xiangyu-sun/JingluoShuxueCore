//
//  File.swift
//  
//
//  Created by Xiangyu Sun on 1/11/22.
//

import ChineseAstrologyCalendar

public enum 五臟: String, CaseIterable {
    case 肺
    case 脾
    case 心
    case 肝
    case 腎
    
    public var wuxing: Wuxing {
        switch self {
        case .肺:
            return .jin
        case .脾:
            return .tu
        case .心:
            return .huo
        case .肝:
            return .mu
        case .腎:
            return .shui
        }
    }
}
