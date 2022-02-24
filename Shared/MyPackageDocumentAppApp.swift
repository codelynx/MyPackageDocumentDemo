//
//	MyPackageDocumentAppApp.swift
//	Shared
//
//	Created by Kaz Yoshikawa on 2/23/22.
//

import SwiftUI

@main
struct MyPackageDocumentAppApp: App {
	var body: some Scene {
		DocumentGroup(newDocument: MyPackageDocumentAppDocument()) { file in
			ContentView(document: file.$document)
		}
	}
}
