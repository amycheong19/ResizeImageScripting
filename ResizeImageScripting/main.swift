//
//  main.swift
//  IconResize
//
//  Created by Amy Cheong on 4/11/18.
//  Copyright © 2018 Amy Cheong. All rights reserved.
//

import Foundation
import Cocoa
import AVFoundation

//swift <filename> <inputFolderPath> <outputFolderPath> <width> <height>
let inputFolderPath = CommandLine.arguments[1]
let outputFolderPath = CommandLine.arguments[2]
let newWidth = CommandLine.arguments[3]
let newHeight = CommandLine.arguments[4]

extension NSImage {
   /// The height of the image.
   var height: CGFloat {
      return size.height
   }

   /// The width of the image.
   var width: CGFloat {
      return size.width
   }

   /// A PNG representation of the image.
   var PNGRepresentation: Data? {
      if let tiff = self.tiffRepresentation, let tiffData = NSBitmapImageRep(data: tiff) {
         return tiffData.representation(using: .png, properties: [:])
      }

      return nil
   }

   /// Scale image with aspect ratio fit at center newSize
   func scale(newSize: NSSize) -> NSImage {
      let scaledRect = AVMakeRect(aspectRatio: size,
                                  insideRect: CGRect(x: 0, y: 0, width: newSize.width,
                                                     height: newSize.height));
      let newImage = NSImage(size: newSize)
      let newY = (newSize.height - scaledRect.height) / 2
      let newX = (newSize.width - scaledRect.width) / 2
      newImage.lockFocus()
      self.draw(
         in: NSMakeRect(newX, newY, scaledRect.width, scaledRect.height),
         from: NSMakeRect(0, 0, self.width, self.height),
         operation: .sourceOver,
         fraction: 1
      )
      newImage.unlockFocus()
      newImage.size = newSize
      return newImage
   }
}


for fileName in try FileManager.default.contentsOfDirectory(atPath: inputFolderPath) {
   debugPrint(inputFolderPath + "/" + fileName)
   let imageTemplate = NSImage(byReferencingFile: inputFolderPath + "/" + fileName)!
   let width = Int(newWidth) ?? 240
   let height = Int(newHeight) ?? 240

   let resizedImage = imageTemplate.scale(newSize: NSSize(width: width / 2,
                                                          height: height / 2))
   print("Attempt to resize \(fileName)")

   let path = URL(fileURLWithPath: outputFolderPath + "/" + fileName)
   try! resizedImage.PNGRepresentation!.write(to: path)
}

