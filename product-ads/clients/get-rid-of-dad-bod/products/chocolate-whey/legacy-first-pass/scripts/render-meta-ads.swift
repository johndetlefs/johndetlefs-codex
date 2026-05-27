import AppKit
import Foundation

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let packet = root.appendingPathComponent("product-ads/get-rid-of-dad-bod")
let productURL = packet.appendingPathComponent("source/whey_protein_concentrate_chocolate.png")
let outputDir = packet.appendingPathComponent("generated/4x5")

guard let productImage = NSImage(contentsOf: productURL) else {
    fatalError("Could not load product image at \(productURL.path)")
}

let width: CGFloat = 1080
let height: CGFloat = 1350

struct Palette {
    static let blue = NSColor(calibratedRed: 25 / 255, green: 63 / 255, blue: 118 / 255, alpha: 1)
    static let blueDark = NSColor(calibratedRed: 16 / 255, green: 44 / 255, blue: 86 / 255, alpha: 1)
    static let yellow = NSColor(calibratedRed: 255 / 255, green: 206 / 255, blue: 24 / 255, alpha: 1)
    static let cream = NSColor(calibratedRed: 247 / 255, green: 244 / 255, blue: 237 / 255, alpha: 1)
    static let paper = NSColor(calibratedRed: 255 / 255, green: 253 / 255, blue: 248 / 255, alpha: 1)
    static let charcoal = NSColor(calibratedRed: 23 / 255, green: 23 / 255, blue: 23 / 255, alpha: 1)
    static let muted = NSColor(calibratedRed: 72 / 255, green: 69 / 255, blue: 62 / 255, alpha: 1)
    static let white = NSColor.white
}

func font(_ size: CGFloat, black: Bool = false, bold: Bool = false) -> NSFont {
    if black, let font = NSFont(name: "Arial Black", size: size) {
        return font
    }
    if bold, let font = NSFont(name: "Arial Bold", size: size) {
        return font
    }
    return NSFont.systemFont(ofSize: size, weight: black ? .black : (bold ? .bold : .regular))
}

func paragraph(alignment: NSTextAlignment = .left, lineHeight: CGFloat? = nil) -> NSMutableParagraphStyle {
    let style = NSMutableParagraphStyle()
    style.alignment = alignment
    style.lineBreakMode = .byWordWrapping
    if let lineHeight {
        style.minimumLineHeight = lineHeight
        style.maximumLineHeight = lineHeight
    }
    return style
}

func drawText(
    _ text: String,
    in rect: CGRect,
    size: CGFloat,
    color: NSColor,
    black: Bool = false,
    bold: Bool = false,
    alignment: NSTextAlignment = .left,
    lineHeight: CGFloat? = nil
) {
    let attrs: [NSAttributedString.Key: Any] = [
        .font: font(size, black: black, bold: bold),
        .foregroundColor: color,
        .paragraphStyle: paragraph(alignment: alignment, lineHeight: lineHeight)
    ]
    NSAttributedString(string: text, attributes: attrs).draw(in: rect)
}

func drawRoundedRect(_ rect: CGRect, color: NSColor, radius: CGFloat = 8, stroke: NSColor? = nil, strokeWidth: CGFloat = 0) {
    let path = NSBezierPath(roundedRect: rect, xRadius: radius, yRadius: radius)
    color.setFill()
    path.fill()
    if let stroke, strokeWidth > 0 {
        stroke.setStroke()
        path.lineWidth = strokeWidth
        path.stroke()
    }
}

func drawCircle(_ rect: CGRect, color: NSColor) {
    let path = NSBezierPath(ovalIn: rect)
    color.setFill()
    path.fill()
}

func drawLine(from: CGPoint, to: CGPoint, color: NSColor, width: CGFloat) {
    let path = NSBezierPath()
    path.move(to: from)
    path.line(to: to)
    path.lineWidth = width
    color.setStroke()
    path.stroke()
}

func drawProduct(in rect: CGRect, card: Bool = false, shadow: Bool = true) {
    if card {
        if shadow {
            NSGraphicsContext.current?.cgContext.saveGState()
            NSGraphicsContext.current?.cgContext.setShadow(offset: CGSize(width: 0, height: 18), blur: 28, color: NSColor.black.withAlphaComponent(0.20).cgColor)
        }
        drawRoundedRect(rect, color: Palette.white, radius: 8)
        if shadow {
            NSGraphicsContext.current?.cgContext.restoreGState()
        }
    }

    productImage.draw(in: rect, from: .zero, operation: .sourceOver, fraction: 1, respectFlipped: true, hints: nil)

    // The current render says "20 Servings". The approved claim for this first batch is 25 serves.
    let patch = CGRect(x: rect.minX + rect.width * 0.36, y: rect.minY + rect.height * 0.785, width: rect.width * 0.34, height: rect.height * 0.065)
    drawRoundedRect(patch, color: NSColor.white.withAlphaComponent(0.98), radius: 0)
    drawText("25 serves", in: patch.insetBy(dx: 2, dy: patch.height * 0.25), size: max(13, rect.width * 0.045), color: Palette.charcoal, black: true, alignment: .center)
}

func drawLogoChip(x: CGFloat, y: CGFloat, scale: CGFloat = 1) {
    let w: CGFloat = 255 * scale
    let h: CGFloat = 59 * scale
    drawRoundedRect(CGRect(x: x, y: y, width: w, height: h), color: Palette.yellow, radius: 8 * scale)
    drawRoundedRect(CGRect(x: x + 10 * scale, y: y + 47 * scale, width: w, height: h), color: Palette.blue, radius: 8 * scale)
    drawText("GET RID OF", in: CGRect(x: x + 18 * scale, y: y + 10 * scale, width: w - 36 * scale, height: 42 * scale), size: 31 * scale, color: Palette.blue, black: true, alignment: .center)
    drawText("DAD BOD!", in: CGRect(x: x + 28 * scale, y: y + 59 * scale, width: w - 44 * scale, height: 42 * scale), size: 31 * scale, color: Palette.yellow, black: true, alignment: .center)
}

func drawMacroCard(_ rows: [(String, String)], rect: CGRect, title: String? = nil) {
    drawRoundedRect(rect, color: NSColor.white.withAlphaComponent(0.98), radius: 8, stroke: Palette.blue.withAlphaComponent(0.18), strokeWidth: 3)
    var y = rect.minY + 22
    if let title {
        drawText(title, in: CGRect(x: rect.minX + 24, y: y, width: rect.width - 48, height: 40), size: 25, color: Palette.blue, black: true)
        y += 50
    }
    for (index, row) in rows.enumerated() {
        drawText(row.0, in: CGRect(x: rect.minX + 24, y: y, width: rect.width * 0.50, height: 34), size: 25, color: Palette.charcoal, bold: true)
        drawText(row.1, in: CGRect(x: rect.minX + rect.width * 0.52, y: y, width: rect.width * 0.35, height: 34), size: 25, color: Palette.blue, black: true, alignment: .right)
        if index < rows.count - 1 {
            drawLine(from: CGPoint(x: rect.minX + 24, y: y + 43), to: CGPoint(x: rect.maxX - 24, y: y + 43), color: NSColor.black.withAlphaComponent(0.13), width: 2)
        }
        y += 54
    }
}

func render(_ filename: String, draw: () -> Void) {
    let image = NSImage(size: CGSize(width: width, height: height))
    image.lockFocusFlipped(true)
    draw()
    image.unlockFocus()

    guard
        let tiff = image.tiffRepresentation,
        let bitmap = NSBitmapImageRep(data: tiff),
        let data = bitmap.representation(using: .png, properties: [:])
    else {
        fatalError("Could not create PNG data for \(filename)")
    }

    let destination = outputDir.appendingPathComponent(filename)
    do {
        try data.write(to: destination)
        print(destination.path)
    } catch {
        fatalError("Could not write \(destination.path): \(error)")
    }
}

func fill(_ color: NSColor) {
    color.setFill()
    NSRect(x: 0, y: 0, width: width, height: height).fill()
}

func linearBand(y: CGFloat, h: CGFloat, color: NSColor) {
    color.setFill()
    NSBezierPath(rect: CGRect(x: 0, y: y, width: width, height: h)).fill()
}

render("01-protein-during-the-cut.png") {
    fill(Palette.cream)
    drawRoundedRect(CGRect(x: -90, y: -70, width: 710, height: 460), color: Palette.yellow, radius: 8)
    drawCircle(CGRect(x: -160, y: 900, width: 520, height: 520), color: Palette.blue.withAlphaComponent(0.13))
    drawLogoChip(x: 74, y: 75, scale: 1.06)
    drawText("Cut calories.\nKeep protein\nhigh.", in: CGRect(x: 74, y: 390, width: 650, height: 360), size: 87, color: Palette.charcoal, black: true, lineHeight: 96)
    drawText("Chocolate whey for dads keeping training in the plan.", in: CGRect(x: 78, y: 780, width: 500, height: 110), size: 31, color: Palette.muted, bold: true, lineHeight: 38)
    drawProduct(in: CGRect(x: 500, y: 620, width: 525, height: 525), card: true)
    drawText("31g protein per serve", in: CGRect(x: 76, y: 1190, width: 420, height: 40), size: 28, color: Palette.blue, black: true)
}

render("02-31g-per-serve-hero.png") {
    fill(Palette.blue)
    drawRoundedRect(CGRect(x: 70, y: 70, width: 940, height: 1210), color: NSColor.clear, radius: 0, stroke: NSColor.white.withAlphaComponent(0.18), strokeWidth: 4)
    drawText("31g", in: CGRect(x: 76, y: 170, width: 600, height: 170), size: 170, color: Palette.yellow, black: true)
    drawText("protein", in: CGRect(x: 82, y: 338, width: 610, height: 132), size: 112, color: Palette.white, black: true)
    drawText("per serve", in: CGRect(x: 86, y: 480, width: 460, height: 70), size: 54, color: Palette.white.withAlphaComponent(0.88), black: true)
    drawText("Per 40g serve. Grass fed whey protein concentrate.", in: CGRect(x: 86, y: 585, width: 390, height: 140), size: 31, color: Palette.white.withAlphaComponent(0.88), bold: true, lineHeight: 38)
    drawProduct(in: CGRect(x: 500, y: 650, width: 520, height: 520), card: true)
    drawText("Chocolate / 1kg / 25 serves", in: CGRect(x: 84, y: 1215, width: 500, height: 42), size: 29, color: Palette.white.withAlphaComponent(0.75), bold: true)
}

render("03-appetite-down-protein-up.png") {
    fill(Palette.paper)
    linearBand(y: 0, h: 760, color: NSColor(calibratedRed: 251 / 255, green: 247 / 255, blue: 239 / 255, alpha: 1))
    drawCircle(CGRect(x: 78, y: 300, width: 560, height: 210), color: Palette.yellow.withAlphaComponent(0.55))
    drawText("Appetite down?\nProtein still\nmatters.", in: CGRect(x: 76, y: 120, width: 860, height: 410), size: 84, color: Palette.blueDark, black: true, lineHeight: 92)
    drawText("A simple scoop can keep the basics easier.", in: CGRect(x: 80, y: 590, width: 480, height: 115), size: 33, color: Palette.muted, bold: true, lineHeight: 40)
    drawProduct(in: CGRect(x: 465, y: 680, width: 560, height: 560), card: true)
    drawText("No medical claims. No weight-loss promise.", in: CGRect(x: 78, y: 1190, width: 560, height: 40), size: 26, color: Palette.muted, bold: true)
}

render("04-support-muscle-maintenance.png") {
    fill(NSColor(calibratedRed: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1))
    linearBand(y: 0, h: 1350, color: NSColor.clear)
    drawRoundedRect(CGRect(x: 0, y: 0, width: 520, height: 1350), color: Palette.blue, radius: 0)
    drawText("Support\nmuscle\nmaintenance.", in: CGRect(x: 72, y: 325, width: 430, height: 330), size: 69, color: Palette.white, black: true, lineHeight: 78)
    drawText("Protein contributes to the maintenance of muscle mass.", in: CGRect(x: 76, y: 710, width: 390, height: 145), size: 30, color: Palette.white.withAlphaComponent(0.88), bold: true, lineHeight: 36)
    drawProduct(in: CGRect(x: 545, y: 460, width: 470, height: 470), card: true)
    drawText("30.8g protein per serve", in: CGRect(x: 76, y: 1180, width: 410, height: 44), size: 29, color: Palette.yellow, black: true)
}

render("05-for-the-dad-routine.png") {
    fill(Palette.paper)
    linearBand(y: 975, h: 250, color: Palette.yellow.withAlphaComponent(0.28))
    drawCircle(CGRect(x: 640, y: 75, width: 310, height: 310), color: Palette.blue.withAlphaComponent(0.08))
    drawText("For the\ndad routine.", in: CGRect(x: 76, y: 300, width: 870, height: 280), size: 94, color: Palette.blue, black: true, lineHeight: 102)
    drawText("A scoop, a shaker, and one less nutrition decision.", in: CGRect(x: 80, y: 630, width: 520, height: 120), size: 34, color: Palette.muted, bold: true, lineHeight: 41)
    drawProduct(in: CGRect(x: 550, y: 700, width: 430, height: 430), card: true)
    drawText("Made in Australia", in: CGRect(x: 78, y: 1192, width: 420, height: 42), size: 30, color: Palette.blue, black: true)
}

render("06-no-hype-stack.png") {
    fill(Palette.charcoal)
    drawCircle(CGRect(x: 685, y: -60, width: 440, height: 440), color: Palette.yellow.withAlphaComponent(0.92))
    drawText("No hype\nstack.", in: CGRect(x: 76, y: 275, width: 750, height: 245), size: 104, color: Palette.white, black: true, lineHeight: 112)
    drawText("Just practical chocolate whey for the routine you can repeat.", in: CGRect(x: 80, y: 590, width: 475, height: 130), size: 34, color: Palette.white.withAlphaComponent(0.86), bold: true, lineHeight: 41)
    drawProduct(in: CGRect(x: 520, y: 660, width: 520, height: 520), card: true)
    drawText("Grass fed whey protein concentrate", in: CGRect(x: 80, y: 1200, width: 520, height: 40), size: 27, color: Palette.white.withAlphaComponent(0.72), bold: true)
}

render("07-high-protein-low-sugar.png") {
    fill(NSColor.white)
    linearBand(y: 710, h: 640, color: NSColor(calibratedRed: 244 / 255, green: 239 / 255, blue: 227 / 255, alpha: 1))
    drawText("High protein.\nLow sugar.", in: CGRect(x: 76, y: 145, width: 890, height: 230), size: 86, color: Palette.blueDark, black: true, lineHeight: 94)
    drawText("Chocolate whey with a clear macro profile.", in: CGRect(x: 80, y: 430, width: 610, height: 80), size: 33, color: Palette.muted, bold: true)
    drawMacroCard([("Protein", "30.8g"), ("Sugar", "1.2g")], rect: CGRect(x: 76, y: 830, width: 420, height: 170))
    drawProduct(in: CGRect(x: 500, y: 660, width: 530, height: 530), card: true)
}

render("08-per-40g-serve.png") {
    fill(Palette.paper)
    drawCircle(CGRect(x: 640, y: 120, width: 350, height: 350), color: Palette.yellow.withAlphaComponent(0.58))
    drawText("Per 40g\nserve.", in: CGRect(x: 76, y: 150, width: 610, height: 220), size: 89, color: Palette.blue, black: true, lineHeight: 98)
    drawMacroCard(
        [("Protein", "30.8g"), ("Fat", "2.3g"), ("Carbs", "3.2g"), ("Sugar", "1.2g")],
        rect: CGRect(x: 76, y: 590, width: 480, height: 300)
    )
    drawProduct(in: CGRect(x: 540, y: 675, width: 460, height: 460), card: true)
    drawText("Based on label nutrition panel.", in: CGRect(x: 78, y: 1190, width: 420, height: 40), size: 26, color: Palette.muted, bold: true)
}
