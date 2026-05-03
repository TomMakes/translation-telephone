//
//  TranslationBridgeView.swift
//  TranslationTelephone
//
//  Created by Guest User on 4/23/26.
//

import Foundation
import SwiftUI
import Translation

struct TranslationBridge: View {
    @ObservedObject var viewModel: TranslationViewModel
    var onSessionReady: (TranslationSession) -> Void

    var body: some View {
        Color.clear // Invisible in your UI
            .translationTask(viewModel.config) { session in
                onSessionReady(session)
            }
    }
}
