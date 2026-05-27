import AppKit
import Foundation

guard CommandLine.arguments.count == 3 else {
    fatalError("Usage: swift remove-green-background.swift <input.png> <output.png>")
}

let inputURL = URL(fileURLWithPath: CommandLine.arguments[1])
let outputURL = URL(fileURLWithPath: CommandLine.arguments[2])

guard let image = NSImage(contentsOf: inputURL),
      let source = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
    fatalError("Could not load input image")
}

let width = source.width
let height = source.height
let bytesPerRow = width * 4
let colorSpace = CGColorSpaceCreateDeviceRGB()
var pixels = [UInt8](repeating: 0, count: height * bytesPerRow)

guard let context = CGContext(
    data: &pixels,
    width: width,
    height: height,
    bitsPerComponent: 8,
    bytesPerRow: bytesPerRow,
    space: colorSpace,
    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
) else {
    fatalError("Could not create bitmap context")
}

context.draw(source, in: CGRect(x: 0, y: 0, width: width, height: height))

func offset(_ x: Int, _ y: Int) -> Int {
    y * bytesPerRow + x * 4
}

var minX = width
var minY = height
var maxX = 0
var maxY = 0

for y in 0..<height {
    for x in 0..<width {
        let i = offset(x, y)
        let r = CGFloat(pixels[i])
        let g = CGFloat(pixels[i + 1])
        let b = CGFloat(pixels[i + 2])

        let greenDominance = g - max(r, b)
        let isGreen = g > 130 && greenDominance > 45 && g > r * 1.35 && g > b * 1.25

        if isGreen {
            let hard = min(max((greenDominance - 45) / 85, 0), 1)
            let alpha = UInt8((1 - hard) * 255)
            pixels[i + 3] = alpha

            if alpha < 12 {
                pixels[i] = 0
                pixels[i + 1] = 0
                pixels[i + 2] = 0
                pixels[i + 3] = 0
            }
        }

        if pixels[i + 3] > 24 {
            minX = min(minX, x)
            minY = min(minY, y)
            maxX = max(maxX, x)
            maxY = max(maxY, y)
        }
    }
}

guard let transparent = context.makeImage() else {
    fatalError("Could not create transparent image")
}

let padding = 18
let cropX = max(0, minX - padding)
let cropY = max(0, minY - padding)
let cropW = min(width - cropX, maxX - minX + padding * 2)
let cropH = min(height - cropY, maxY - minY + padding * 2)
let cropRect = CGRect(x: cropX, y: cropY, width: cropW, height: cropH)

guard let cropped = transparent.cropping(to: cropRect) else {
    fatalError("Could not crop transparent image")
}

let rep = NSBitmapImageRep(cgImage: cropped)
guard let data = rep.representation(using: .png, properties: [:]) else {
    fatalError("Could not encode PNG")
}

try data.write(to: outputURL)
print(outputURL.path)
