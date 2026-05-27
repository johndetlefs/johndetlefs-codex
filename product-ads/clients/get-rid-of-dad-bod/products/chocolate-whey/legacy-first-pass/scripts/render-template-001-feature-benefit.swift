import AppKit
import Foundation

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let packet = root.appendingPathComponent("product-ads/get-rid-of-dad-bod")
let productURL = packet.appendingPathComponent("generated/assets/product-shots/whey-pack-3quarter-ai-transparent.png")
let outputDir = packet.appendingPathComponent("generated/9x16")
let assetDir = packet.appendingPathComponent("generated/assets")

let canvasWidth = 1080
let canvasHeight = 1920

struct Palette {
    static let blue = NSColor(calibratedRed: 24 / 255, green: 76 / 255, blue: 148 / 255, alpha: 1)
    static let blueDark = NSColor(calibratedRed: 13 / 255, green: 45 / 255, blue: 91 / 255, alpha: 1)
    static let blueMid = NSColor(calibratedRed: 20 / 255, green: 96 / 255, blue: 175 / 255, alpha: 1)
    static let yellow = NSColor(calibratedRed: 255 / 255, green: 205 / 255, blue: 19 / 255, alpha: 1)
    static let yellowSoft = NSColor(calibratedRed: 255 / 255, green: 225 / 255, blue: 85 / 255, alpha: 1)
    static let white = NSColor.white
    static let ink = NSColor(calibratedRed: 12 / 255, green: 27 / 255, blue: 48 / 255, alpha: 1)
}

func font(_ size: CGFloat, black: Bool = false, bold: Bool = false, serif: Bool = false) -> NSFont {
    if serif, let font = NSFont(name: "Georgia-Bold", size: size) {
        return font
    }
    if serif, let font = NSFont(name: "Times New Roman Bold", size: size) {
        return font
    }
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

func textSize(_ text: String, size: CGFloat, black: Bool = false, bold: Bool = false, serif: Bool = false, lineHeight: CGFloat? = nil) -> CGSize {
    let attrs: [NSAttributedString.Key: Any] = [
        .font: font(size, black: black, bold: bold, serif: serif),
        .paragraphStyle: paragraph(lineHeight: lineHeight)
    ]
    return NSAttributedString(string: text, attributes: attrs).boundingRect(
        with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude),
        options: [.usesLineFragmentOrigin, .usesFontLeading]
    ).size
}

func drawText(
    _ text: String,
    in rect: CGRect,
    size: CGFloat,
    color: NSColor,
    black: Bool = false,
    bold: Bool = false,
    serif: Bool = false,
    alignment: NSTextAlignment = .left,
    lineHeight: CGFloat? = nil
) {
    let attrs: [NSAttributedString.Key: Any] = [
        .font: font(size, black: black, bold: bold, serif: serif),
        .foregroundColor: color,
        .paragraphStyle: paragraph(alignment: alignment, lineHeight: lineHeight)
    ]
    NSAttributedString(string: text, attributes: attrs).draw(in: rect)
}

func drawFittedText(
    _ text: String,
    in rect: CGRect,
    startSize: CGFloat,
    minSize: CGFloat,
    color: NSColor,
    black: Bool = false,
    bold: Bool = false,
    serif: Bool = false,
    alignment: NSTextAlignment = .center
) {
    var size = startSize
    while size > minSize {
        let measured = textSize(text, size: size, black: black, bold: bold, serif: serif)
        if measured.width <= rect.width && measured.height <= rect.height {
            break
        }
        size -= 1
    }
    drawText(text, in: rect, size: size, color: color, black: black, bold: bold, serif: serif, alignment: alignment)
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

func drawStroke(_ path: NSBezierPath, color: NSColor = .white, width: CGFloat = 7, lineCap: NSBezierPath.LineCapStyle = .round) {
    color.setStroke()
    path.lineWidth = width
    path.lineCapStyle = lineCap
    path.lineJoinStyle = .round
    path.stroke()
}

func drawArrow(from start: CGPoint, c1: CGPoint, c2: CGPoint, to end: CGPoint, color: NSColor = .white) {
    let path = NSBezierPath()
    path.move(to: start)
    path.curve(to: end, controlPoint1: c1, controlPoint2: c2)
    drawStroke(path, color: color.withAlphaComponent(0.92), width: 7)

    let angle = atan2(end.y - c2.y, end.x - c2.x)
    let length: CGFloat = 28
    let wing: CGFloat = 0.72
    let left = CGPoint(x: end.x - cos(angle - wing) * length, y: end.y - sin(angle - wing) * length)
    let right = CGPoint(x: end.x - cos(angle + wing) * length, y: end.y - sin(angle + wing) * length)
    let head = NSBezierPath()
    head.move(to: left)
    head.line(to: end)
    head.line(to: right)
    drawStroke(head, color: color.withAlphaComponent(0.92), width: 7)
}

func drawArrowHead(end: CGPoint, previous: CGPoint, color: NSColor = .white) {
    let angle = atan2(end.y - previous.y, end.x - previous.x)
    let length: CGFloat = 22
    let wing: CGFloat = 0.72
    let left = CGPoint(x: end.x - cos(angle - wing) * length, y: end.y - sin(angle - wing) * length)
    let right = CGPoint(x: end.x - cos(angle + wing) * length, y: end.y - sin(angle + wing) * length)
    let head = NSBezierPath()
    head.move(to: left)
    head.line(to: end)
    head.line(to: right)
    drawStroke(head, color: color.withAlphaComponent(0.92), width: 7)
}

func drawHandArrow(points: [CGPoint], color: NSColor = .white) {
    guard points.count >= 3 else { return }
    let path = NSBezierPath()
    path.move(to: points[0])
    for point in points.dropFirst() {
        path.line(to: point)
    }
    drawStroke(path, color: color.withAlphaComponent(0.92), width: 7)
    drawArrowHead(end: points[points.count - 1], previous: points[points.count - 2], color: color)
}

func drawCurvedHandArrow(start: CGPoint, c1: CGPoint, c2: CGPoint, end: CGPoint, color: NSColor = .white) {
    let path = NSBezierPath()
    path.move(to: start)
    path.curve(to: end, controlPoint1: c1, controlPoint2: c2)
    drawStroke(path, color: color.withAlphaComponent(0.92), width: 7)
    drawArrowHead(end: end, previous: c2, color: color)
}

func drawLineIconProtein(center: CGPoint) {
    let attrs: [NSAttributedString.Key: Any] = [
        .font: NSFont(name: "Apple Color Emoji", size: 78) ?? NSFont.systemFont(ofSize: 78),
        .paragraphStyle: paragraph(alignment: .center)
    ]
    NSAttributedString(string: "💪", attributes: attrs).draw(in: CGRect(x: center.x - 55, y: center.y - 48, width: 110, height: 100))
}

func drawLineIconSugar(center: CGPoint) {
    drawRoundedRect(CGRect(x: center.x - 34, y: center.y - 28, width: 68, height: 58), color: .clear, radius: 10, stroke: .white, strokeWidth: 6)
    drawText("SUGAR", in: CGRect(x: center.x - 31, y: center.y - 4, width: 62, height: 18), size: 13, color: .white, black: true, alignment: .center)
    let slash = NSBezierPath()
    slash.move(to: CGPoint(x: center.x - 46, y: center.y + 46))
    slash.line(to: CGPoint(x: center.x + 48, y: center.y - 48))
    drawStroke(slash, width: 7)
}

func drawLineIconLeaf(center: CGPoint) {
    let path = NSBezierPath()
    path.move(to: CGPoint(x: center.x - 44, y: center.y + 22))
    path.curve(to: CGPoint(x: center.x + 42, y: center.y - 34), controlPoint1: CGPoint(x: center.x - 20, y: center.y - 48), controlPoint2: CGPoint(x: center.x + 34, y: center.y - 42))
    path.curve(to: CGPoint(x: center.x - 44, y: center.y + 22), controlPoint1: CGPoint(x: center.x + 36, y: center.y + 16), controlPoint2: CGPoint(x: center.x - 2, y: center.y + 44))
    drawStroke(path, width: 6)
    let vein = NSBezierPath()
    vein.move(to: CGPoint(x: center.x - 25, y: center.y + 16))
    vein.line(to: CGPoint(x: center.x + 31, y: center.y - 24))
    drawStroke(vein, width: 5)
}

func drawLineIconShaker(center: CGPoint) {
    let body = NSBezierPath()
    body.move(to: CGPoint(x: center.x - 24, y: center.y - 36))
    body.line(to: CGPoint(x: center.x + 26, y: center.y - 36))
    body.line(to: CGPoint(x: center.x + 36, y: center.y + 34))
    body.line(to: CGPoint(x: center.x - 34, y: center.y + 34))
    body.close()
    drawStroke(body, width: 6)
    let lid = NSBezierPath()
    lid.move(to: CGPoint(x: center.x - 32, y: center.y - 45))
    lid.line(to: CGPoint(x: center.x + 34, y: center.y - 45))
    drawStroke(lid, width: 8)
    let check = NSBezierPath()
    check.move(to: CGPoint(x: center.x - 19, y: center.y + 4))
    check.line(to: CGPoint(x: center.x - 4, y: center.y + 18))
    check.line(to: CGPoint(x: center.x + 24, y: center.y - 12))
    drawStroke(check, width: 6)
}

func drawCallout(icon: (CGPoint) -> Void, iconCenter: CGPoint, text: String, textRect: CGRect, align: NSTextAlignment = .center) {
    icon(iconCenter)
    drawText(text, in: textRect, size: 31, color: .white, black: true, alignment: align, lineHeight: 34)
}

func makeProductCutout(from url: URL) -> NSImage {
    guard let image = NSImage(contentsOf: url) else {
        fatalError("Could not load product image at \(url.path)")
    }
    return image
}

func drawProduct(_ product: NSImage, rect: CGRect) {
    guard let context = NSGraphicsContext.current?.cgContext else { return }
    context.saveGState()
    drawImageAspectFit(product, in: rect)
    context.restoreGState()
}

func drawImageAspectFit(_ image: NSImage, in rect: CGRect, fraction: CGFloat = 1) {
    let imageSize = image.size
    guard imageSize.width > 0, imageSize.height > 0 else { return }
    let scale = min(rect.width / imageSize.width, rect.height / imageSize.height)
    let drawSize = CGSize(width: imageSize.width * scale, height: imageSize.height * scale)
    let drawRect = CGRect(
        x: rect.midX - drawSize.width / 2,
        y: rect.midY - drawSize.height / 2,
        width: drawSize.width,
        height: drawSize.height
    )
    image.draw(in: drawRect, from: .zero, operation: .sourceOver, fraction: fraction, respectFlipped: true, hints: [.interpolation: NSImageInterpolation.high])
}

func drawAsset(_ relativePath: String, in rect: CGRect, rotation: CGFloat = 0, flipX: Bool = false, flipY: Bool = false) {
    let url = assetDir.appendingPathComponent(relativePath)
    guard let image = NSImage(contentsOf: url) else {
        fatalError("Could not load asset at \(url.path)")
    }
    guard let context = NSGraphicsContext.current?.cgContext else { return }
    context.saveGState()
    let transform = NSAffineTransform()
    transform.translateX(by: rect.midX, yBy: rect.midY)
    transform.rotate(byDegrees: rotation)
    transform.scaleX(by: flipX ? -1 : 1, yBy: flipY ? -1 : 1)
    transform.translateX(by: -rect.width / 2, yBy: -rect.height / 2)
    transform.concat()
    drawImageAspectFit(image, in: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
    context.restoreGState()
}

func drawGroundShadow(under rect: CGRect) {
    let base = CGRect(
        x: rect.minX - 2,
        y: rect.maxY - 30,
        width: rect.width * 0.78,
        height: 48
    )

    for layer in stride(from: 16, through: 0, by: -1) {
        let progress = CGFloat(layer) / 16
        let dx = 8 + progress * 34
        let dy = 2 + progress * 11
        let alpha = 0.012 + pow(1 - progress, 1.55) * 0.105
        let rect = base.insetBy(dx: -dx, dy: -dy)
        let path = NSBezierPath(ovalIn: rect)
        NSColor.black.withAlphaComponent(alpha).setFill()
        path.fill()
    }

    let contact = NSBezierPath(ovalIn: CGRect(x: rect.minX + 34, y: rect.maxY - 22, width: rect.width * 0.58, height: 20))
    NSColor.black.withAlphaComponent(0.10).setFill()
    contact.fill()
}

func drawBackground() {
    guard let context = NSGraphicsContext.current?.cgContext else { return }
    let colors = [Palette.blueMid.cgColor, Palette.blue.cgColor, Palette.blueDark.cgColor] as CFArray
    let locations: [CGFloat] = [0.0, 0.48, 1.0]
    let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors, locations: locations)!
    context.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: CGFloat(canvasHeight)), options: [])

    for i in stride(from: 0, through: canvasHeight, by: 70) {
        let alpha = CGFloat((i / 70) % 2 == 0 ? 0.020 : 0.012)
        drawRoundedRect(CGRect(x: -20, y: CGFloat(i), width: CGFloat(canvasWidth) + 40, height: 2), color: NSColor.white.withAlphaComponent(alpha), radius: 0)
    }
}

func render() {
    let product = makeProductCutout(from: productURL)
    let image = NSImage(size: CGSize(width: canvasWidth, height: canvasHeight))
    image.lockFocusFlipped(true)

    drawBackground()

    drawRoundedRect(CGRect(x: 65, y: 318, width: 950, height: 126), color: Palette.blueDark.withAlphaComponent(0.96), radius: 17)
    drawFittedText(
        "Muscle Support Without The Junk",
        in: CGRect(x: 88, y: 346, width: 904, height: 68),
        startSize: 53,
        minSize: 42,
        color: .white,
        serif: true
    )

    drawRoundedRect(CGRect(x: 165, y: 432, width: 750, height: 58), color: Palette.yellowSoft, radius: 8, stroke: Palette.ink.withAlphaComponent(0.28), strokeWidth: 2)
    drawFittedText(
        "A simple protein habit when appetite drops.",
        in: CGRect(x: 190, y: 450, width: 700, height: 28),
        startSize: 28,
        minSize: 21,
        color: Palette.ink,
        bold: true
    )

    let productRect = CGRect(x: 325, y: 600, width: 430, height: 645)
    drawGroundShadow(under: productRect)
    drawProduct(product, rect: productRect)

    drawAsset("icons/feature-benefit-v1/arrow-curve-up-right.png", in: CGRect(x: 200.328, y: 618.989, width: 119.819, height: 82.888), rotation: 16.206)
    drawAsset("icons/feature-benefit-v2/protein-flex-bicep.png", in: CGRect(x: 171.976, y: 699.596, width: 84.196, height: 79.43))
    drawText("31G\nPROTEIN", in: CGRect(x: 107.582, y: 791.955, width: 204.295, height: 70.916), size: 30.912, color: .white, black: true, alignment: .center, lineHeight: 30.294)

    drawAsset("icons/feature-benefit-v2/low-sugar-cube-circle-slash.png", in: CGRect(x: 814.884, y: 631.531, width: 109.33, height: 111.933))
    drawText("LOW SUGAR\nCHOCOLATE", in: CGRect(x: 768.22, y: 751.966, width: 210, height: 70), size: 28, color: .white, black: true, alignment: .center, lineHeight: 28)
    drawAsset("icons/feature-benefit-v2/arrow-down-left-curve-a.png", in: CGRect(x: 769.038, y: 819.204, width: 126.906, height: 84.033), rotation: -68.474, flipY: true)

    drawAsset("icons/feature-benefit-v2/grass-leaf.png", in: CGRect(x: 152.605, y: 950.727, width: 106, height: 90))
    drawText("GRASS FED\nWHEY", in: CGRect(x: 87.222, y: 1050.18, width: 218, height: 70), size: 28, color: .white, black: true, alignment: .center, lineHeight: 28)
    drawAsset("icons/feature-benefit-v2/arrow-down-right-curve-b.png", in: CGRect(x: 180.437, y: 1126.043, width: 118.536, height: 72.083), rotation: 56.477, flipY: true)

    drawAsset("icons/feature-benefit-v2/prep-shaker-check.png", in: CGRect(x: 836.963, y: 946.38, width: 86, height: 102))
    drawText("NO MESSY\nPREP", in: CGRect(x: 777.651, y: 1060.016, width: 200, height: 70), size: 28, color: .white, black: true, alignment: .center, lineHeight: 28)
    drawAsset("icons/feature-benefit-v2/arrow-down-left-curve-a.png", in: CGRect(x: 781.305, y: 1129.222, width: 126.669, height: 77.029), rotation: -62.423, flipY: true)

    image.unlockFocus()

    guard let tiff = image.tiffRepresentation,
          let bitmap = NSBitmapImageRep(data: tiff),
          let data = bitmap.representation(using: .png, properties: [:]) else {
        fatalError("Could not create final PNG")
    }

    let destination = outputDir.appendingPathComponent("001-feature-benefit-product-hero.png")
    do {
        try data.write(to: destination)
        print(destination.path)
    } catch {
        fatalError("Could not write \(destination.path): \(error)")
    }
}

render()
