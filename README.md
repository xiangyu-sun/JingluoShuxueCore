# JingluoShuxue

Traditional Chinese Medicine meridian data (經絡) built on
[ChineseAstrologyCalendar](https://github.com/xiangyu-sun/ChineseAstrologyCalendar).

- `十二经脉`: the twelve regular meridians with WHO abbreviations, acupoint counts,
  pathways, five shu points, yuan/luo/xi-cleft/front-mu/back-shu points, and
  tonification/sedation points
- `奇经八脉`: the eight extraordinary vessels
- `五臟` / `六腑`: organs with their Five Element, paired organ, meridian, orifice,
  tissue, colour, taste, fluid, sound, season and direction
- 子午流注 (https://zh.wikipedia.org/zh-hans/子午流注): `Dizhi.luizhu` maps each
  double-hour to the meridian at peak flow

## Installation

```swift
.package(url: "https://github.com/xiangyu-sun/JingluoShuxueCore.git", from: "1.3.0")
```

## Localization

Meridians, vessels and organs adopt ChineseAstrologyCalendar's `LocalizedNaming`:

```swift
十二经脉.手阳明大腸经.localizedName(in: .zhHant)  // "手陽明大腸經"
十二经脉.手阳明大腸经.localizedName(in: .zhHans)  // "手阳明大肠经"
十二经脉.手阳明大腸经.localizedName(in: .en)      // "Large Intestine Meridian"
十二经脉.手阳明大腸经.localizedName(in: .es)      // "Meridiano del Intestino Grueso"
十二经脉.手阳明大腸经.localizedOrganName(in: .es) // "Intestino Grueso"
五臟.腎.localizedName(in: .en)                   // "Kidney"
五臟.腎.localizedName(in: .es)                   // "Riñón"
```

Names are available in Traditional Chinese, Simplified Chinese, English and Spanish;
Russian uses the English names. `localizedOrganName(in:)` gives a meridian's organ
alone, for places too narrow for the full name. Clinical text (functions, indications,
emotions) stays in Traditional Chinese.
