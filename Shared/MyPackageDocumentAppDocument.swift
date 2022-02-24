//
//	MyPackageDocumentAppDocument.swift
//	Shared
//
//  Created by Kaz Yoshikawa on 2/23/22.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
	static var mypackagedocument: UTType {
		UTType(importedAs: "com.electricwoods.mypackagedocument")
	}
}

struct MyPackageDocumentAppDocument: FileDocument {
	var text: String
	var binary: Data
	
	init(text: String = "Hello, world!") {
		self.text = text
		self.binary = (0..<1_000_000).map { _ in text }.joined().data(using: .utf8)!
	}
	
	static var readableContentTypes: [UTType] { [.mypackagedocument] }
	static var writableContentTypes: [UTType] { [.mypackagedocument] }
	static let contentsFilenameKey = "contents.txt"
	static let binaryFilenameKey = "binary.dat"
	
	init(configuration: ReadConfiguration) throws {
		guard let fileWrappers = configuration.file.fileWrappers else { throw "not a wrapper" }
		guard let textFileWrapper = fileWrappers[Self.contentsFilenameKey] else { throw "expected \(Self.contentsFilenameKey)" }
		guard let textData = textFileWrapper.regularFileContents, let string = String(data: textData, encoding: .utf8)
		else { throw "UTF8 encoded text expected in \(Self.contentsFilenameKey)" }
		guard let binaryFileWrapper = fileWrappers[Self.binaryFilenameKey] else { throw "expected \(Self.binaryFilenameKey)" }
		guard let binaryData = binaryFileWrapper.regularFileContents else { throw "some binary data expected in \(Self.binaryFilenameKey)" }
		
		text = string
		binary = binaryData
	}
	
	func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
		let fileWrappers = FileWrapper(directoryWithFileWrappers: [:])
		let textData = text.data(using: .utf8)!
		let textFile = FileWrapper(regularFileWithContents: textData)
		textFile.preferredFilename = Self.contentsFilenameKey
		fileWrappers.addFileWrapper(textFile)
		let binaryFile = FileWrapper(regularFileWithContents: self.binary)
		binaryFile.preferredFilename = Self.binaryFilenameKey
		fileWrappers.addFileWrapper(binaryFile)
		return fileWrappers
	}
}

extension String: Error {
}
