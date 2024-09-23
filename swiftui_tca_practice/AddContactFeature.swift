//
//  AddCountactFeature.swift
//  swiftui_tca_practice
//
//  Created by KS on 2024/09/18.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct AddContactFeature {
    
    @ObservableState
    struct State: Equatable {
        var contact: Contact
    }

    enum Action {
        case cancelButtonTapped
        case saveButtonTapped
        case delegate(Delegate)
        case setName(String)

        enum Delegate: Equatable {
            case saveContact(Contact)
        }
    }

    @Dependency(\.dismiss) var dismiss
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .run { _ in await self.dismiss() }

            case .saveButtonTapped:
                return .run { [contact = state.contact] send in
                    await send(.delegate(.saveContact(contact)))
                    await self.dismiss()
                }

            case .delegate:
                return .none

            case let .setName(name):
                state.contact.name = name
                return .none
            }
        }
    }
}
