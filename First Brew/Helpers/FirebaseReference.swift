//
//  FirebaseReference.swift
//  First Brew
//
//  Created by Adrien Maranville on 7/26/20.
//  Copyright © 2020 Adrien Maranville. All rights reserved.
//

import Foundation
import Firebase

enum FCollectionReference: String {
    case User
    case Menu
    case Order
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
