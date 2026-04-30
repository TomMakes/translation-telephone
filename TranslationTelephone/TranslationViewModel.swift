//
//  TranslationViewModel.swift
//  TranslationTelephone
//
//  Created by adminnypl on 4/28/26.
//

import Foundation
import Translation

class TranslationViewModel: ObservableObject {
    @Published var config: TranslationSession.Configuration?
}
