import ChineseAstrologyCalendar

// MARK: - Localized names
//
// Case names mix scripts for historical reasons (手阳明大腸经). These
// conformances give each script a consistent spelling: 手陽明大腸經 in
// Traditional Chinese, 手阳明大肠经 in Simplified Chinese. Spanish names follow
// Traditional Chinese Medicine usage; other languages without their own text
// use the English names. Clinical prose (主要功能, 主治病症, 情緒 …)
// intentionally stays in Traditional Chinese.

extension 十二经脉: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant: return traditionalChineseName
    case .zhHans: return simplifiedChineseName
    case .es: return spanishName
    default: return englishName
    }
  }

  /// The name of the meridian's organ alone, e.g. 大腸, "Large Intestine" or
  /// "Intestino Grueso", for places too narrow for the full meridian name.
  public func localizedOrganName(in language: DisplayLanguage) -> String {
    if let zang = 五臟(rawValue: organReference) { return zang.localizedName(in: language) }
    if let fu = 六腑(rawValue: organReference) { return fu.localizedName(in: language) }
    // 心包 is the one meridian organ that is neither of the 五臟 nor the 六腑.
    switch language {
    case .zhHant, .zhHans: return organReference
    case .es: return "Pericardio"
    default: return "Pericardium"
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

  private var spanishName: String {
    switch self {
    case .手太陰肺经:   return "Meridiano del Pulmón"
    case .手少陰心经:   return "Meridiano del Corazón"
    case .手厥陰心包经: return "Meridiano del Pericardio"
    case .手阳明大腸经: return "Meridiano del Intestino Grueso"
    case .手太阳小腸经: return "Meridiano del Intestino Delgado"
    case .手少阳三焦经: return "Meridiano del Triple Calentador"
    case .足太陰脾经:   return "Meridiano del Bazo"
    case .足少陰腎经:   return "Meridiano del Riñón"
    case .足厥陰肝经:   return "Meridiano del Hígado"
    case .足阳明胃经:   return "Meridiano del Estómago"
    case .足太阳膀胱经: return "Meridiano de la Vejiga"
    case .足少阳胆经:   return "Meridiano de la Vesícula Biliar"
    }
  }
}

extension 奇经八脉: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant: return traditionalChineseName
    case .zhHans: return simplifiedChineseName
    case .es: return spanishName
    default: return englishName
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

  private var spanishName: String {
    switch self {
    case .督脉:   return "Vaso Gobernador"
    case .任脉:   return "Vaso Concepción"
    case .冲脉:   return "Vaso Penetrante"
    case .带脉:   return "Vaso Cinturón"
    case .陰维脉: return "Vaso de Enlace Yin"
    case .阳维脉: return "Vaso de Enlace Yang"
    case .陰蹺脉: return "Vaso del Talón Yin"
    case .阳蹺脉: return "Vaso del Talón Yang"
    }
  }
}

extension 五臟: LocalizedNaming {
  public func localizedName(in language: DisplayLanguage) -> String {
    switch language {
    case .zhHant: return rawValue
    case .zhHans: return self == .腎 ? "肾" : rawValue
    case .es: return spanishName
    default: return englishName
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

  private var spanishName: String {
    switch self {
    case .肺: return "Pulmón"
    case .脾: return "Bazo"
    case .心: return "Corazón"
    case .肝: return "Hígado"
    case .腎: return "Riñón"
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
    case .es:
      return spanishName
    default:
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

  private var spanishName: String {
    switch self {
    case .膀胱: return "Vejiga"
    case .小腸: return "Intestino Delgado"
    case .胃: return "Estómago"
    case .大腸: return "Intestino Grueso"
    case .膽: return "Vesícula Biliar"
    case .三焦: return "Triple Calentador"
    }
  }
}
