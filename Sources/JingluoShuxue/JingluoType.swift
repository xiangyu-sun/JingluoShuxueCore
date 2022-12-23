//
//  JingluoType.swift
//  AcupuncturePoints
//
//  Created by xiangyu sun on 10/20/17.
//  Copyright © 2017 xiangyu sun. All rights reserved.
//

import ChineseAstrologyCalendar
import Foundation

public let 气血循环流注: [十二经脉] = [.手太陰肺经, .手阳明大腸经, .足阳明胃经, .足太陰脾经, .手少陰心经, .手太阳小腸经, .足太阳膀胱经, .足少陰腎经, .手厥陰心包经, .手少阳三焦经, .足少阳胆经, .足厥陰肝经]

public let 十四经脉: [经络组成] = [
  十二经脉.手太陰肺经,
  十二经脉.手阳明大腸经,
  十二经脉.足阳明胃经,
  十二经脉.足太陰脾经,
  十二经脉.手少陰心经,
  十二经脉.手太阳小腸经,
  十二经脉.足太阳膀胱经,
  十二经脉.足少陰腎经,
  十二经脉.手厥陰心包经,
  十二经脉.手少阳三焦经,
  十二经脉.足少阳胆经,
  十二经脉.足厥陰肝经,
  奇经八脉.督脉,
]

// MARK: - 经络组成

public protocol 经络组成 { }

// MARK: - 十二经脉

//    case 十二经别
//    case 十二经筋
//
//    case 十二皮部
//
//    case 十五络脉
//    case 浮络
//    case 孙络

public enum 十二经脉: String, 经络组成 {
  case 手太陰肺经
  case 手少陰心经
  case 手厥陰心包经
  case 手阳明大腸经
  case 手太阳小腸经
  case 手少阳三焦经
  case 足太陰脾经
  case 足少陰腎经
  case 足厥陰肝经
  case 足阳明胃经
  case 足太阳膀胱经
  case 足少阳胆经

  // MARK: Public

  public var 五行: Wuxing? {
    switch self {
    case .手太陰肺经:
      return .jin
    case .手少陰心经:
      return .huo
    case .手厥陰心包经:
      return nil
    case .手阳明大腸经:
      return .jin
    case .手太阳小腸经:
      return .huo
    case .手少阳三焦经:
      return nil
    case .足太陰脾经:
      return .tu
    case .足少陰腎经:
      return .shui
    case .足厥陰肝经:
      return .mu
    case .足阳明胃经:
      return .tu
    case .足太阳膀胱经:
      return .shui
    case .足少阳胆经:
      return .mu
    }
  }

  public func 是阳吗() -> Bool {
    rawValue.contains("阳")
  }
}

// MARK: - 奇经八脉

public enum 奇经八脉: String, 经络组成 {
  case 督脉
  case 任脉
  case 冲脉
  case 代脉
  case 陰维脉
  case 阳维脉
  case 陰脉
  case 阳脉
}

// MARK: - 人体部位

public enum 人体部位 {
  case 头面
  case 面额部
  case 颊部
  case 头顶
  case 头后部
  case 枕项部
  case 耳颞部
  case 目系
  case 巅顶
  case 舌根
  case 舌本
  case 舌下
  case 胸部
  case 腋下
  case 肩部
  case 肩胛部
  case 肋部
  case 腹胸
  case 前胸
  case 前腹部
  case 背部
  case 侧部
  case 上肢
  case 下肢
  case 颌部
}
