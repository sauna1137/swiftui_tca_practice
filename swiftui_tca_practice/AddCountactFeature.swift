//
//  AddCountactFeature.swift
//  swiftui_tca_practice
//
//  Created by KS on 2024/09/18.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct AddCountactFeature {
    
    @ObservableState
    struct State: Equatable {
        var contact: Contact
    }

    enum Action {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .none
            case .saveButtonTapped:
                return .none
            case let .setName(name):
                state.contact.name = name
                return .none
            }
        }
    }
}
