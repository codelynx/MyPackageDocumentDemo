//
//	ContentView.swift
//	Shared
//
//	Created by Kaz Yoshikawa on 2/23/22.
//

import SwiftUI

struct ContentView: View {
	@Binding var document: MyPackageDocumentAppDocument
	
	var body: some View {
		TextEditor(text: $document.text)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(document: .constant(MyPackageDocumentAppDocument()))
	}
}
