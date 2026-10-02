import ChineseAstrologyCalendar

// MARK: - Localized names
//
// Case names mix scripts for historical reasons (手阳明大腸经). These
// conformances give each script a consistent spelling: 手陽明大腸經 in
// Traditional Chinese, 手阳明大肠经 in Simplified Chinese. Clinical prose
// (主要功能, 主治病症, 情緒 …) intentionally stays in Traditional Chinese.

extension 十二经脉: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant: return traditionalChineseName
    case .zhHans: return simplifiedChineseName
    case .en: return englishName
    }
  }

  /// The meridian's name written entirely in Traditional Chinese, e.g. 手陽明大腸經.
  public var traditionalChineseName: String {
    switch self {
    case .手太陰肺经:   return "手太陰肺經"
    case .手少陰心经:   return "手少陰心經"
    case .手厥陰心包经: return "手厥陰心包經"
    case .手阳明大腸经: return "手陽明大腸經"
    case .手太阳小腸经: return "手太陽小腸經"
    case .手少阳三焦经: return "手少陽三焦經"
    case .足太陰脾经:   return "足太陰脾經"
    case .足少陰腎经:   return "足少陰腎經"
    case .足厥陰肝经:   return "足厥陰肝經"
    case .足阳明胃经:   return "足陽明胃經"
    case .足太阳膀胱经: return "足太陽膀胱經"
    case .足少阳胆经:   return "足少陽膽經"
    }
  }

  private var simplifiedChineseName: String {
    switch self {
    case .手太陰肺经:   return "手太阴肺经"
    case .手少陰心经:   return "手少阴心经"
    case .手厥陰心包经: return "手厥阴心包经"
    case .手阳明大腸经: return "手阳明大肠经"
    case .手太阳小腸经: return "手太阳小肠经"
    case .手少阳三焦经: return "手少阳三焦经"
    case .足太陰脾经:   return "足太阴脾经"
    case .足少陰腎经:   return "足少阴肾经"
    case .足厥陰肝经:   return "足厥阴肝经"
    case .足阳明胃经:   return "足阳明胃经"
    case .足太阳膀胱经: return "足太阳膀胱经"
    case .足少阳胆经:   return "足少阳胆经"
    }
  }
}

extension 奇经八脉: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant: return traditionalChineseName
    case .zhHans: return simplifiedChineseName
    case .en: return englishName
    }
  }

  /// The vessel's name written entirely in Traditional Chinese, e.g. 陽蹺脈.
  public var traditionalChineseName: String {
    switch self {
    case .督脉:   return "督脈"
    case .任脉:   return "任脈"
    case .冲脉:   return "衝脈"
    case .带脉:   return "帶脈"
    case .陰维脉: return "陰維脈"
    case .阳维脉: return "陽維脈"
    case .陰蹺脉: return "陰蹺脈"
    case .阳蹺脉: return "陽蹺脈"
    }
  }

  private var simplifiedChineseName: String {
    switch self {
    case .督脉:   return "督脉"
    case .任脉:   return "任脉"
    case .冲脉:   return "冲脉"
    case .带脉:   return "带脉"
    case .陰维脉: return "阴维脉"
    case .阳维脉: return "阳维脉"
    case .陰蹺脉: return "阴跷脉"
    case .阳蹺脉: return "阳跷脉"
    }
  }
}

extension 五臟: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant: return rawValue
    case .zhHans: return self == .腎 ? "肾" : rawValue
    case .en: return englishName
    }
  }

  /// English name of the organ.
  public var englishName: String {
    switch self {
    case .肺: return "Lung"
    case .脾: return "Spleen"
    case .心: return "Heart"
    case .肝: return "Liver"
    case .腎: return "Kidney"
    }
  }
}

extension 六腑: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant:
      return rawValue
    case .zhHans:
      switch self {
      case .小腸: return "小肠"
      case .大腸: return "大肠"
      case .膽: return "胆"
      default: return rawValue
      }
    case .en:
      return englishName
    }
  }

  /// English name of the organ.
  public var englishName: String {
    switch self {
    case .膀胱: return "Bladder"
    case .小腸: return "Small Intestine"
    case .胃: return "Stomach"
    case .大腸: return "Large Intestine"
    case .膽: return "Gallbladder"
    case .三焦: return "Triple Burner"
    }
  }
}
