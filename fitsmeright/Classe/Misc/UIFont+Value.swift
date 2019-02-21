//
//  UIFont+Value.swift
//  fitsmeright
//
//  Created by Sasawat Sankosik on 21/2/2562 BE.
//  Copyright © 2562 silpakorn. All rights reserved.
//



import SwifterSwift


extension UIFont {
  
  //MARK: - Implement
  struct Size {
    static let h1: CGFloat = 20.0
    static let h2: CGFloat = 18.0
    static let h3: CGFloat = 16.0
    static let h4: CGFloat = 14.0
    static let h5: CGFloat = 12.0
    static let h6: CGFloat = 10.0
  }
  
  struct Custom {
    static let none = ""
  }
  
  struct System {
    
    #if os(iOS)
    
    // MARK: Academy Engraved LET
    static let academyEngravedLetPlain = "AcademyEngravedLetPlain"
    
    // MARK: Al Nile
    static let alNile = "AlNile"
    static let alNileBold = "AlNile-Bold"
    
    #endif
    
    // MARK: American Typewriter
    static let americanTypewriter = "AmericanTypewriter"
    static let americanTypewriterBold = "AmericanTypewriter-Bold"
    static let americanTypewriterCondensed = "AmericanTypewriter-Condensed"
    static let americanTypewriterCondensedBold = "AmericanTypewriter-CondensedBold"
    static let americanTypewriterCondensedLight = "AmericanTypewriter-CondensedLight"
    static let americanTypewriterLight = "AmericanTypewriter-Light"
    static let americanTypewriterSemibold = "AmericanTypewriter-Semibold"
    
    // MARK: Apple Color Emoji
    static let appleColorEmoji = "AppleColorEmoji"
    
    // MARK: Apple SD Gothic Neo
    static let appleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
    static let appleSDGothicNeoLight = "AppleSDGothicNeo-Light"
    static let appleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
    static let appleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
    static let appleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
    static let appleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
    static let appleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
    
    #if os(iOS)
    
    // MARK: Arial
    static let arialMT = "ArialMT"
    static let arialBoldItalicMT = "Arial-BoldItalicMT"
    static let arialBoldMT = "Arial-BoldMT"
    static let arialItalicMT = "Arial-ItalicMT"
    
    #endif
    
    // MARK: Arial Hebrew
    static let arialHebrew = "ArialHebrew"
    static let arialHebrewBold = "ArialHebrew-Bold"
    static let arialHebrewLight = "ArialHebrew-Light"
    
    // Arial Rounded MT Bold
    static let arialRoundedMTBold = "ArialRoundedMTBold"
    
    // MARK: Avenir
    static let avenirBlack = "Avenir-Black"
    static let avenirBlackOblique = "Avenir-BlackOblique"
    static let avenirBook = "Avenir-Book"
    static let avenirBookOblique = "Avenir-BookOblique"
    static let avenirHeavy = "Avenir-Heavy"
    static let avenirHeavyOblique = "Avenir-HeavyOblique"
    static let avenirLight = "Avenir-Light"
    static let avenirLightOblique = "Avenir-LightOblique"
    static let avenirMedium = "Avenir-Medium"
    static let avenirMediumOblique = "Avenir-MediumOblique"
    static let avenirOblique = "Avenir-Oblique"
    static let avenirRoman = "Avenir-Roman"
    
    // MARK: Avenir Next
    static let avenirNextBold = "AvenirNext-Bold"
    static let avenirNextBoldItalic = "AvenirNext-BoldItalic"
    static let avenirNextDemiBold = "AvenirNext-DemiBold"
    static let avenirNextDemiBoldItalic = "AvenirNext-DemiBoldItalic"
    static let avenirNextHeavy = "AvenirNext-Heavy"
    static let avenirNextHeavyItalic = "AvenirNext-HeavyItalic"
    static let avenirNextItalic = "AvenirNext-Italic"
    static let avenirNextMedium = "AvenirNext-Medium"
    static let avenirNextMediumItalic = "AvenirNext-MediumItalic"
    static let avenirNextRegular = "AvenirNext-Regular"
    static let avenirNextUltraLight = "AvenirNext-UltraLight"
    static let avenirNextUltraLightItalic = "AvenirNext-UltraLightItalic"
    
    #if os(iOS)
    
    // MARK: Avenir Next Condensed
    static let avenirNextCondensedBold = "AvenirNextCondensed-Bold"
    static let avenirNextCondensedBoldItalic = "AvenirNextCondensed-BoldItalic"
    static let avenirNextCondensedDemiBold = "AvenirNextCondensed-DemiBold"
    static let avenirNextCondensedDemiBoldItalic = "AvenirNextCondensed-DemiBoldItalic"
    static let avenirNextCondensedHeavy = "AvenirNextCondensed-Heavy"
    static let avenirNextCondensedHeavyItalic = "AvenirNextCondensed-HeavyItalic"
    static let avenirNextCondensedItalic = "AvenirNextCondensed-Italic"
    static let avenirNextCondensedMedium = "AvenirNextCondensed-Medium"
    static let avenirNextCondensedMediumItalic = "AvenirNextCondensed-MediumItalic"
    static let avenirNextCondensedRegular = "AvenirNextCondensed-Regular"
    static let avenirNextCondensedUltraLight = "AvenirNextCondensed-UltraLight"
    static let avenirNextCondensedUltraLightItalic = "AvenirNextCondensed-UltraLightItalic"
    
    #endif
    
    // MARK: Baskerville
    static let baskerville = "Baskerville"
    static let baskervilleBold = "Baskerville-Bold"
    static let baskervilleBoldItalic = "Baskerville-BoldItalic"
    static let baskervilleItalic = "Baskerville-Italic"
    static let baskervilleSemiBold = "Baskerville-SemiBold"
    static let baskervilleSemiBoldItalic = "Baskerville-SemiBoldItalic"
    
    #if os(iOS)
    
    // MARK: Bodoni 72
    static let bodoniSvtyTwoITCTTBold = "BodoniSvtyTwoITCTT-Bold"
    static let bodoniSvtyTwoITCTTBook = "BodoniSvtyTwoITCTT-Book"
    static let bodoniSvtyTwoITCTTBookIta = "BodoniSvtyTwoITCTT-BookIta"
    
    // MARK: Bodoni 72 Oldstyle
    static let bodoniSvtyTwoOSITCTTBold = "BodoniSvtyTwoOSITCTT-Bold"
    static let bodoniSvtyTwoOSITCTTBook = "BodoniSvtyTwoOSITCTT-Book"
    static let bodoniSvtyTwoOSITCTTBookIt = "BodoniSvtyTwoOSITCTT-BookIt"
    
    // MARK: Bodoni 72 Smallcaps
    static let bodoniSvtyTwoSCITCTTBook = "BodoniSvtyTwoSCITCTT-Book"
    
    // MARK: Bodoni Ornaments
    static let bodoniOrnamentsITCTT = "BodoniOrnamentsITCTT"
    
    // MARK: Bradley Hand
    static let bradleyHandITCTTBold = "BradleyHandITCTT-Bold"
    
    // MARK: Chalkboard SE
    static let chalkboardSEBold = "ChalkboardSE-Bold"
    static let chalkboardSELight = "ChalkboardSE-Light"
    static let chalkboardSERegular = "ChalkboardSE-Regular"
    
    // MARK: Chalkduster
    static let chalkduster = "Chalkduster"
    
    // MARK: Cochin
    static let cochin = "Cochin"
    static let cochinBold = "Cochin-Bold"
    static let cochinBoldItalic = "Cochin-BoldItalic"
    static let cochinItalic = "Cochin-Italic"
    
    #endif
    
    // MARK: Copperplate
    static let copperplate = "Copperplate"
    static let copperplateBold = "Copperplate-Bold"
    static let copperplateLight = "Copperplate-Light"
    
    // MARK: Courier
    static let courier = "Courier"
    static let courierBold = "Courier-Bold"
    static let courierBoldOblique = "Courier-BoldOblique"
    static let courierOblique = "Courier-Oblique"
    
    // MARK: Courier New
    static let courierNewPSMT = "CourierNewPSMT"
    static let courierNewPSBoldMT = "CourierNewPS-BoldMT"
    static let courierNewPSBoldItalicMT = "CourierNewPS-BoldItalicMT"
    static let courierNewPSItalicMT = "CourierNewPS-ItalicMT"
    
    #if os(iOS)
    
    // MARK: Damascus
    static let damascus = "Damascus"
    static let damascusBold = "DamascusBold"
    static let damascusLight = "DamascusLight"
    static let damascusMedium = "DamascusMedium"
    static let damascusSemiBold = "DamascusSemiBold"
    
    // MARK: Devanagari Sangam MN
    static let devanagariSangamMN = "DevanagariSangamMN"
    static let devanagariSangamMNBold = "DevanagariSangamMN-Bold"
    
    // MARK: Didot
    static let didot = "Didot"
    static let didotBold = "Didot-Bold"
    static let didotItalic = "Didot-Italic"
    
    // MARK: Diwan Mishafi
    static let diwanMishafi = "DiwanMishafi"
    
    #endif
    
    // MARK: Euphemia UCAS
    static let euphemiaUCAS = "EuphemiaUCAS"
    static let euphemiaUCASBold = "EuphemiaUCAS-Bold"
    static let euphemiaUCASItalic = "EuphemiaUCAS-Italic"
    
    #if os(iOS)
    
    // MARK: Farah
    static let farah = "Farah"
    
    #endif
    
    // MARK: Futura
    static let futuraBold = "Futura-Bold"
    static let futuraCondensedExtraBold = "Futura-CondensedExtraBold"
    static let futuraCondensedMedium = "Futura-CondensedMedium"
    static let futuraMedium = "Futura-Medium"
    static let futuraMediumItalic = "Futura-MediumItalic"
    
    // MARK: Geeza Pro
    static let geezaPro = "GeezaPro"
    static let geezaProBold = "GeezaPro-Bold"
    
    #if os(iOS)
    // MARK: Georgia
    static let georgia = "Georgia"
    static let georgiaBold = "Georgia-Bold"
    static let georgiaBoldItalic = "Georgia-BoldItalic"
    static let georgiaItalic = "Georgia-Italic"
    
    // Gill Sans
    static let gillSans = "GillSans"
    static let gillSansBold = "GillSans-Bold"
    static let gillSansBoldItalic = "GillSans-BoldItalic"
    static let gillSansItalic = "GillSans-Italic"
    static let gillSansLight = "GillSans-Light"
    static let gillSansLightItalic = "GillSans-LightItalic"
    static let gillSansSemiBold = "GillSans-SemiBold"
    static let gillSansSemiBoldItalic = "GillSans-SemiBoldItalic"
    static let gillSansUltraBold = "GillSans-UltraBold"
    
    #endif
    
    // MARK: Gujarati Sangam MN
    static let gujaratiSangamMN = "GujaratiSangamMN"
    static let gujaratiSangamMNBold = "GujaratiSangamMN-Bold"
    
    // MARK: Gurmukhi MN
    static let gurmukhiMN = "GurmukhiMN"
    static let gurmukhiMNBold = "GurmukhiMN-Bold"
    
    // MARK: Helvetica
    static let helvetica = "Helvetica"
    static let helveticaBold = "Helvetica-Bold"
    static let helveticaBoldOblique = "Helvetica-BoldOblique"
    static let helveticaLight = "Helvetica-Light"
    static let helveticaLightOblique = "Helvetica-LightOblique"
    static let helveticaOblique = "Helvetica-Oblique"
    
    // MARK: Helvetica Neue
    static let helveticaNeue = "HelveticaNeue"
    static let helveticaNeueCondensedBlack = "HelveticaNeue-CondensedBlack"
    static let helveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
    static let helveticaNeueBold = "HelveticaNeue-Bold"
    static let helveticaNeueBoldItalic = "HelveticaNeue-BoldItalic"
    static let helveticaNeueItalic = "HelveticaNeue-Italic"
    static let helveticaNeueLight = "HelveticaNeue-Light"
    static let helveticaNeueLightItalic = "HelveticaNeue-LightItalic"
    static let helveticaNeueMedium = "HelveticaNeue-Medium"
    static let helveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
    static let helveticaNeueThin = "HelveticaNeue-Thin"
    static let helveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
    static let helveticaNeueUltraLight = "HelveticaNeue-UltraLight"
    static let helveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
    
    #if os(iOS)
    
    // MARK: Hiragino Mincho ProN
    static let hiraMinProNW3 = "HiraMinProN-W3"
    static let hiraMinProNW6 = "HiraMinProN-W6"
    
    #elseif os(tvOS)
    
    static let hiraMaruProNW4 = "HiraMaruProN-W4"
    
    #endif
    
    //  MARK:Hiragino Sans
    
    static let hiraginoSansW3 = "HiraginoSans-W3"
    
    #if os(tvOS)
    
    static let hiraginoSansW5 = "HiraginoSans-W5"
    
    #endif
    
    static let hiraginoSansW6 = "HiraginoSans-W6"
    
    #if os(iOS)
    
    //  MARK:Hoefler Text
    static let hoeflerTextBlack = "HoeflerText-Black"
    static let hoeflerTextBlackItalic = "HoeflerText-BlackItalic"
    static let hoeflerTextItalic = "HoeflerText-Italic"
    static let hoeflerTextRegular = "HoeflerText-Regular"
    
    #endif
    
    // MARK: Kailasa
    static let kailasa = "Kailasa"
    static let kailasaBold = "Kailasa-Bold"
    
    //  MARK:Kannada Sangam MN
    static let kannadaSangamMN = "KannadaSangamMN"
    static let kannadaSangamMNBold = "KannadaSangamMN-Bold"
    
    #if os(tvOS)
    
    // MARK: Kefa
    static let kefaRegular = "Kefa-Regular"
    
    #endif
    
    // MARK: Khmer Sangam MN
    static let khmerSangamMN = "KhmerSangamMN"
    
    // MARK: Kohinoor Bangla
    static let kohinoorBanglaLight = "KohinoorBangla-Light"
    static let kohinoorBanglaRegular = "KohinoorBangla-Regular"
    static let kohinoorBanglaSemibold = "KohinoorBangla-Semibold"
    
    // MARK: Kohinoor Devanagari
    static let kohinoorDevanagariLight = "KohinoorDevanagari-Light"
    static let kohinoorDevanagariRegular = "KohinoorDevanagari-Regular"
    static let kohinoorDevanagariSemibold = "KohinoorDevanagari-Semibold"
    
    // MARK: Kohinoor Telugu
    static let kohinoorTeluguLight = "KohinoorTelugu-Light"
    static let kohinoorTeluguMedium = "KohinoorTelugu-Medium"
    static let kohinoorTeluguRegular = "KohinoorTelugu-Regular"
    
    // MARK: Lao Sangam MN
    static let laoSangamMN = "LaoSangamMN"
    
    // MARK: Malayalam Sangam MN
    static let malayalamSangamMN = "MalayalamSangamMN"
    static let malayalamSangamMNBold = "MalayalamSangamMN-Bold"
    
    #if os(iOS)
    
    // MARK: Marker Felt
    static let markerFeltThin = "MarkerFelt-Thin"
    static let markerFeltWide = "MarkerFelt-Wide"
    
    #endif
    
    // MARK: Menlo
    static let menloBold = "Menlo-Bold"
    static let menloBoldItalic = "Menlo-BoldItalic"
    static let menloItalic = "Menlo-Italic"
    static let menloRegular = "Menlo-Regular"
    
    // MARK: Myanmar Sangam MN
    static let myanmarSangamMN = "MyanmarSangamMN"
    static let myanmarSangamMNBold = "MyanmarSangamMN-Bold"
    
    // MARK: Noteworthy
    static let noteworthyBold = "Noteworthy-Bold"
    static let noteworthyLight = "Noteworthy-Light"
    
    #if os(tvOS)
    
    // MARK: Noto Nastaliq Urdu
    static let notoNastaliqUrdu = "NotoNastaliqUrdu"
    
    #endif
    
    // MARK: Optima
    static let optimaBold = "Optima-Bold"
    static let optimaBoldItalic = "Optima-BoldItalic"
    static let optimaExtraBlack = "Optima-ExtraBlack"
    static let optimaItalic = "Optima-Italic"
    static let optimaRegular = "Optima-Regular"
    
    // MARK: Oriya Sangam MN
    static let oriyaSangamMN = "OriyaSangamMN"
    static let oriyaSangamMNBold = "OriyaSangamMN-Bold"
    
    // MARK: Palatino
    static let palatinoBold = "Palatino-Bold"
    static let palatinoBoldItalic = "Palatino-BoldItalic"
    static let palatinoItalic = "Palatino-Italic"
    static let palatinoRoman = "Palatino-Roman"
    
    // MARK: Papyrus
    static let papyrus = "Papyrus"
    static let papyrusCondensed = "Papyrus-Condensed"
    
    // MARK: Party LET
    static let partyLetPlain = "PartyLetPlain"
    
    // MARK: PingFang HK
    static let pingFangHKLight = "PingFangHK-Light"
    static let pingFangHKMedium = "PingFangHK-Medium"
    static let pingFangHKRegular = "PingFangHK-Regular"
    static let pingFangHKSemibold = "PingFangHK-Semibold"
    static let pingFangHKThin = "PingFangHK-Thin"
    static let pingFangHKUltralight = "PingFangHK-Ultralight"
    
    // MARK: PingFang SC
    static let pingFangSCLight = "PingFangSC-Light"
    static let pingFangSCMedium = "PingFangSC-Medium"
    static let pingFangSCRegular = "PingFangSC-Regular"
    static let pingFangSCSemibold = "PingFangSC-Semibold"
    static let pingFangSCThin = "PingFangSC-Thin"
    static let pingFangSCUltralight = "PingFangSC-Ultralight"
    
    // MARK: PingFang TC
    static let pingFangTCLight = "PingFangTC-Light"
    static let pingFangTCMedium = "PingFangTC-Medium"
    static let pingFangTCRegular = "PingFangTC-Regular"
    static let pingFangTCSemibold = "PingFangTC-Semibold"
    static let pingFangTCThin = "PingFangTC-Thin"
    static let pingFangTCUltralight = "PingFangTC-Ultralight"
    
    // MARK: Savoye LET
    static let savoyeLetPlain = "SavoyeLetPlain"
    
    // MARK: Sinhala Sangam MN
    static let sinhalaSangamMN = "SinhalaSangamMN"
    static let sinhalaSangamMNBold = "SinhalaSangamMN-Bold"
    
    // MARK: Snell Roundhand
    static let snellRoundhand = "SnellRoundhand"
    static let snellRoundhandBlack = "SnellRoundhand-Black"
    static let snellRoundhandBold = "SnellRoundhand-Bold"
    
    // MARK: Symbol
    static let symbol = "Symbol"
    
    // MARK: Tamil Sangam MN
    static let tamilSangamMN = "TamilSangamMN"
    static let tamilSangamMNBold = "TamilSangamMN-Bold"
    
    // MARK: Thonburi
    static let thonburi = "Thonburi"
    static let thonburiBold = "Thonburi-Bold"
    static let thonburiLight = "Thonburi-Light"
    
    // MARK: Times New Roman
    static let timesNewRomanPSBoldMT = "TimesNewRomanPS-BoldMT"
    static let timesNewRomanPSBoldItalicMT = "TimesNewRomanPS-BoldItalicMT"
    static let timesNewRomanPSItalicMT = "TimesNewRomanPS-ItalicMT"
    static let timesNewRomanPSMT = "TimesNewRomanPSMT"
    
    // MARK: Trebuchet MS
    static let trebuchetMS = "TrebuchetMS"
    static let trebuchetMSBold = "TrebuchetMS-Bold"
    static let trebuchetBoldItalic = "Trebuchet-BoldItalic"
    static let trebuchetMSItalic = "TrebuchetMS-Italic"
    
    // MARK: Verdana
    static let verdana = "Verdana"
    static let verdanaBold = "Verdana-Bold"
    static let verdanaBoldItalic = "Verdana-BoldItalic"
    static let verdanaItalic = "Verdana-Italic"
    
    // MARK: Zapf Dingbats
    static let zapfDingbatsITC = "ZapfDingbatsITC"
    
    // MARK: Zapfino
    static let zapfino = "Zapfino"
    
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
}
